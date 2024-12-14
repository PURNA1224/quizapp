<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="f" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }
        .container {
            width: 90%;
            max-width: 800px;
            margin: 20px auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f4f4f9;
            font-weight: bold;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        td form {
		    display: inline-block;
		    margin: 5px 5px;
		}
		
		td input[type="submit"] {
		    padding: 8px 11px;
		    border: none;
		    border-radius: 6px;
		    cursor: pointer;
		}
		
		td input[type="submit"][value="update"] {
		    background-color: #0000cec4;
		    color: white;
		}
		
		td input[type="submit"][value="delete"] {
		    background-color: #ff4545;;
		    color: #fdfdfd;
		}
        
    </style>
</head>
<body>
	<%-- <c:out value="${questions}"/>
	<c:forEach var="i" begin="1" end="5">
		Item <c:out value="${i}"/>
	</c:forEach> --%>
	<%-- <c:if test="${not empty questions}">
    	<c:forEach var="question" items="${questions}">
			<tr>
            	<td>${question.id}</td>
				<td>${question.questionTitle}</td>
	            <td>
					${question.option1}, 
		            ${question.option2}, 
					${question.option3}, 
					${question.option4}
				</td>
				<td>${question.rightAnswer}</td>
				<td>${question.difficultylevel}</td>
				<td>${question.category}</td>
				
            </tr>                        
        </c:forEach>
     </c:if> --%>
     <div class="container">
        <h1>Filtered Questions by Category</h1>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Question</th>
                    <th>Options</th>
                    <th>Correct Answer</th>
                    <th>Difficulty</th>
                    <th>Category</th>
                    <th>actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- JSTL forEach loop to display filtered questions -->
                <% int i = 0; %>
                <c:if test="${not empty questions}">
                    <c:forEach var="question" items="${questions}">
                        <tr>
                        	<% i=i+1; %>
                            <td><%=i%></td>
                            <td>${question.questionTitle}</td>
                            <td>
                                ${question.option1}, 
                                ${question.option2}, 
                                ${question.option3}, 
                                ${question.option4}
                            </td>
                            <td>${question.rightAnswer}</td>
                            <td>${question.difficultylevel}</td>
                            <td>${question.category}</td>
                            <td>
                            	<form action="/updateQuestion" method="GET">
    								<input type="hidden" name="id" value="${question.id}" />
    								<input type="submit" value="update"/>
    							</form>
    							<form action="/deleteQuestion" method="GET">
    								<input type="hidden" name="id" value="${question.id}" />
    								<input type="hidden" name="category" value="${question.category}" />
    								<input type="submit" value="delete"/>
    							</form>
                            </td>
                        </tr>
                    </c:forEach>
                </c:if>
                <!-- Message if no questions found -->
                <c:if test="${empty questions}">
                    <tr>
                        <td colspan="6" style="text-align:center;">No questions found for the selected category.</td>
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
</body>
</html>