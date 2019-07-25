package com.atai.dental.module.enterp.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.security.core.userdetails.User;

@Service
public class SecurityServiceImpl implements SecurityService{
    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private UserService userObject;
    
    @Autowired
    private UserRoleService userRoleObject;
    
    private static final Logger logger = LoggerFactory.getLogger(SecurityServiceImpl.class);

    @Transactional
    public String findLoggedInUsername() {
        Object userDetails = SecurityContextHolder.getContext().getAuthentication().getDetails();
        User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String name = user.getUsername(); //get logged in username
        System.out.println("********************************** "+ name);
        if (userDetails instanceof UserDetails) {
            return ((UserDetails)userDetails).getUsername();
        }

        return null;
    }

    @Transactional
    public String findLoggedInUsernameCustome() {
        User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String name = user.getUsername(); //get logged in username
        //int id = ((Object) user).getUserId();
        //userObject
        com.atai.dental.module.enterp.model.User userD = userObject.findByUsername(name);
        com.atai.dental.module.enterp.model.UserRole userRole = userRoleObject.getByKey(userD.getId());
        System.out.println("UUUUUUUUUUUUUUUUUUUUUUUUUUUUU"+ userRole.getRoleId());
        
        
        
        return name;
    }
    
    @Transactional
    public Integer findLoggedInUsernameRole() {
        User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String name = user.getUsername(); //get logged in username
        //int id = ((Object) user).getUserId();
        //userObject
        com.atai.dental.module.enterp.model.User userD = userObject.findByUsername(name);
        com.atai.dental.module.enterp.model.UserRole userRole = userRoleObject.getByKey(userD.getId());
        System.out.println("UUUUUUUUUUUUUUUUUUUUUUUUUUUUU"+ userRole.getRoleId());
        
        
        
        return userRole.getRoleId();
    }
    
    @Transactional
    public void autologin(String username, String password) {
        UserDetails userDetails = userDetailsService.loadUserByUsername(username);
        UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(userDetails, password, userDetails.getAuthorities());

        authenticationManager.authenticate(usernamePasswordAuthenticationToken);

        if (usernamePasswordAuthenticationToken.isAuthenticated()) {
            SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);
            logger.debug(String.format("Auto login %s successfully!", username));
        }
    }
}
