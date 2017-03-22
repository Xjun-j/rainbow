package com.rainbow.model.user;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="role")
@Table(name="t_role")
public class Role implements Serializable {
    
	private static final long serialVersionUID = -5522379323693011913L;
	
	private int id;
    private String role;
    @Id
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getRole() {
        return role;
    }
    public void setRole(String role) {
        this.role = role;
    }
}
