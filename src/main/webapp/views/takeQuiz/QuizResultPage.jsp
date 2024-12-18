<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="f" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
    <title>Quiz Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 20px;
            background-color: #f4f4f9;
        }
        .result-container {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .result-container h2 {
            color: #333;
            margin-bottom: 20px;
        }
        .result-container p {
            font-size: 18px;
            margin: 10px 0;
        }
        .score {
            font-size: 24px;
            font-weight: bold;
            color: green;
        }
        .summary {
            margin-top: 20px;
            text-align: left;
        }
        .summary table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        .summary table th, .summary table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        .summary table th {
            background-color: #f2f2f2;
        }
        .btn-home {
            background-color: #28a745;
            width: 100%;
            color: white;
        }
        .btn-home:hover {
            background-color: #1e7e34;
        }
        button{
        	padding: 10px 15px;
		    border: none;
		    margin-top: 20px;
		    border-radius: 5px;
        }

    </style>
</head>
<body>
    <div class="result-container">
        <h2>Quiz Result</h2>
        <p>Participant Name: <strong>${participantName}</strong></p>
        <p>Roll Number: <strong>${rollNumber}</strong></p>
        <p>Quiz Title: <strong>${quizTitle}</strong></p>
        <p>Total Questions: <strong>${numQuestions}</strong></p>
        <p>Score: <span class="score">${score}/${numQuestions}</span></p>

        <div class="summary">
            <h3>Question Summary:</h3>
            <table>
                <thead>
                    <tr>
                        <th>Question</th>
                        <th>Your Answer</th>
                        <th>Correct Answer</th>
                        <th>Status</th>
                    </tr>
                </thead>
                
                <tbody>
                    <c:forEach var="response" items="${responses}">
                        <tr>
                            <td>${response.title}</td>
                            <td>${response.userAnswer}</td>
                            <td>${response.correctAnswer}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${response.userAnswer == response.correctAnswer}">
                                        <span style="color: green;">Correct</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span style="color: red;">Incorrect</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
                
            </table>
        </div>
        <form action="/" method="GET" style="margin: 0;" >
                <button type="submit" class="btn-home">Home</button>
       	</form>
    </div>
</body>
</html>
