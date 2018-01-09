package co.uk.aejuk.entity;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.NonNull;

@Entity
@Data
@Table(name = "users")
@EntityListeners(AuditingEntityListener.class)
public class User {

	/**
	 *
	 */
	private static final long serialVersionUID = 1748508728260838232L;

	@Id
	@GeneratedValue
	private Long id;

	@NotBlank
	@Column(unique = true)
	private String username;

	@NotBlank
	// @JsonIgnore
	private String password;

	@Email
	@Column(unique = true)
	private String email;

	private String firstName;

	private String lastName;

	private boolean enabled = true;

	@NotNull
	@CreatedDate
	private Date creationDate;

	@LastModifiedDate
	private Date lastModified;

	private LocalDateTime lastLogin;

	@JsonIgnore
	@ManyToMany(fetch = FetchType.EAGER)
	private List<Authority> authorities;


	public User() {
		super();
		this.enabled = false;
	}

	public Collection<Authority> getAuthorities() {
		if (this.authorities == null)
			return Collections.emptyList();
		return this.authorities;
	}

	public void addAuthority(Authority authority) {
		if (this.authorities == null)
			this.authorities = new ArrayList<>();
		this.authorities.add(authority);
	}

	public boolean hasAuthority(@NonNull String authority) {
		return this.hasAuthority(new Authority(authority));
	}

	public boolean hasAuthority(@NonNull Authority authority) {
		return !this.getAuthorities().isEmpty() && this.getAuthorities().contains(authority);
	}

	public void clearPassword() {
		this.password = null;
	}

}
