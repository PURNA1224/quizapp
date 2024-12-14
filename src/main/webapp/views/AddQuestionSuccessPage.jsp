<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="f" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
    <title>Question Added</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 20px;
            background-color: #f4f4f9;
        }
        .message-container {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .message-container p {
            font-size: 18px;
            margin: 15px 0;
        }
        .message-container a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .message-container a:hover {
            background-color: #0056b3;
        }
        .success{
        	color: #008425;
        	margin-bottom: 20px;
        	font-weight: bolder;
        }
    </style>
</head>
<body>
    <div class="message-container">
        <h2 class="success">Success!</h2>
        <p>The question has been added successfully.</p>
        <a href="/createQuestion">Add Another Question</a>
        <a href="/">Go to Home</a>
    </div>
</body>
</html>
