<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<jsp:include page="/layout/menu.jsp"></jsp:include>
	<title>테스트 샘플 파일</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<input type="text" placeholder="1~15입력(pk값)" v-model =productNo>
		<button @click = "fnGetList">검색</button>
		<template v-if="isView"> 
			<div>{{info.productNo}}</div>
			<div>{{info.productName}}</div>
			<div v-if ="isEditing">
				<input type="text" v-model="productPrice"> 
				<button @click="fnUpdate">저장</button>
			</div>
			<div v-else>{{info.productPrice}}</div>
			<button @click="saveChanges">수정</button>
			<button @click="fnDelect">삭제</button>
		</template>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				productNo : "",
				info : [],
				data : [],
				productPrice : "",
				isEditing : false,
				isView : false
            };
        },
        methods: {
            fnGetList(){
				var self = this;
				var nparmap = {
					productNo : this.productNo,
					productPrice : this.productPrice
				};
				$.ajax({
					url:"test.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data.test);
						self.info = data.test;
						self.isView = true;
					}
				});
            },
			saveChanges() {
			  this.isEditing = true; // 제품 가격 업데이트
		  },
			fnDelect(){
				var self = this;
				var nparmap = {
					productNo : this.productNo
				};
				$.ajax({
					url:"delect.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						alert(data.message);
						console.log("test=>", data.message);
						self.isView = false;
						
						
						
					}
				});
            },
			fnUpdate(){
				var self = this;
				var nparmap = {
					productNo : this.productNo,
					productPrice : this.productPrice
				};
				$.ajax({
					url:"update.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						alert(data.message);
						console.log(data);
						self.isEditing = false;
						self.fnGetList();
					}
				});
            }
        },
        mounted() {
			
        }
    });
    app.mount('#app');
</script>
​