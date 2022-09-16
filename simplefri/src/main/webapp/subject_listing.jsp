<%--
  Created by IntelliJ IDEA.
  User: ratchaphon
  Date: 27/8/2022 AD
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Subject Listing</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
</head>
<body style="margin-left: 20px">
<div class="container-fluit">
    <h3>Subject Listing:</h3>
    <div class="row bg-light">
        <div class="col-1">No.</div>
        <div class="col-1">Subject Id</div>
        <div class="col-3">Subject Title</div>
        <div class="col-1">Credit</div>
        <div class="col-6">Note</div>
    </div>
    <c:forEach items="${subjects}" var="subject" varStatus="vs">
        <div class="row">
            <div class="col-1">${vs.count}</div>
            <div class="col-1">${subject.id}</div>
            <div class="col-3">${subject.title}</div>
            <div class="col-1">${subject.credit}</div>
            <div class="col-6"></div>
        </div>
    </c:forEach>
</div>
</body>
</html>
