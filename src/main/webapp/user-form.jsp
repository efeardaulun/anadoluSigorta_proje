<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>User Management Application</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: #006bb3">
			<div>
            	<a href="<%=request.getContextPath()%>/list" class="navbar-brand font-weight-bold">Anadolu Sigorta</a>
			</div>

		</nav>
	</header>
	<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<c:if test="${user != null}">
					<form action="update" method="post">
				</c:if>
				<c:if test="${user == null}">
					<form action="insert" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${user != null}">
            			Edit User
            		</c:if>
						<c:if test="${user == null}">
            			Add New User
            		</c:if>
					</h2>
				</caption>

				<c:if test="${user != null}">
					<input type="hidden" name="id" value="<c:out value='${user.id}' />" />
				</c:if>

				<fieldset class="form-group">
					<label>User Name</label> <input type="text"
						value="<c:out value='${user.name}' />" class="form-control"
						name="name" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>User Email</label> <input type="text"
						value="<c:out value='${user.email}' />" class="form-control"
						name="email">
				</fieldset>

				<fieldset class="form-group">
				    <label>Car Brand</label>
				    <select class="form-control" name="brand">
				        <option value="Mercedes" <c:if test="${user != null && user.brand == 'Mercedes'}">selected</c:if>>Mercedes</option>
				        <option value="BMW" <c:if test="${user != null && user.brand == 'BMW'}">selected</c:if>>BMW</option>
				        <option value="Audi" <c:if test="${user != null && user.brand == 'Audi'}">selected</c:if>>Audi</option>
				        <option value="Toyota" <c:if test="${user != null && user.brand == 'Toyota'}">selected</c:if>>Toyota</option>
				        <option value="Honda" <c:if test="${user != null && user.brand == 'Honda'}">selected</c:if>>Honda</option>
				        <option value="Ford" <c:if test="${user != null && user.brand == 'Ford'}">selected</c:if>>Ford</option>
				        <option value="Chevrolet" <c:if test="${user != null && user.brand == 'Chevrolet'}">selected</c:if>>Chevrolet</option>
				        <option value="Volkswagen" <c:if test="${user != null && user.brand == 'Volkswagen'}">selected</c:if>>Volkswagen</option>
				    </select>
				</fieldset>


				
				<fieldset class="form-group">
					<label>Plate No</label> <input type="text"
						value="<c:out value='${user.plateNo}' />" class="form-control"
						name="plateNo">
				</fieldset>

				<button type="submit" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>