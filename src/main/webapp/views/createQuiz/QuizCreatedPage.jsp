<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="f" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Created</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            text-align: center;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            width: 90%;
        }
        h1 {
            color: #333;
        }
        p {
            font-size: 18px;
            margin: 20px 0;
        }
        .button-group {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        button {
            padding: 10px 15px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-new-quiz {
            background-color: #007bff;
            color: white;
        }
        .btn-new-quiz:hover {
            background-color: #0056b3;
        }
        .btn-home {
            background-color: #28a745;
            color: white;
        }
        .btn-home:hover {
            background-color: #1e7e34;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Quiz Created Successfully!</h1>
        <p>Your Quiz ID is: <strong><c:out value="${quizId}"></c:out></strong></p>
        <div class="button-group">
            <!-- Button to create a new quiz -->
            <form action="createQuiz" method="GET" style="margin: 0;">
                <button type="submit" class="btn-new-quiz">Create New Quiz</button>
            </form>
            <!-- Button to navigate to home -->
            <form action="/" method="GET" style="margin: 0;">
                <button type="submit" class="btn-home">Home</button>
            </form>
        </div>
    </div>
</body>
</html>
    