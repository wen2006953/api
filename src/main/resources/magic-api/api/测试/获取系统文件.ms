{
  "properties" : { },
  "id" : "1c88dbd629a14fb9ae5c45874cfc19f8",
  "script" : null,
  "groupId" : "51b8e2f8af6c4e06b298f545e7abbdc9",
  "name" : "获取系统文件",
  "createTime" : 1749797001038,
  "updateTime" : 1749798158754,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "file",
  "method" : "GET",
  "parameters" : [ ],
  "options" : [ ],
  "requestBody" : "",
  "headers" : [ ],
  "paths" : [ ],
  "responseBody" : "{\n    \"code\": 1,\n    \"message\": \"success\",\n    \"data\": \"[BDT]11:13:33.125 [SpringApplicationShutdownHook] INFO  sys-user - [shutdownAsyncManager,27] - ====关闭后台任务任务线程池====\",\n    \"timestamp\": 1749797991508,\n    \"executeTime\": 2\n}",
  "description" : null,
  "requestBodyDefinition" : null,
  "responseBodyDefinition" : {
    "name" : "",
    "value" : "",
    "description" : "",
    "required" : false,
    "dataType" : "Object",
    "type" : null,
    "defaultValue" : null,
    "validateType" : "",
    "error" : "",
    "expression" : "",
    "children" : [ {
      "name" : "code",
      "value" : "1",
      "description" : "",
      "required" : false,
      "dataType" : "Integer",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "message",
      "value" : "success",
      "description" : "",
      "required" : false,
      "dataType" : "String",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "data",
      "value" : "[BDT]11:13:33.125 [SpringApplicationShutdownHook] INFO  sys-user - [shutdownAsyncManager,27] - ====关闭后台任务任务线程池====",
      "description" : "",
      "required" : false,
      "dataType" : "String",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "timestamp",
      "value" : "1749797991508",
      "description" : "",
      "required" : false,
      "dataType" : "Long",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    }, {
      "name" : "executeTime",
      "value" : "2",
      "description" : "",
      "required" : false,
      "dataType" : "Integer",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ ]
    } ]
  }
}
================================
import java.nio.file.Paths
import java.nio.file.Files
import response

var path = Paths.get("/home/temp.pdf")
var file = Files.readAllBytes(path)

return response.download(file, "temp.pdf")
