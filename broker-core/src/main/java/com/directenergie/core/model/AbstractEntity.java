package com.directenergie.core.model;

import java.io.Serializable;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.PreUpdate;
import javax.persistence.Version;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import org.hibernate.annotations.Type;
import org.joda.time.DateTime;

@MappedSuperclass
@Getter
@Setter
@ToString
@EqualsAndHashCode
public class AbstractEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	protected final Long id;

	@Version
	protected int version;

	@Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
	private DateTime creationDate = new DateTime();

	@Type(type = "org.jadira.usertype.dateandtime.joda.PersistentDateTime")
	private DateTime modifiedDate = new DateTime();

	protected AbstractEntity() {
		this.id = null;
	}

	@PreUpdate
	public void updateLastModifiedDate() {
		modifiedDate = new DateTime();
	}

}
