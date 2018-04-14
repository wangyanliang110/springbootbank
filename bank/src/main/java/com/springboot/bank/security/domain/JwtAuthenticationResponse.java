package com.springboot.bank.security.domain;

import java.io.Serializable;

/**
 * 已授权用户(令牌)响应给客户端
 */

public class JwtAuthenticationResponse implements Serializable {
    private final String token;//令牌

    public JwtAuthenticationResponse(String token) {
        this.token = token;
    }

    public String getToken() {
        return token;
    }
}
