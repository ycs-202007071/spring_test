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
		<div>{{list.productNo}}</div>
		<div>{{list.productName}}</div>
		<div>{{list.productPrice}}</div>
		<button @click="fnUpdate">수정</button>
		<button @click="fnDelect">삭제</button>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				productNo : "",
				list : [],
				data : [],
				productPrice : ""
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
						console.log(data);
						
					}
				});
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
						console.log(data);
						alert(data.message);
						
						
					}
				});
            },
			fnUpdate(){
				var self = this;
				var nparmap = {
					productNo : this.productNo,
					product : productPrice
				};
				$.ajax({
					url:"delect.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
						alert(data.message);
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