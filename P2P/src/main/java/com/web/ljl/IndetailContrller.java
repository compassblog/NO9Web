package com.web.ljl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.entity.ljl.DescribeLjl;
import com.entity.ljl.IndetailLjl;
import com.entity.ljl.IndetailPhotoLjl;
import com.entity.ljl.ProjectsLjl;
import com.entity.ljl.ReturnLjl;
import com.service.Tool.FileUploadService;
import com.service.ljl.IndetailServiceLjl;

@Controller
@RequestMapping("/IndetailContrller")
public class IndetailContrller {
	@Autowired
	IndetailServiceLjl IndetailService;
	@Autowired
	FileUploadService SaveCover;
	@RequestMapping("/SvaeText")
	//保存项目详细文本
	@ResponseBody
	public String SvaeText(@RequestBody String str){
		System.out.println(str);
		JSON json=JSONObject.parseObject(str);
		Map map =(Map)json;
		int flag =IndetailService.SvaeText(map);
		//System.out.println(map);
		if(flag==1){
			return "success";
			
		}
		return "err";
	}
	//保存项目详细图片
	@RequestMapping(value="/SvaePhoto",produces = "application/json;charset=utf-8")
	@ResponseBody
	public Map SvaePhoto(@RequestParam("file_data") MultipartFile myfile,IndetailPhotoLjl IndetailPhoto) throws IllegalStateException, IOException{
		System.out.println("qweqe");
		Map map=SaveCover.SaveFile(myfile);
		IndetailService.SvaePhoto(map,IndetailPhoto);
		System.out.println(map);
		System.out.println(IndetailPhoto.getPlaces());
		System.out.println(IndetailPhoto.getProjectsid());
		//map=DescribeService.SaveCover(map, describe);
		return map;
		
	}
	//查询项目详细内容
	@RequestMapping(value="/AllIndetail",produces = "application/json;charset=utf-8")
	@ResponseBody
	public List AllIndetail(@RequestBody ProjectsLjl projects ){
		System.out.println(projects.getProjectsid());
		List list=IndetailService.AllIndetail(projects);
		System.out.println(list);
		return list;
		
	}
	//删除项目详情文本和图片
	@RequestMapping(value="/DeleteIndetail",produces = "application/json;charset=utf-8")
	@ResponseBody
	public int DeleteIndetail(@RequestBody IndetailLjl indetail){
		System.out.println(indetail.getProjectsid());
		System.out.println(indetail.getPlaces());
		System.out.println(indetail.getChoice());
		int flag =IndetailService.DeleteIndetail(indetail);
		return flag;
		
		
	}
}
