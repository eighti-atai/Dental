package com.atai.dental.module.enterp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.transaction.annotation.Transactional;

import com.atai.dental.module.enterp.dao.UserDao;
import com.atai.dental.module.enterp.model.Role;
import com.atai.dental.module.enterp.model.User;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class UserDetailsServiceImpl implements UserDetailsService{
    private UserDao userDao;

    @Autowired
    private UserService userService;
    
    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    		User user = userService.findByUsername(username);
    		System.out.println("User : "+user);
    		if(user==null){
    			System.out.println("User not found");
    			throw new UsernameNotFoundException("Username not found");
    		}
    			return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), 
    				 user.getState().equals("Active"), true, true, true, getGrantedAuthorities(user));
    	}

    	
    	private List<GrantedAuthority> getGrantedAuthorities(User user){
    		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
    		
    		for(Role userRole : user.getRoles()){
    			System.out.println("UserProfile : "+userRole);
    			authorities.add(new SimpleGrantedAuthority("ROLE_"+userRole.getName()));
    		}
    		System.out.print("authorities :"+authorities);
    		return authorities;
    	}
}