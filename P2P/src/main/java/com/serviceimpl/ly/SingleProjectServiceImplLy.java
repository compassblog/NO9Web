package com.serviceimpl.ly;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.ly.ProjectsDaoLy;
import com.dao.ly.SingleProjectDaoLy;
import com.service.ly.SingleProjectServiceLy;
@Service
public class SingleProjectServiceImplLy implements SingleProjectServiceLy{
	@Autowired
	SingleProjectDaoLy singleProjectDaoLy;
	@Autowired 
	ProjectsDaoLy projects;
	public List<Object> selectpro() {
		// TODO Auto-generated method stub
		return singleProjectDaoLy.selectProject();
	}
	@Autowired
	public List<Object> selprojects() {
		// TODO Auto-generated method stub
		return projects.selproject();
	}
	
}