<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Form</title>
</head>
<body>
    <div align="center">
        <h1>Employee Login Form</h1>
        <form action="<%=request.getContextPath()%>/login" method="post">
            <table style="width: 100%">
                <tr>
                    <td>UserName</td>
                    <td><input type="text" name="username" /></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="password" /></td>
                </tr>
            </table>
            <input type="submit" value="Submit" />
        </form>
        <%-- Hata mesajı varsa goster --%>
        <% String errorMessage = (String) session.getAttribute("errorMessage");
           if (errorMessage != null) {
        %>
           <div style="color: red;"> <%= errorMessage %> </div>
        <%
           }
           session.removeAttribute("errorMessage"); // Hata mesajını bir kere gösterdikten sonra temizleyelim.
        %>
    </div>
</body>
</html>
