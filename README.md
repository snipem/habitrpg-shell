habitrpg-shell
==============

Linux, OSX and Windows command line interface for HabitRPG

Feature set
 * List all tasks (uncommented)
 * Add new todo as defined in first parameter

Usage on Linux or OSX
---------------------
Use `./habitrpg-shell.bash todoName` 

Usage on Windows
----------------
Use `habitrpg-shell.bat todoName` (Work in progress)

Build process
-------------
habitrpg-shell is created with batsh (https://github.com/BYVoid/Batsh) a batch file compiler. Habitrpg-shell is compiled with a Python script that takes advantage of their webservice at batsh.org.
If you want to edit both the batch files, always edit the batsh source.
