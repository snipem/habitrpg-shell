set !taskName!=%1
@echo off
setlocal EnableDelayedExpansion
setlocal EnableExtensions

rem Set your userId and apiToken here
set userId=SET_USER_ID_HERE
set apiToken=SET_API_TOKEN_HERE
rem Set your proxy here
rem TODO Net yet implemented
set proxyHost=
set proxyPort=
rem Set your curl path here
set curlPath=/usr/bin/curl
rem API options
set apiEndpoint=https://habitrpg.com:443/api/v2/
set _0=!taskName!
call :newTask _1 0 _0
echo | set /p ^=!_1!
rem getTasks();

goto :EOF
:newTask
set taskName_%~2=!%~3!
set message_%~2=Adding new task ^'!taskName_%~2!^'
echo !request!
echo !message_%~2!
set parameter1_%~2=^'text^=!taskName_%~2!^'
set parameter2_%~2=^'type^=todo^'
set _3_%~2=!parameter2_%~2!
set _2_%~2=!parameter1_%~2!
set _1_%~2=user/tasks
set _0_%~2=POST
set /a _5_%~2=^(1 + %~2^)
call :apiRequest _6_%~2 !_5_%~2! _0_%~2 _1_%~2 _2_%~2 _3_%~2
set _4_%~2=!_6_%~2!
echo !_4_%~2!

goto :EOF
:getTasks
set _3_%~2=
set _2_%~2=
set _1_%~2=user/tasks
set _0_%~2=GET
set /a _5_%~2=^(1 + %~2^)
call :apiRequest _6_%~2 !_5_%~2! _0_%~2 _1_%~2 _2_%~2 _3_%~2
set _4_%~2=!_6_%~2!
echo !_4_%~2!

goto :EOF
:apiRequest
set method_%~2=!%~3!
set action_%~2=!%~4!
set parameter1_%~2=!%~5!
set parameter2_%~2=!%~6!
set url_%~2=!apiEndpoint!!action_%~2!
set apiKeyHeader_%~2=x-api-key: !apiToken!
set apiUserHeader_%~2=x-api-user: !userId!
echo Accessing !url_%~2!
echo With parameters !parameter1_%~2!!parameter2_%~2!
rem TODO Add Proxy functionality
for /f "delims=" %%i in ('curl !proxyLine! -s -H !apiKeyHeader_%~2! -H !apiUserHeader_%~2! -X !method_%~2! -d !parameter1_%~2! -d !parameter2_%~2! !url_%~2!') do set response_%~2=%%i
set %~1=!response_%~2!
goto :EOF