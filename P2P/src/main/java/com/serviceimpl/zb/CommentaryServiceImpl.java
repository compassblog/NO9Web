package com.serviceimpl.zb;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.zb.CommentaryDao;
import com.entity.zb.Commentary;
import com.service.zb.CommentaryService;
/**
 * 
 * @ClassName:  CommentaryServiceImpl   
 * @Description:TODO(评论的业务层)   
 * @author: 朱彬
 * @date:   2017年9月4日 下午4:19:34   
 *     
 * @Copyright: 2017 www.tydic.com Inc. All rights reserved. 
 *
 */
@Service
public class CommentaryServiceImpl implements CommentaryService {
	@Autowired
	CommentaryDao cdao;
	
	@Override
	public List<Object> queryCommentary() {
		// TODO Auto-generated method stub
		return cdao.queryCommentary();
	}

	@Override
	public int addCommentary(Commentary commentary) {
		// TODO Auto-generated method stub
		return cdao.addCommentary(commentary);
	}

	public int deleteCommentary(int id) {
		// TODO Auto-generated method stub
		return cdao.deleteCommentary(id);
	}

	@Override
	public int deleteComment(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
