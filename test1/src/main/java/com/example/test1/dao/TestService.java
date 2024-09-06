package com.example.test1.dao;

import java.util.HashMap;

public interface TestService {
	
	HashMap<String, Object> searchProdectNo(HashMap<String, Object>  map);
	HashMap<String, Object> testDrop(HashMap<String, Object> map);
	HashMap<String, Object> testAdd(HashMap<String, Object> map);
	HashMap<String, Object> testPlus(HashMap<String, Object> map);
	HashMap<String, Object> searchList(HashMap<String, Object> map);
	
}
