package co.uk.aejuk.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.validator.constraints.NotBlank;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Data
@NoArgsConstructor
@ToString(exclude={"member"})
@Table(name="payment")
public class Payment {

	
	@Id
	@GeneratedValue
	private Long id;
	
	@ManyToOne
	//@JoinColumn(name="member_id")
	private Member member;

	@NotBlank
	private String year;

	private Double jan;

	private Double feb;
	
	private Double mar;
	
	private Double apr;
	
	private Double may;
	
	private Double jun;
	
	private Double jul;
	
	private Double aug;
	
	private Double sep;
	
	private Double oct;
	
	private Double nov;
	
	@Column(name="dece")
	private Double dec;
	
	@Transient
	private Double total;

	
	public Double getTotal() {
		return safeDouble(jan) + safeDouble(feb) + safeDouble(mar) + safeDouble(apr) + safeDouble(may) + safeDouble(jun) + safeDouble(jul) + safeDouble(aug) + safeDouble(sep) + safeDouble(oct) + safeDouble(nov) + safeDouble(dec);
	}


	public Double safeDouble(Double number) {
		if (number == null)
			return 0.0;
		else 
			return number;
	}


	public Payment(Member member) {
		super();
		this.member = member;
	}




	
}
