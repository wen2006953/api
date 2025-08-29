package org.ssssssss.example;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.script.ScriptEngine;
import javax.script.ScriptException;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.commons.lang3.StringUtils;
import org.ssssssss.script.MagicScriptEngineFactory;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

import cn.hutool.core.io.resource.InputStreamResource;
import cn.hutool.core.map.MapUtil;
import cn.hutool.http.HttpUtil;

public class MagicTest {

    public static void main(String[] args) throws Exception {
        uploadImg();
    }
    
    public static void uploadImg() throws IOException {
        String uploadUrl = "http://nimg.dev.suhan.cn/1061/upload";
        URL url = new URL("http://easyapi.admin.suhan.cn/easyapi/yw/cs/down?name=99b8fe667f567feb0e46968552663fe7.jpg");
        Map<String, Object> params = MapUtil.of("userfile", new InputStreamResource(url.openStream(), "000.jpg"));
        String res = HttpUtil.post(uploadUrl, params);
        System.out.println(res);
    }
    
    public static String parseXml(String xmlStr) throws Exception {
        if(StringUtils.isBlank(xmlStr) || !xmlStr.startsWith("<?xml") && !xmlStr.startsWith("<msg")) {
            return xmlStr;
        }
        ByteArrayInputStream inputStream = new ByteArrayInputStream(xmlStr.getBytes());
        Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(inputStream);
        NodeList titleNodes = document.getElementsByTagName("title");
        String text = titleNodes.getLength() > 0 ? titleNodes.item(0).getTextContent() : "";
        NodeList ctts = document.getElementsByTagName("content");
        String refTxt = ctts.getLength() > 0 ? ctts.item(ctts.getLength() - 1).getTextContent() : "";

        if(StringUtils.isBlank(refTxt) && StringUtils.isBlank(text)) return "<图片>";
        return parseXml(refTxt) + "  \n------  \n" + text;  
    }
    
	public static void testScriptEngine() throws ScriptException {
		MagicScriptEngineFactory factory = new MagicScriptEngineFactory();
		ScriptEngine engine = factory.getScriptEngine();
		String script = "'2025-06-30 13:52:12'::date('yyyy-MM-dd HH:mm:ss')";
		Object eval = engine.eval(script);
		System.out.println(eval);
	}
}
