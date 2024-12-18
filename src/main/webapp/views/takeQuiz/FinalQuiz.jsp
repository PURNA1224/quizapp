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
			width: -webkit-fill-available;
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
        #counter{
        	color: #2aa700;
		    /* border: solid; */
		    width: fit-content;
		    padding: 10px;
		    /* background-color: seagreen; */
		    font-size: unset;
		    font-family: 'DM Sans';
		    border-radius: inherit;
		    font-weight: 600;
        }
        #redCounter{
        	display: none;
        	color: red;
		    /* border: solid; */
		    width: fit-content;
		    padding: 10px;
		    /* background-color: red; */
		    font-size: unset;
		    font-family: 'DM Sans';
		    border-radius: inherit;
		    font-weight: 600;
        }
    </style>
    <script type="text/javascript">
    
	    var remainingTime = parseInt(${timeValue})/1000;
	    
	    function countDown(remainingTime){
		    const formPage = document.getElementById('testPage');
	    	const counterComponent = document.getElementById('counter');
	    	const redCounterComponent = document.getElementById('redCounter');
	    	
	    	const interval = setInterval(() => {
	    		if(remainingTime > 10){
		    		remainingTime -= 1;
		    		counterComponent.innerText = "Remaining Time: " + remainingTime+" seconds";
	    		}
	    		else{
	    			remainingTime -= 1;
	    			document.getElementById("redCounter").style.display = "block";
		    		redCounterComponent.innerText = "Remaining Time: " + remainingTime+" seconds";
		    		document.getElementById("counter").style.display = "none";
	    		}
	    		
	    		if(remainingTime <= 0){
	    			/* clearInterval(interval); */
	    			counterComponent.innerText = "Submitting the form...";
	    			formPage.submit();
	    		}
	    	},1000);
	    }    
	    
	    
	    window.onload = function () {
	        /* // Push a dummy state to the history stack
	        history.pushState(null, "/", location.href);

	        // Listen for the back button event
	        window.onpopstate = function (event) {
	            if (event) {
	                // Redirect to the desired page when the back button is pressed
	                window.location.href = "/";
	            }
	        }; */
	        
	        countDown(remainingTime);
	    };
	    
	    function zeroCounter() {
	    	/* const formPage = document.getElementById('testPage'); */
	    	/* setInterval(()=> {
	    		formPage.submit();
	    	},0); */
	    	countDown(0);
	    }
		
</script>
</head>
<body>
    <div class="container">
    <input type="hidden" id='timeValue' name="timeValue" value="${timeValue}"/>
    <h5 id="counter">Loading counter...</h5>
    <h5 id="redCounter"></h5>
        <h1>Take Quiz</h1>
		
       	<form action="/calculatingResult" method="post" id="testPage">
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

			<label for="quizId">Quiz Title:</label>
            <input class="upside" type="text" id="quizTitle" name="quizTitle" value="${presentQuiz.title}" readonly>
            
            <label for="numQuestions">Number of Questions:</label>
            <input class="upside" type="number" id="numQuestions" name="numQuestions" value="${numQ}" readonly>            
            
            <ol type="1">
            	<c:forEach var="question" items="${presentQuiz.questions}">
            	<li>
            		<div class="question">
		            	<input type="hidden" name="questionId" value="${question.id}">
	            		
		            		${question.questionTitle}<br>
		            			<label> <input type="radio" name="q${question.id}" value="${question.option1}" > ${question.option1} </label> <br>
		            			<label> <input type="radio" name="q${question.id}" value="${question.option2}" > ${question.option2} </label> <br>
		            			<label> <input type="radio" name="q${question.id}" value="${question.option3}" > ${question.option3} </label> <br>
		            			<label> <input type="radio" name="q${question.id}" value="${question.option4}" > ${question.option4} </label> <br>
		            			<label> <input type="hidden" name="q${question.id}" value="No answer" checked></label> <br>
	            	</div>
            	</li>
            	</c:forEach>
            </ol>

            <!-- Submit Button -->
            <button type="submit" onclick="zeroCounter()">Submit Quiz</button>
        </form>
    </div>
</body>
</html>
