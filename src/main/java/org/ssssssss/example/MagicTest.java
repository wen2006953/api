package org.ssssssss.example;

import javax.script.ScriptEngine;
import javax.script.ScriptException;

import org.ssssssss.script.MagicScriptEngineFactory;

public class MagicTest {

	public static void main(String[] args) throws ScriptException {
		MagicScriptEngineFactory factory = new MagicScriptEngineFactory();
		ScriptEngine engine = factory.getScriptEngine();
		String script = "'2025-06-30 13:52:12'::date('yyyy-MM-dd HH:mm:ss')";
		Object eval = engine.eval(script);
		System.out.println(eval);
	}
}
