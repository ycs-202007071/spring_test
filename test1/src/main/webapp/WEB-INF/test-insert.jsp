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
		제품명 : <input type="text" v-model = "productName"><br>
        제품가격 : <input type="text" v-model = "productPrice"><br>
        <button @click="fnSave">저장</button>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
				productName : "",
                productPrice : ""
            };
        },
        methods: {
            fnSave(){
				var self = this;
				var nparmap = {
                    productName : this.productName,
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
            }
        },
        mounted() {
			
        }
    });
    app.mount('#app');
</script>
​