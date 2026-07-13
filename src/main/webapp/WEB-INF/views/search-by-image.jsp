<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head><title>Tìm kiếm bằng hình ảnh</title></head>
<body>
<h2>Tìm sản phẩm bằng ảnh</h2>
<form action="/tim-kiem-anh" method="post" enctype="multipart/form-data">
<input type="file" name="file" accept="image/*" required />
<button type="submit">Tìm kiếm</button>
</form>

<c:if test="${not empty keywords}">
<p>Từ khóa nhận diện được: ${keywords}</p>
</c:if>

<c:forEach var="p" items="${products}">
<div>
<a href="/shop/detail/${p.id}">${p.name} - ${p.price}</a>
</div>
</c:forEach>
</body>
</html>