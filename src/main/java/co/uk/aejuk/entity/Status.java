package co.uk.aejuk.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;

import lombok.Data;

@Entity
@Data
@Table(name = "status")
public class Status {

	@Id
	private String id;

	@NotBlank
	@Column(unique = true)
	private String name;

	
}
