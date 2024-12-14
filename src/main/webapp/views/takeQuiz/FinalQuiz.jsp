<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="f" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Take Quiz</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        label {
            font-weight: bold;
            /* display: block; */
            margin: 10px 0 5px;
        }
        .upside {
            width: 95%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        .question {
            margin-bottom: 20px;
        }
        .question h3 {
            margin-bottom: 10px;
        }
        .question label {
            display: inline-flex; /* Ensure label and input are aligned horizontally*/
            /* align-items: center; */
            margin-bottom: 5px;
        }
        .question input[type="radio"] {
            margin-right: 10px; /* Space between radio button and text */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Take Quiz</h1>
		
       	<form action="/calculatingResult" method="post">
       	<input type="hidden" name="quizId" class="upside" value="${presentQuiz.id}">
            <!-- Participant Details -->
            <label for="participantName">Participant Name:</label>
            <input class="upside" type="text" id="participantName" name="participantName" value="${participantName}" readonly>

            <label for="rollNumber">Roll Number:</label>
            <input class="upside" type="text" id="rollNumber" name="rollNumber" value="${rollNumber}" readonly>

            <label for="collegeName">College Name:</label>
            <input class="upside" type="text" id="collegeName" name="collegeName" value="${collegeName}" readonly>

            <label for="quizId">Quiz ID:</label>
            <input class="upside" type="text" id="quizId" name="quizId" value="${presentQuiz.id}" readonly>

            <label for="numQuestions">Number of Questions:</label>
            <input class="upside" type="number" id="numQuestions" name="numQuestions" value="${numQ}" readonly>

<%--
            <!-- Questions Section -->
            <% int i = 1; %>
           <c:forEach var="question" items="${presentQuiz.questions}">
               
                    Q<%=i %>) ${question.questionTitle}
                    <% i++; %>
                    <br>
                    <label>
                        <input type="radio" name="q${question.id}" value="${question.option1}" required> ${question.option1}</label><br>
                    <label>
                        <input type="radio" name="q${question.id}" value="${question.option2}" required> ${question.option2}</label><br>
                    <label>
                        <input type="radio" name="q${question.id}" value="${question.option3}" required> ${question.option3}</label><br>
                    <label>
                        <input type="radio" name="q${question.id}" value="${question.option4}" required> ${question.option4}</label><br>
                </div>
                <hr>
            </c:forEach> --%>
            
            
            <ol type="1">
            	<c:forEach var="question" items="${presentQuiz.questions}">
            	<li>
            		<div class="question">
		            	<input type="hidden" name="questionId" value="${question.id}">
	            		
		            		${question.questionTitle}<br>
		            			<label><input type="radio" name="q${question.id}" value="${question.option1}" required>${question.option1}</label><br>
		            			<label><input type="radio" name="q${question.id}" value="${question.option2}" required>${question.option2}</label><br>
		            			<label><input type="radio" name="q${question.id}" value="${question.option3}" required>${question.option3}</label><br>
		            			<label><input type="radio" name="q${question.id}" value="${question.option4}" required>${question.option4}</label><br>
	            	</div>
            	</li>
            	</c:forEach>
            </ol>

            <!-- Submit Button -->
            <button type="submit">Submit Quiz</button>
        </form>
    </div>
</body>
</html>
