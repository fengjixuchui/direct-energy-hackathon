package com.directenergie.core.model;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
public class DeviceDefinition extends AbstractEntity {

	private static final long serialVersionUID = 1L;

	private String name;

	@Enumerated(EnumType.STRING)
	private DeviceType type;

	private String estimatedAnnualSavings;

}
