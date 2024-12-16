<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Invalid Category</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
        }
        h1 {
            color: #d9534f;
        }
        a {
            text-decoration: none;
            color: #337ab7;
            font-size: 16px;
            padding: 10px 20px;
            border: 1px solid #337ab7;
            border-radius: 5px;
        }
        a:hover {
            background-color: #337ab7;
            color: #fff;
        }
    </style>
</head>
<body>
    <h1>Invalid Category</h1>
    <p>The category you entered: <strong>${invalidCategory}</strong> is not valid.</p>
    <a href="views/createQuiz/createQuizForm.jsp">Try Again</a>
</body>
</html>
