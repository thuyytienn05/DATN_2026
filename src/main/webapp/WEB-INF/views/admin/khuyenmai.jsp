<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head><title>Quản lý khuyến mãi</title></head>
<body>
<h2>Danh sách khuyến mãi</h2>
<table border="1">
<tr><th>Id</th><th>Sản phẩm</th><th>% Giảm</th><th>Từ</th><th>Đến</th><th>Kích hoạt</th><th></th></tr>
<c:forEach var="pm" items="${promotions}">
<tr>
<td>${pm.id}</td>
<td>${pm.product.name}</td>
<td>${pm.discountPercent}</td>
<td>${pm.startDate}</td>
<td>${pm.endDate}</td>
<td>${pm.isActive}</td>
<td>
<a href="/admin/khuyenmai/toggle/${pm.id}">Bật/Tắt</a> |
<a href="/admin/khuyenmai/delete/${pm.id}">Xóa</a>
</td>
</tr>
</c:forEach>
</table>

<h3>Thêm khuyến mãi</h3>
<form action="/admin/khuyenmai/save" method="post">
Sản phẩm:
<select name="productId">
<c:forEach var="p" items="${products}">
<option value="${p.id}">${p.name}</option>
</c:forEach>
</select>
% Giảm: <input type="number" step="0.01" name="discountPercent" /><br/>
Từ ngày: <input type="date" name="startDate" /><br/>
Đến ngày: <input type="date" name="endDate" /><br/>
<input type="checkbox" name="isActive" value="true" /> Kích hoạt<br/>
<button type="submit">Lưu</button>
</form>
</body>
</html>