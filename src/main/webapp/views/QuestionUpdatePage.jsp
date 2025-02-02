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
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            width: 90%;
            max-width: 600px;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-top: 10px;
            font-weight: bold;
        }
        input, textarea, select, button {
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        button {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            margin-top: 20px;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
	<div class="container">
        <h1>Update Quiz Question</h1>
        <form action="updateQuestionToDB">
            <!-- Question Input -->
            <input type="hidden" name="id" value="${question.id}">
            <label for="question">Question:</label>
            <textarea id="question" name="questionTitle" placeholder="Enter the question">${question.questionTitle}</textarea>

            <!-- Options Input -->
            <label for="options">Options:</label>
            <input id="options" name="option1" type="text" placeholder="Option1" value="${question.option1}" required>
          	<input id="options" name="option2" type="text" placeholder="Option2" value="${question.option2}" required>
            <input id="options" name="option3" type="text" placeholder="Option3" value="${question.option3}" required>
            <input id="options" name="option4" type="text" placeholder="Option4" value="${question.option4}" required>

            <!-- Correct Answer Input -->
            <label for="correctOption">Correct Answer:</label>
            <input id="correctOption" name="rightAnswer" type="text" placeholder="Enter the correct answer" value="${question.rightAnswer}">

            <!-- Difficulty Level -->
            <label for="difficulty">Difficulty Level:</label>
            <select id="difficulty" name="difficultylevel">
                <option value="" disabled>Select difficulty level</option>
            	<c:choose>
            		<c:when test="${question.difficultylevel=='easy'}">
            			<option value="easy" selected>Easy</option>
            		</c:when>
            		<c:otherwise>
            			<option value="easy">Easy</option>
            		</c:otherwise>
            	</c:choose>
            	
            	<c:choose>
            		<c:when test="${question.difficultylevel=='medium'}">
            			<option value="medium" selected>Medium</option>
            		</c:when>
            		<c:otherwise>
            			<option value="medium">Medium</option>
            		</c:otherwise>
            	</c:choose>
                	
                <c:choose>
            		<c:when test="${question.difficultylevel=='hard'}">
            			<option value="hard" selected>Hard</option>
            		</c:when>
            		<c:otherwise>
            			<option value="hard">Hard</option>
            		</c:otherwise>
            	</c:choose>
            </select>

            <!-- Category Input -->
            <label for="category">Category:</label>
            <input id="category" name="category" type="text" placeholder="Enter the category (e.g., Science, History)" value="${question.category}" >

            <!-- Submit Button -->
            <button type="submit">Submit Question</button>
        </form>
    </div>
</body>
</html>