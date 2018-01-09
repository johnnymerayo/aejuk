package co.uk.aejuk.security;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	private static final String USERS_QUERY = "select username,password, enabled from users where username=?";
	private static final String ROLES_QUERY =
			"select u.username, r.authority  from users u, authority r, users_authority rfu where u.id = rfu.users_id and rfu.authorities_id = r.id and u.username = ? ";

	@Autowired
	private DataSource dataSource;


	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	public SessionRegistry sessionRegistry() {
		return new SessionRegistryImpl();
	}

	@Autowired
	public void globalUserDetails(final AuthenticationManagerBuilder auth) throws Exception {
		// @formatter:off
    		auth.jdbcAuthentication().dataSource(this.dataSource)
			.usersByUsernameQuery(USERS_QUERY)
			.authoritiesByUsernameQuery(ROLES_QUERY)
			.passwordEncoder(new BCryptPasswordEncoder());
    }// @formatter:on



    @Override
    protected void configure(final HttpSecurity http) throws Exception {
        // @formatter:off
        http.authorizeRequests()
        	.antMatchers("/static/**").permitAll()
            .antMatchers("/login").permitAll()
            .antMatchers("/admin").hasRole("ADMIN")
            .anyRequest().authenticated()
            .and().formLogin().loginPage("/login")//.loginProcessingUrl("/j_spring_security_check")
            .permitAll()
            //.and().logout().logoutUrl("/j_spring_security_logout")
            .and().csrf().disable()
           ;
            ;
        // @formatter:on
    }
	
//    @Override
//    public void configure(WebSecurity web) throws Exception {
//        web
//                .ignoring()
//                .antMatchers("/static/**");
//    }
	
}
