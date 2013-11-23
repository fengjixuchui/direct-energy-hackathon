package com.directenergie.core.configuration;

import java.util.Properties;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.hibernate.ejb.HibernatePersistence;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;

import com.directenergie.core.model.Constants;

@Configuration
@ComponentScan(basePackages = { "com.directenergie.core.services" })
@EnableJpaRepositories(basePackages = { "com.directenergie.core.repository" })
public class CoreConfiguration {

	@Inject
	private Environment environment;

	@Bean
	public DataSource dataSource() {
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName(environment.getRequiredProperty(Constants.PROPERTY_DATABASE_DRIVER));
		dataSource.setUrl(environment.getRequiredProperty(Constants.PROPERTY_NAME_DATABASE_URL));
		dataSource.setUsername(environment.getRequiredProperty(Constants.PROPERTY_NAME_DATABASE_USERNAME));
		dataSource.setPassword(environment.getRequiredProperty(Constants.PROPERTY_NAME_DATABASE_PASSWORD));
		return dataSource;
	}

	@Bean
	public LocalContainerEntityManagerFactoryBean entityManagerFactory() throws ClassNotFoundException {
		LocalContainerEntityManagerFactoryBean entityManagerFactoryBean = new LocalContainerEntityManagerFactoryBean();

		entityManagerFactoryBean.setDataSource(dataSource());
		entityManagerFactoryBean.setPackagesToScan("com.directenergie.core.model");
		entityManagerFactoryBean.setPersistenceProviderClass(HibernatePersistence.class);

		Properties jpaProperties = new Properties();
		jpaProperties.put(Constants.PROPERTY_NAME_HIBERNATE_DIALECT,
				environment.getRequiredProperty(Constants.PROPERTY_NAME_HIBERNATE_DIALECT));
		jpaProperties.put(Constants.PROPERTY_NAME_HIBERNATE_FORMAT_SQL,
				environment.getRequiredProperty(Constants.PROPERTY_NAME_HIBERNATE_FORMAT_SQL));
		jpaProperties.put(Constants.PROPERTY_NAME_HIBERNATE_NAMING_STRATEGY,
				environment.getRequiredProperty(Constants.PROPERTY_NAME_HIBERNATE_NAMING_STRATEGY));
		jpaProperties.put(Constants.PROPERTY_NAME_HIBERNATE_SHOW_SQL,
				environment.getRequiredProperty(Constants.PROPERTY_NAME_HIBERNATE_SHOW_SQL));
		jpaProperties.put(Constants.PROPERTY_NAME_HIBERNATE_HBM2DDL,
				environment.getRequiredProperty(Constants.PROPERTY_NAME_HIBERNATE_HBM2DDL));

		entityManagerFactoryBean.setJpaProperties(jpaProperties);

		return entityManagerFactoryBean;
	}

	@Bean
	public PlatformTransactionManager transactionManager() {
		return new JpaTransactionManager();
	}
}
