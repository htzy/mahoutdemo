<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: huangshihe
  Date: 9/26/16
  Time: 4:13 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
id means movies id<br>
items by user<br>
<c:forEach items="${itemsByUser}" var="item">
  id:${item.itemID} value:${item.value}<br>
</c:forEach>
<br>
items by item<br>
<c:forEach items="${itemsByItem}" var="item">
  id:${item.itemID} value:${item.value}<br>
</c:forEach>

</body>
</html>
