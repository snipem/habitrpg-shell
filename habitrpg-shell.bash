taskName=$1
# Set your userId and apiToken here
userId="SET_USER_ID_HERE"
apiToken="SET_API_TOKEN_HERE"
#Set your proxy here
#TODO Net yet implemented
proxyHost=""
proxyPort=""
# Set your curl path here
curlPath="/usr/bin/curl"
# API options
apiEndpoint="https://habitrpg.com:443/api/v2/"
function newTask {
  local message
  local taskName
  local parameter2
  local parameter1
  taskName="$1"
  message="Adding new task '""$taskName""'"
  "echo" "-e" "$request"
  "echo" "-e" "$message"
  parameter1="'text=""$taskName""'"
  parameter2="'type=todo'"
  "echo" "-e" $("apiRequest" "POST" "user/tasks" "$parameter1" "$parameter2")
}
function getTasks {
  "echo" "-e" $("apiRequest" "GET" "user/tasks" "" "")
}
function apiRequest {
  local url
  local response
  local parameter2
  local apiUserHeader
  local method
  local action
  local parameter1
  local apiKeyHeader
  method="$1"
  action="$2"
  parameter1="$3"
  parameter2="$4"
  url="$apiEndpoint""$action"
  apiKeyHeader="x-api-key: ""$apiToken"
  apiUserHeader="x-api-user: ""$userId"
  "echo" "-e" "Accessing ""$url"
  "echo" "-e" "With parameters ""$parameter1""$parameter2"
  # TODO Add Proxy functionality
  response=$("curl" "$proxyLine" "-s" "-H" "$apiKeyHeader" "-H" "$apiUserHeader" "-X" "$method" "-d" "$parameter1" "-d" "$parameter2" "$url")
  "echo" "-ne" "$response"
  return
}
"newTask" "$taskName"
#getTasks();