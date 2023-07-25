<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Anadolu Sigorta Police</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <style>
        .action-buttons {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }
        .user-table {
            margin-top: 20px;
        }
        .table td, .table th {
            vertical-align: middle;
        }
        .navbar {
            margin-bottom: 20px;
        }
        .navbar-brand {
            font-size: 24px;
        }
    </style>
</head>
<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark bg-primary">
        <div>
            <a href="<%=request.getContextPath()%>/list" class="navbar-brand font-weight-bold">Anadolu Sigorta</a>
        </div>
        <ul class="navbar-nav ml-auto">
            <li><a href="<%=request.getContextPath()%>/logout" class="btn btn-danger">Sign Out</a></li>
        </ul>
    </nav>
</header>

<div class="container">
    <h3 class="text-center">List of Users</h3>
    <hr>

    <div class="container text-left">
        <a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add New User</a>
    </div>

    <div class="user-table">
        <table class="table table-bordered table-striped">
            <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Car Brand</th>
                <th>Plate No</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="user" items="${listUser}">
                <tr>
                    <td><c:out value="${user.id}" /></td>
                    <td><c:out value="${user.name}" /></td>
                    <td><c:out value="${user.email}" /></td>
                    <td><c:out value="${user.brand}" /></td>
                    <td><c:out value="${user.plateNo}" /></td>
                    <td>
                        <div class="action-buttons">
                            <a href="edit?id=<c:out value='${user.id}' />" class="btn btn-primary">Edit</a>
                            <a href="delete?id=<c:out value='${user.id}' />" class="btn btn-danger">Delete</a>
                            <form action="<%=request.getContextPath()%>/generatePDF" method="post">
                                <input type="hidden" name="id" value="<c:out value='${user.id}' />">
                                <input type="hidden" name="name" value="<c:out value='${user.name}' />">
                                <input type="hidden" name="email" value="<c:out value='${user.email}' />">
                                <input type="hidden" name="brand" value="<c:out value='${user.brand}' />">
                                <input type="hidden" name="plateNo" value="<c:out value='${user.plateNo}' />">                                
                                
                                <input type="hidden" name="filePath" value="/Users/efeardaulun/eclipse-workspace/deneme/files/${user.id}_kasko_police.pdf">
                                <input type="submit" value="Generate PDF" class="btn btn-info">
                            </form>
                            <form action="<%=request.getContextPath()%>/showPDF" method="post" target="_blank">
                                <input type="hidden" name="filePath" value="/Users/efeardaulun/eclipse-workspace/deneme/files/${user.id}_kasko_police.pdf">
                                <input type="submit" value="Show PDF" class="btn btn-success">
                            </form>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
