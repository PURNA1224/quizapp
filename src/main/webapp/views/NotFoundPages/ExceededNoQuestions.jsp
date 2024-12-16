<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Excessive Question Request</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
        }
        h1 {
            color: #d9534f;
        }
        p {
            font-size: 18px;
            color: #333;
        }
        a {
            text-decoration: none;
            color: #337ab7;
            font-size: 16px;
            padding: 10px 20px;
            border: 1px solid #337ab7;
            border-radius: 5px;
            margin-top: 20px;
            display: inline-block;
        }
        a:hover {
            background-color: #337ab7;
            color: #fff;
        }
    </style>
</head>
<body>
    <h1>Request Exceeded Available Questions</h1>
    <p>You requested <strong>${requestedQuestions}</strong> questions, but only <strong>${availableQuestions}</strong> are available.</p>
    <p>Please adjust the number of questions and try again.</p>
    <a href="views/createQuiz/createQuizForm.jsp">Try Again</a>
</body>
</html>
