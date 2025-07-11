{
  "properties" : { },
  "id" : "bc04272a73da48bb961c88778f79b8b9",
  "script" : null,
  "groupId" : "93b42cd8442847009de622eda9eb474a",
  "name" : "一秒一次",
  "createTime" : 1748944995081,
  "updateTime" : 1749005584492,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "scd",
  "cron" : "1/1 * * * * ?",
  "enabled" : false,
  "description" : null
}
================================
import java.time.LocalDateTime
import "@get:/test/update" as update

var id = 1
var name = LocalDateTime.now()::string

return update()