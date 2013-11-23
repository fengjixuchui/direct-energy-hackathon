package com.directenergie.api.configuration;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.directenergie.core.configuration.CoreConfiguration;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = { "com.directenergie.api.controller" })
@Import(CoreConfiguration.class)
@PropertySource("broker-api.properties")
public class ApiConfiguration {

}
