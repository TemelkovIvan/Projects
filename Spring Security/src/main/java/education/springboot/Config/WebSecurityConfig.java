package education.springboot.Config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    private final UserDetailsService userDetailsService;

    @Autowired
    public WebSecurityConfig(UserDetailsService userDetailsService) {
        this.userDetailsService = userDetailsService;
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/new-user","/info").permitAll()
                .antMatchers("/log").hasRole("ADMIN")
                .anyRequest().authenticated()
        .and().formLogin()
                .loginPage("/login").permitAll()
                    .passwordParameter("password")
                    .usernameParameter("name")
                    .defaultSuccessUrl("/list-educations")
        .and().logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/login")
                .invalidateHttpSession(true)
                .deleteCookies("JSESSIONID")
                .permitAll()
        .and().rememberMe()
                .rememberMeParameter("remember")
                .rememberMeCookieName("rememberMeCookie")
                .key("e9a4572e-9ffa-4288-8c98-28a8fef6e208")
                .tokenValiditySeconds(10000)
                .userDetailsService(userDetailsService)
        .and().exceptionHandling()
                .accessDeniedPage("/access-denied")
        .and().userDetailsService(userDetailsService);


    }

    @Override
    public void configure(WebSecurity web) throws Exception {
        web
                .ignoring()
                .antMatchers("/webjars/**");
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

}
