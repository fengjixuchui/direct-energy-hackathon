package com.directenergie.core.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.PropertySource;

@Configuration
@Import(CoreConfiguration.class)
@PropertySource("broker-core-test.properties")
public class CoreTestConfiguration {

}
