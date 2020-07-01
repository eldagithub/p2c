package com.p2c.auth;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Administrator
 */
@Entity
@Table(name="Group")
public class Group implements Serializable{
    private static final long serialVersionUID = -2722005617166945195L;

    private Long idgroup;
    private String groupname;
    private String adminpermission;
    private String editpermission;
    private String modpermission;

    @Column(name="adminpermission")
    public String getAdminpermission() {
        return adminpermission;
    }

    public void setAdminpermission(String adminpermission) {
        this.adminpermission = adminpermission;
    }
    @Column(name="editpermission")
    public String getEditpermission() {
        return editpermission;
    }

    public void setEditpermission(String editpermission) {
        this.editpermission = editpermission;
    }
    @Column(name="groupname")
    public String getGroupname() {
        return groupname;
    }

    public void setGroupname(String groupname) {
        this.groupname = groupname;
    }
    @Id
    @GeneratedValue
    @Column (name="idgroup")
    public Long getIdgroup() {
        return idgroup;
    }

    public void setIdgroup(Long idgroup) {
        this.idgroup = idgroup;
    }
    @Column(name="modpermission")
    public String getModpermission() {
        return modpermission;
    }

    public void setModpermission(String modpermission) {
        this.modpermission = modpermission;
    }

}