package com.atai.dental.module.enterp.service;

public interface SecurityService {
    String findLoggedInUsername();
    String findLoggedInUsernameCustome();
    void autologin(String username, String password);
    Number findLoggedInUsernameRole();
}
