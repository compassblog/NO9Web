package com.web.ljl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.entity.ljl.PerProLjl;
import com.entity.ljl.ProjectsLjl;
import com.entity.ljl.UserLjl;
import com.service.ljl.ProjectsServiceLjl;
/**
 * 发起项目
 */
@Controller
@RequestMapping("/ProjectsController")
public class ProjectsController {
	
	@Autowired
	ProjectsServiceLjl projectsServiceLjl;
	/**
	 * 查询项目类型
	 */
	@RequestMapping("/AllProjectsType")
	public void AllProjectsType(HttpServletResponse response){
		String str=projectsServiceLjl.AllProjectsType();
		response.setHeader("Content-type", "text/html;charset=UTF-8");  
		System.out.println(str);
		try {
			response.getWriter().write(str);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 查询用户项目
	 */
	@RequestMapping("/AllProjects")
	public String AllProjects(@RequestBody UserLjl user,HttpServletRequest request,HttpServletResponse response){
		response.setHeader("Content-type", "text/html;charset=UTF-8");  
		System.out.println("getEmpid"+user.getEmpid());
		String str= projectsServiceLjl.AllProjects(user);
		System.out.println("str"+str);
		try {
			response.getWriter().write(str);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
		
	}
	/**
	 * 保存更新项目
	 */
	@RequestMapping("/SaveProjects")
	@ResponseBody
	public String SaveProjects(ProjectsLjl proLjl,HttpServletRequest request,HttpServletResponse response){
		System.out.println("55");
		String str=projectsServiceLjl.SaveProjects(proLjl);
		int Projectsid= proLjl.getProjectsid();
		//System.out.println(str);
		if (str=="success"){
			//System.out.println("444");
			return Projectsid+"";
		}
		return str;
		
	}
	/**
	 * 删除项目
	 */
	@RequestMapping("/DelProjects")
	@ResponseBody
	public String DelProjects(ProjectsLjl proLjl){
		String str=projectsServiceLjl.DelProjects(proLjl);
		return str;
	}
	
}
