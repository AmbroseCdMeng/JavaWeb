package com.cmower.dal;

import java.util.HashMap;
import java.util.Map;

public class BaseEntity<T> {

	protected Map<String, Object> map = new HashMap<String, Object>();
	
	@SuppressWarnings("unchecked")
	public T put(String key, Object value) {
		map.put(key, value);
		return (T)this; 
	}
	
	@SuppressWarnings("unchecked")
	public <M> M get(String attr) {
		return (M)(map.get(attr));
	}
	
	public Map<String, Object> getMap(){
		return map;
	}
	
	public void setMap(Map<String, Object> map) {
		this.map = map;
	}
}
