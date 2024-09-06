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
		<input type="text" placeholder="과일명 입력" v-model=productName>
		<button @click = "fnSearch">검색</button>
			
		<table>
			<tr>
				<th>number</th>
				<th>과일명</th>
				<th>가격</th>
			</tr>
			<tr v-for="item in list">
				<td>{{item.productNo}}</td>
				<td>{{item.productName}}</td>
				<td>{{item.productPrice}}</td>
			</tr>
		</table>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				list : [],
				productPrice : ""
            };
        },
        methods: {
			fnGetList(){
				var self = this;
				var nparmap = {
				};
				$.ajax({
					url:"testList.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) {
						self.list = data.test;
						console.log(data);
					};	
				});
            },
            fnSearch(){
				var self = this;
				var nparmap = {
				};
				$.ajax({
					url:"testList.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data.test);
					}
				});
            }			
        },
        mounted() {
			var self = this;
			self.fnGetList();
        }
    });
    app.mount('#app');
</script>
​