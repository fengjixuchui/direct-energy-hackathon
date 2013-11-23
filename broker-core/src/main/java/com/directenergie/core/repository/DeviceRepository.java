package com.directenergie.core.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.directenergie.core.model.Device;

public interface DeviceRepository extends JpaRepository<Device, Long> {

}
