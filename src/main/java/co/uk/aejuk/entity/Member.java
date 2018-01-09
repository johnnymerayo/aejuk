package co.uk.aejuk.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;
import lombok.ToString;

@Entity
@Data
@ToString(exclude={"payments"})
@Table(name="member")
@EntityListeners(AuditingEntityListener.class)
public class Member {

	@Id
	@GeneratedValue
	private Long id;

	@NotBlank
	private String name;

	@NotBlank
	private String surname;
	
//	@DateTimeFormat(iso=ISO.DATE)
	@DateTimeFormat(pattern = "dd MMMM yyyy")
	private Date dateOfBirth;
	
	private String sex;

	private String phone;
	
	private String mobile;
	
	private String address;
	
	private String city;
	
	private String postCode;

	@OneToOne
	private Area area;
	
	
	@OneToMany(mappedBy="member")
	private List<Payment> payments;
	
	private boolean registrationFeePaid;
	
	@OneToOne
	private Status status;
	
	private String notes;
	
//	@NotNull
	@CreatedDate
	@Column(updatable=false)
	@DateTimeFormat(pattern = "dd MMMM yyyy")
	private Date creationDate;

	@LastModifiedDate
	private Date lastModified;

//	@Override
//	public String toString() {
//		return "Member [id=" + id + ", name=" + name + ", surname=" + surname + ", dateOfBirth=" + dateOfBirth
//				+ ", sex=" + sex + ", phone=" + phone + ", movile=" + movile + ", address=" + address + ", city=" + city
//				+ ", postCode=" + postCode + ", area=" + area + ", registrationFeePaid=" + registrationFeePaid
//				+ ", status=" + status + ", notes=" + notes + ", creationDate=" + creationDate + ", lastModified="
//				+ lastModified + "]";
//	}
//	
//	
	
}
