package co.uk.aejuk.repository;

import java.util.Collection;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import co.uk.aejuk.entity.Member;
import co.uk.aejuk.entity.Payment;

@Repository
public interface PaymentRepository extends JpaRepository<Payment, Long> {

	// /user/search/by-name?rn=xxxxxxx
	List<Payment> findByMember(Member member);
	
	


}


