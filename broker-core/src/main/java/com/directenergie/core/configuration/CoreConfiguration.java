package com.directenergie.core.configuration;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages = { "com.directenergie.core.services" })
public class CoreConfiguration {

}
