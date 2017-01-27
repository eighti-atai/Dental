package com.atai.dental.module.enterp.service;

public interface SecurityService {
    String findLoggedInUsername();

    void autologin(String username, String password);
}
