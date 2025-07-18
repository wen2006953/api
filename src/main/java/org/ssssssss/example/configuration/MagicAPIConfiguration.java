package org.ssssssss.example.configuration;

import java.nio.charset.StandardCharsets;
import java.util.Collections;

import javax.sql.DataSource;

import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.http.MediaType;
import org.springframework.http.client.ClientHttpRequestFactory;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.client.RestTemplate;
import org.ssssssss.example.interceptor.CustomRequestInterceptor;
import org.ssssssss.example.interceptor.CustomUIAuthorizationInterceptor;
import org.ssssssss.example.provider.CustomJsonValueProvider;
import org.ssssssss.example.provider.CustomLanguageProvider;
import org.ssssssss.example.provider.CustomMapperProvider;
import org.ssssssss.example.provider.CustomPageProvider;
import org.ssssssss.example.provider.CustomSqlCache;
import org.ssssssss.example.scripts.CustomFunction;
import org.ssssssss.example.scripts.CustomFunctionExtension;
import org.ssssssss.example.scripts.CustomModule;
import org.ssssssss.magicapi.datasource.model.MagicDynamicDataSource;
import org.ssssssss.magicapi.modules.db.provider.PageProvider;
import org.ssssssss.magicapi.modules.http.HttpModule;

/**
 * magic-api 配置类
 * 以下只配置了多数据源
 * 其它如果有需要可以自行放开 // @Bean 注释查看效果
 */
@Configuration
public class MagicAPIConfiguration {

	/**
	 * 配置多数据源
	 *
	 * @see org.ssssssss.magicapi.datasource.model.MagicDynamicDataSource
	 */
	@Bean
	public MagicDynamicDataSource magicDynamicDataSource(DataSource dataSource) {
		MagicDynamicDataSource dynamicDataSource = new MagicDynamicDataSource();
		dynamicDataSource.setDefault(dataSource); // 设置默认数据源
		dynamicDataSource.add("slave", dataSource);
		return dynamicDataSource;
	}
	
    private RestTemplate template() {
        SimpleClientHttpRequestFactory factory = new SimpleClientHttpRequestFactory();
        factory.setReadTimeout(500);
        factory.setConnectTimeout(500);
        
        RestTemplate template = new RestTemplate();
        template.setRequestFactory(factory);
        template.getMessageConverters().add(new StringHttpMessageConverter(StandardCharsets.UTF_8) {
            {
                setSupportedMediaTypes(Collections.singletonList(MediaType.ALL));
            }

            @Override
            public boolean supports(Class<?> clazz) {
                return true;
            }
        });
        return template;
    }
	@Bean
    public HttpModule httpModule() {
        return new HttpModule(template());
    }


	/**
	 * 配置自定义JSON结果
	 */
	// @Bean
	public CustomJsonValueProvider customJsonValueProvider() {
		return new CustomJsonValueProvider();
	}

	/**
	 * 配置分页获取方式
	 */
	// @Bean
	public PageProvider pageProvider() {
		return new CustomPageProvider();
	}

	/**
	 * 自定义UI界面鉴权
	 */
	// @Bean
	public CustomUIAuthorizationInterceptor customUIAuthorizationInterceptor() {
		return new CustomUIAuthorizationInterceptor();
	}

	/**
	 * 自定义请求拦截器（鉴权）
	 */
	// @Bean
	public CustomRequestInterceptor customRequestInterceptor() {
		return new CustomRequestInterceptor();
	}

	/**
	 * 自定义SQL缓存
	 */
	// @Bean
	public CustomSqlCache customSqlCache() {
		return new CustomSqlCache();
	}

	/**
	 * 自定义函数
	 */
	// @Bean
	public CustomFunction customFunction() {
		return new CustomFunction();
	}

	/**
	 * 自定义方法扩展
	 */
	// @Bean
	public CustomFunctionExtension customFunctionExtension() {
		return new CustomFunctionExtension();
	}

	/**
	 * 自定义模块
	 */
	// @Bean
	public CustomModule customModule() {
		return new CustomModule();
	}

	/**
	 * 自定义脚本语言
	 */
	// @Bean
	public CustomLanguageProvider customLanguageProvider() {
		return new CustomLanguageProvider();
	}

	/**
	 * 自定义列名转换
	 */
	// @Bean
	public CustomMapperProvider customMapperProvider() {
		return new CustomMapperProvider();
	}

}
