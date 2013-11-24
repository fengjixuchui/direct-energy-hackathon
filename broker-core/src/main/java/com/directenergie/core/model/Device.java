package com.directenergie.core.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToOne;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
public class Device extends AbstractEntity {

	private static final long serialVersionUID = 1L;

	private boolean inUse;

	private long ijenkoId;
	
	@OneToOne(cascade=CascadeType.ALL)
	private DeviceDefinition deviceDefinition;

}
 