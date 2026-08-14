package com.brightnest.gymmanagementsystem.config;

import com.brightnest.gymmanagementsystem.service.CustomUserDetailsService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.annotation.web.configurers.HeadersConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@RequiredArgsConstructor
@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class WebSecurityConfig {

    private final CustomUserDetailsService customUserDetailsService;
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {
        return httpSecurity
//                .csrf(AbstractHttpConfigurer::disable)
                .csrf(csrf -> csrf
                        .ignoringRequestMatchers("/h2-console/**",
                                "/product/v1/**",
                                "/payment/**")
                )
                .headers(headersConfigurer -> headersConfigurer
                        .frameOptions(HeadersConfigurer.FrameOptionsConfig::disable))
                .authorizeHttpRequests(authorizeRequests ->authorizeRequests
                                .requestMatchers(
                                        "/",
                                        "/home",
                                        "/about",
                                        "/contact",
                                        "/403",
                                        "/404",
                                        "/500"
                                ).permitAll()

                                .requestMatchers(
                                        "/css/**",
                                        "/js/**",
                                        "/images/**",
                                        "/webjars/**",
                                        "/uploads/**"
                                ).permitAll()

                                .requestMatchers("/login/**", "/register").permitAll()

                                .requestMatchers("/h2-console/**").permitAll()

//                                .requestMatchers("/admin/blog/**").authenticated()
//                                .requestMatchers("/admin/blogs").authenticated()
//
//                                .requestMatchers("/admin/gallery/**").authenticated()
//                                .requestMatchers("/admin/exercise/**").authenticated()
//
//                                .requestMatchers("/admin/**").hasRole("ADMIN")

                                .requestMatchers(
                                        "/admin/blog/**",
                                        "/admin/blogs",
                                        "/admin/gallery/**",
                                        "/admin/exercise/**"
                                ).authenticated()

                                .requestMatchers("/admin/**")
                                .hasRole("ADMIN")

//                                .requestMatchers("/admin/**").hasRole("ADMIN")
                                .requestMatchers("/profile/**").hasAnyRole("USER","ADMIN","TRAINER","MEMBER")
                                .requestMatchers("/trainer/**").hasRole("TRAINER")
                        .requestMatchers("/member/**")
                        .hasAnyRole("USER","MEMBER")
//                                .requestMatchers("/member/**").hasRole("MEMBER")
                                .requestMatchers("/user/**").hasRole("USER")
                                .requestMatchers("/product/v1/**").permitAll()
//                                .requestMatchers("/admin/classes/create").permitAll()

                                .anyRequest().permitAll()
                )

                .formLogin(formLoginConfigurer -> formLoginConfigurer
                        .loginPage("/login")
                        .usernameParameter("email")
                        .failureUrl("/login?error=true")
                        .defaultSuccessUrl("/dashboard",true)
                )
                .logout(logoutConfigurer -> logoutConfigurer
                        .logoutUrl("/logout")
                        .logoutSuccessUrl("/login?logout=true")
                        .invalidateHttpSession(true)
                        .clearAuthentication(true)
                        .permitAll()
                )
                .exceptionHandling(exception -> exception
                        .accessDeniedPage("/403")
                )
                .userDetailsService(customUserDetailsService)
                .build();
    }
}
