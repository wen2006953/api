{
  "properties" : { },
  "id" : "64d62c302efc4bae8aee1e9c588f7456",
  "script" : null,
  "groupId" : "51b8e2f8af6c4e06b298f545e7abbdc9",
  "name" : "解析Xml",
  "createTime" : 1750656262429,
  "updateTime" : 1751512582985,
  "lock" : null,
  "createBy" : null,
  "updateBy" : null,
  "path" : "readXml",
  "method" : "POST",
  "parameters" : [ {
    "name" : "xml",
    "value" : "<?xml version=\"1.0\"?> <msg>     <appmsg>         <title><![CDATA[@NJ-查查这个号码无记录哈]]></title>         <des />         <type>57</type>         <appattach>             <cdnthumbaeskey />             <aeskey></aeskey>         </appattach>         <refermsg>             <type>1</type>             <svrid><![CDATA[2759545102387687782]]></svrid>             <fromusr><![CDATA[9223372042139460303@chatroom]]></fromusr>             <chatusr><![CDATA[wxid_lrnh9mjrmspj12]]></chatusr>             <displayname><![CDATA[NJ-查查]]></displayname>             <content><![CDATA[13297965133  2025-06-18 11:07:14  催话费 加急  停机了]]></content>         </refermsg>     </appmsg>     <fromusername><![CDATA[25984984360815553@openim]]></fromusername>     <scene>0</scene>     <appinfo>         <version>1</version>         <appname />     </appinfo>     <commenturl /> </msg>",
    "description" : null,
    "required" : true,
    "dataType" : "String",
    "type" : null,
    "defaultValue" : null,
    "validateType" : null,
    "error" : null,
    "expression" : null,
    "children" : null
  } ],
  "options" : [ ],
  "requestBody" : "",
  "headers" : [ ],
  "paths" : [ ],
  "responseBody" : "{\n    \"code\": 1,\n    \"message\": \"success\",\n    \"data\": \"13842098861 2025-06-18 12:48:44 密码369369 未到账，麻烦核实  \\n------  \\n这单客户提供了服务密码的，麻烦核实是否到账 是否返销呢 ？给下核实的客服工号   \\n------  \\n00772025061812580175318832475991\\n这个给了0077的流水  \\n------  \\n缴费记录核实过了吗  是到账的吗 ？\",\n    \"timestamp\": 1750756670440,\n    \"executeTime\": 131\n}",
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
      "value" : "13842098861 2025-06-18 12:48:44 密码369369 未到账，麻烦核实  \n------  \n这单客户提供了服务密码的，麻烦核实是否到账 是否返销呢 ？给下核实的客服工号   \n------  \n00772025061812580175318832475991\n这个给了0077的流水  \n------  \n缴费记录核实过了吗  是到账的吗 ？",
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
      "value" : "1750756670440",
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
      "value" : "131",
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
import java.io.ByteArrayInputStream
import javax.xml.parsers.DocumentBuilderFactory
import org.w3c.dom.Document
import org.w3c.dom.NodeList

var getTxt = xmlStr => {
    if(is_blank(xmlStr) || !xmlStr.startsWith('<?xml')) {
        return xmlStr
    }
    ByteArrayInputStream inputStream = new ByteArrayInputStream(xmlStr.getBytes());
    Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(inputStream);

    
    String text = document.getElementsByTagName("title").item(0).getTextContent();
    NodeList ctts = document.getElementsByTagName("content");
    String refTxt = ctts.item(ctts.getLength() - 1).getTextContent();

    return getTxt(refTxt) + '  \n------  \n' + text
}

return getTxt(xml)