package com.atai.dental.module.enterp.model;

import javax.persistence.*;

//import org.hibernate.mapping.List;

import java.util.Set;
import java.util.HashSet;
import java.util.List;
import com.atai.dental.module.enterp.model.Role;
import com.atai.dental.module.enterp.model.User;

@Entity
@Table(name = "user_tab")
public class User {
	@Id
	@Column(name = "user_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    private int userId;
	
	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	@Column(name = "user_name", unique=true, nullable=false)
    private String userName;
	
	@Column(name = "password", nullable=false)
    private String password;
	
	@Column(name = "name", nullable=false)
    private String name;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Transient
    private String passwordConfirm;
	
	@Column(name="state", nullable=false)
    private String state=State.ACTIVE.getState();
	
	@ManyToMany
    @JoinTable(name = "user_role_tab", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> userRoles = new HashSet<Role>();
   
    public int getId() {
        return userId;
    }

    public void setId(int id) {
        this.userId = id;
    }

    public String getUsername() {
        return userName;
    }

    public void setUsername(String username) {
        this.userName = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }

    public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
    
    public Set<Role> getRoles() {
        return userRoles;
    }

    public void setRoles(Set<Role> roles) {
        this.userRoles = roles;
    }
    
    @Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + userId;
		result = prime * result + ((userName == null) ? 0 : userName.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof User))
			return false;
		User other = (User) obj;
		if (userId != other.userId)
			return false;
		if (userName == null) {
			if (other.userName != null)
				return false;
		} else if (!userName.equals(other.userName))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "User [id=" + userId + ", userName=" + userName + ", password=" + password
				 + ", state=" + state + ", userRole=" + userRoles +"]";
	}

}
