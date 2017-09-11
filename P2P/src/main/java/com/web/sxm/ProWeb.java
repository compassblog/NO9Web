package com.web.sxm;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.entity.sxm.Pro;

import com.service.sxm.ProService;
@Controller
@RequestMapping("/pro")
public class ProWeb {
	@Autowired
	ProService pService;
	/**
	 * 
	    * @Title: selectPro 页面加载自动运行  
	    * @Description:   
	    * @param @return    
	    * @return List      
	    * @throws
	 */
	@RequestMapping(value="/selectPro.do")
	@ResponseBody
	public List selectPro(@RequestBody Pro p){
		List<Object> pList =pService.selectProject(p);
		//response.setCharacterEncoding("utf-8");
		return pList;

	}
	
}
