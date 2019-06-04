package com.cmower.common.base;

import java.security.SecureRandom;
import java.util.UUID;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

/**
 * 封装生成唯一 ID 的方法
 * 
 * @author MengChengdu
 *
 */

@Service
@Lazy(false)
public class IdGen {
	private static SecureRandom random = new SecureRandom();

	/**
	 * 封装JDK自带的UUID, 通过Random数字生成
	 * @return
	 */
	public static String uuid() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	/**
	 * 使用SecureRandom随机生成Long.
	 * @return
	 */
	public static long randomLong() {
		return Math.abs(random.nextLong());
	}
}
