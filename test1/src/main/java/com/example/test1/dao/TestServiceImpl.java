package com.example.test1.dao;

import java.io.Console;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.TestMapper;
import com.example.test1.model.Test;

@Service
public class TestServiceImpl implements TestService{

	@Autowired
	TestMapper testMapper;

	@Override
	public HashMap<String, Object> searchProdectNo(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		Test test = testMapper.testList(map);
		resultMap.put("test", test);
		return resultMap;
	}

	@Override
	public HashMap<String, Object> testDrop(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			testMapper.testDelete(map);
			resultMap.put("message", "삭제됨");
		} catch (Exception e) {
			resultMap.put("message", "오류");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> testAdd(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		System.out.println("insert" + map);
		try {
			testMapper.testInsert(map);
			resultMap.put("message", "등록됨");
		} catch (Exception e) {
			resultMap.put("message", "오류");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> testPlus(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		try {
			testMapper.testUpdate(map);
			resultMap.put("message", "수정됨");
		} catch (Exception e) {
			resultMap.put("message", "오류");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		List<Test> list = testMapper.testGetList(map);
		resultMap.put("list", list);
		return null;
	}

	

}
