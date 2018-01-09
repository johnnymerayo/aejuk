package co.uk.aejuk.repository;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import co.uk.aejuk.entity.Member;

@Repository
public interface MemberRepository extends JpaRepository<Member, Long> {

	// /user/search/by-name?rn=xxxxxxx
	Collection<Member> findBySex(@Param("sex") String sex);
	
	


}


