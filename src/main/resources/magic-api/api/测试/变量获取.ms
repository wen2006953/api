{
  "properties" : { },
  "id" : "31964bcc95624097b1b94f1f7c38b4c2",
  "script" : null,
  "groupId" : "51b8e2f8af6c4e06b298f545e7abbdc9",
  "name" : "变量获取",
  "createTime" : 1749628275783,
  "updateTime" : 1749796959949,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "get",
  "method" : "GET",
  "parameters" : [ ],
  "options" : [ ],
  "requestBody" : "",
  "headers" : [ ],
  "paths" : [ ],
  "responseBody" : "{\n    \"code\": 1,\n    \"message\": \"success\",\n    \"data\": [\n        \"Config resource 'class path resource [application.yml]' via location 'optional:classpath:/'-->{server.port=9999, server.servlet.context-path=/aaa, server.compression.enabled=true, server.compression.min-response-size=128, spring.jackson.date-format=yyyy-MM-dd HH:mm:ss, spring.jackson.time-zone=GMT+8, spring.datasource.url=jdbc:mysql://192.168.30.26/api?useSSL=false&useUnicode=true&characterEncoding=UTF8&serverTimezone=Asia/Shanghai, spring.datasource.username=root, spring.datasource.password=123456, magic-api.web=/magic/web, magic-api.resource.location=D:/home/magic-api, magic-api.task.thread-name-prefix=magic-task-, magic-api.task.pool.size=8, magic-api.task.shutdown.awaitTermination=false, magic-api.task.shutdown.awaitTerminationPeriod=10s}\"\n    ],\n    \"timestamp\": 1749796892712,\n    \"executeTime\": 5\n}",
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
      "value" : "",
      "description" : "",
      "required" : false,
      "dataType" : "Array",
      "type" : null,
      "defaultValue" : null,
      "validateType" : "",
      "error" : "",
      "expression" : "",
      "children" : [ {
        "name" : "",
        "value" : "MapPropertySource {name='server.ports'}",
        "description" : "",
        "required" : false,
        "dataType" : "String",
        "type" : null,
        "defaultValue" : null,
        "validateType" : "",
        "error" : "",
        "expression" : "",
        "children" : [ ]
      } ]
    }, {
      "name" : "timestamp",
      "value" : "1749793708239",
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
      "value" : "3",
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
import org.springframework.core.env.ConfigurableEnvironment

List list = new ArrayList()
for(idx,ps in ConfigurableEnvironment.getPropertySources()) {
    if(ps.getName().startsWith('Config')) {
        list.add(ps.getName() + '-->' + ps.getSource())
    }
}
return list