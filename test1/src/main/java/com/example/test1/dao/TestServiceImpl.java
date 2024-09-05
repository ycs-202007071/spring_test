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
		resultMap.put("list", test);
		System.out.println("service" + test);
		return resultMap;
	}

	@Override
	public HashMap<String, Object> testDrop(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		testMapper.testDelete(map);
		try {
			resultMap.put("massage", "삭제됨");
		} catch (Exception e) {
			resultMap.put("massage", "오류");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> testAdd(HashMap<String, Object> map) {
		System.out.println("insert" + map);
		HashMap<String, Object> resultMap = new HashMap<>();
		testMapper.testInsert(map);
		try {
			resultMap.put("massage", "등록됨");
		} catch (Exception e) {
			resultMap.put("massage", "오류");
		}
		return resultMap;
	}

	

}
