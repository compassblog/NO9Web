package com.entity.ly;

public class Project {
	int projectsid;
	int empid;//项目发起人
	int originatortype;//项目类型（个人或机构）
	int projectsstate;//项目状态
	int approver;//审批人
	public int getApprover() {
		return approver;
	}
	public void setApprover(int approver) {
		this.approver = approver;
	}
	public int getProjectsid() {
		return projectsid;
	}
	public void setProjectsid(int projectsid) {
		this.projectsid = projectsid;
	}
	public int getEmpid() {
		return empid;
	}
	public void setEmpid(int empid) {
		this.empid = empid;
	}
	public int getOriginatortype() {
		return originatortype;
	}
	public void setOriginatortype(int originatortype) {
		this.originatortype = originatortype;
	}
	public int getProjectsstate() {
		return projectsstate;
	}
	public void setProjectsstate(int projectsstate) {
		this.projectsstate = projectsstate;
	}
	
}
