<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Contact Page</title>
    <style type="text/css">
        .tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
        .tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
        .tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
        .tg .tg-4eph{background-color:#f9f9f9}
    </style>
</head>
<body>
<h1>
    Add a Contact
</h1>
 
<c:url var="addAction" value="/contact/add" ></c:url>
 
<form:form action="${addAction}" commandName="contact">
<table>
    <c:if test="${!empty contact.firstName}">
    <tr>
        <td>
            <form:label path="id">
                <spring:message text="ID"/>
            </form:label>
        </td>
        <td>
            <form:input path="id" readonly="true" size="8"  disabled="true" />
            <form:hidden path="id" />
        </td> 
    </tr>
    </c:if>
    <tr>
        <td>
            <form:label path="firstName">
                <spring:message text="First Name"/>
            </form:label>
        </td>
        <td>
            <form:input path="firstName" />
        </td> 
    </tr>
    <tr>
        <td>
            <form:label path="lastName">
                <spring:message text="Last Name"/>
            </form:label>
        </td>
        <td>
            <form:input path="lastName" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <c:if test="${!empty contact.firstName}">
                <input type="submit"
                    value="<spring:message text="Edit Contact"/>" />
            </c:if>
            <c:if test="${empty contact.firstName}">
                <input type="submit"
                    value="<spring:message text="Add Contact"/>" />
            </c:if>
        </td>
    </tr>
</table>  
</form:form>
<br>
<h3>Contacts List</h3>
<c:if test="${!empty listContacts}">
    <table class="tg">
    <tr>
        <th width="80">Contact ID</th>
        <th width="120">Contact Firs Name</th>
        <th width="120">Contact Last Name</th>
        <th width="60">Edit</th>
        <th width="60">Delete</th>
    </tr>
    <c:forEach items="${listContacts}" var="contact">
        <tr>
            <td>${contact.id}</td>
            <td>${contact.firstName}</td>
            <td>${contact.lastName}</td>
            <td><a href="<c:url value='/edit/${contact.id}' />" >Edit</a></td>
            <td><a href="<c:url value='/remove/${contact.id}' />" >Delete</a></td>
        </tr>
    </c:forEach>
    </table>
</c:if>
</body>
</html>
