package pl.coderslab.xconfig;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig  {


    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }



//    @Bean
//    public InMemoryUserDetailsManager userDetailsManager(){
//        UserDetails user1 = User.withUsername("user1")
//                .password(bCryptPasswordEncoder().encode("user1Pass"))
//                .roles("USER")
//                .build();
//        return new InMemoryUserDetailsManager(user1);
//    }


    @Bean
    protected SecurityFilterChain configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/create-user").permitAll()
                .antMatchers("/create-roles").permitAll()
                .antMatchers("/driver/**").hasAnyAuthority("Admin", "User", "Dispatch")
                .antMatchers("/admin/**").hasAnyAuthority("Admin")
                .antMatchers("/dispatch/**").hasAnyAuthority("Admin", "Dispatch")
                .antMatchers(HttpMethod.POST, "/delete/{id}").permitAll()
                .and().formLogin().loginPage("/login")
                .and().logout().logoutSuccessUrl("/")
                .permitAll()
                .and().exceptionHandling().accessDeniedPage("/403");
        return http.build();
    }


}
