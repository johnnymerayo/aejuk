package co.uk.aejuk.repository;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import co.uk.aejuk.entity.Area;
import co.uk.aejuk.entity.Member;
import co.uk.aejuk.entity.Status;

@Repository
public interface StatusRepository extends JpaRepository<Status, String> {



}


