package com.cmower.database.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cmower.dal.BaseMapper;
import com.cmower.database.entity.Users;

/**
 * Mapper 接口文件加载映射文件 遵循以下规范： 
 * 1、Mapper 接口的类路径与 mapper.xml 文件中的命名空间相同 
 * 2、Mapper 接口方法名与 mapper.xml 文件中定义的每个映射语句的 id 相同 
 * 3、Mapper 接口方法的输入参数类型和 mapper.xml 中定义的每个映射语句的 parameterType 的类型相同 
 * 4、Mapper 接口方法的输出参数类型和 mapper.xml 中定义的每个映射语句的 resultType 的类型相同
 * 
 * @author MengChengdu
 *
 */
public interface UserMapper extends BaseMapper<Users, Long> {

	/* 增、删、改、查 为最常用的基本方法，所以将其抽离封装到 BaseMapper 接口中 */
	/*
	 * Long insert(Users model);
	 * 
	 * Long delete(Long modelPK);
	 * 
	 * Long update(Users model);
	 * 
	 * Users select(Long modelPK);
	 */
	
	Users selectOne(@Param(value="username")String username);
	
}
