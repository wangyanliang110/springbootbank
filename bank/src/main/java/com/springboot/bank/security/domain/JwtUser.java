package com.springboot.bank.security.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.Date;
import java.util.List;

/**
 * 安全服务的用户
 * 需要实现 UserDetails 接口，用户实体类即为 Spring Security 所使用的用户
 */
public class JwtUser implements UserDetails {
    private final Integer id;
    private final String username;
    private final String password;
    private final String email;
    private final Collection<? extends GrantedAuthority> authorities;
    private final boolean enabled;
    private final Date lastPasswordResrtDate;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date loginDate;

    public JwtUser(Integer id,
                   String username,
                   String password,
                   String email,
                   Collection<? extends GrantedAuthority> authorities,
                   boolean enabled,
                   Date lastPasswordResrtDate,
                   Date loginDate) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.authorities = authorities;
        this.enabled = enabled;
        this.lastPasswordResrtDate = lastPasswordResrtDate;
        this.loginDate = loginDate;
    }

    @JsonIgnore
    public Integer getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return authorities;
    }

    @JsonIgnore
    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public String getUsername() {
        return username;
    }

    @JsonIgnore
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @JsonIgnore
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @JsonIgnore
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return enabled;
    }

    @JsonIgnore
    public Date getLastPasswordResrtDate() {
        return lastPasswordResrtDate;
    }

    public Date getLoginDate() {
        return loginDate;
    }
}
