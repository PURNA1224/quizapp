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
		    display: inline-block;
		    width: fit-content;
		    padding: 10px;
		    font-size: 14px;
		    font-family: ui-serif;
		    border-radius: inherit;
		    font-weight: 600;
        }
        #redCounter{
        	display: none;
        	color: red;
		    width: fit-content;
		    padding: 10px;
		    font-size: 14px;
		    font-family: ui-serif;
		    border-radius: inherit;
		    font-weight: 600;
        }
        #blinkit {
        	color: black;
        }
    </style>
    <script type="text/javascript">
    
	    var remainingTime = parseInt(${timeValue})/1000;
	    let redBlinker;
	    
	    function countDown(remainingTime){
		    const formPage = document.getElementById('testPage');
	    	const counterComponent = document.getElementById('counter');
	    	const redCounterComponent = document.getElementById('redCounter');
	    	let hr;
	    	let min;
	    	let sec;
	    	const interval = setInterval(() => {
	    		if(remainingTime == 10){
	    			clearInterval(greenBlinker);
	    			redBlinker = setInterval(blink2, 500);
	    		}
	    		if(remainingTime > 10){
		    		remainingTime -= 1;
		    		hr = parseInt(remainingTime/3600);
		    		min = parseInt((remainingTime/60)%60);
		    		sec = (remainingTime%60);
		    		
		    		chr = (parseInt(remainingTime/3600))<10?"0"+hr:hr;
		    		cmin = (parseInt((remainingTime/60)%60))<10?"0"+min:min;
		    		csec = (remainingTime%60)<10?"0"+sec:sec;

		    		counterComponent.innerHTML = chr + "<span id='blinkit' style='color: black;'> : </span>" + cmin + "<span id='blinkit2' style='color: black;'> : </span>" + csec + " hours";
	    		}
	    		else{
	    			remainingTime -= 1;
	    			hr = parseInt(remainingTime/3600);
	    			sec = remainingTime%60;
	    			min = parseInt((remainingTime/60)%60);
		    		
		    		chr = (parseInt(remainingTime/3600))<10?"0"+hr:hr;
		    		cmin = (parseInt((remainingTime/60)%60))<10?"0"+min:min;
		    		csec = (remainingTime%60)<10?"0"+sec:sec;
		    		
	    			document.getElementById("redCounter").style.display = "inline-block";
		    		document.getElementById("counter").style.display = "none";
		    		redCounterComponent.innerHTML = chr + "<span id='redblink' style='color: black;'> : </span>" + cmin + "<span id='redblink2' style='color: black;'> : </span>" + csec + " hours";
	    		}

	    		if(remainingTime <= 0){
	    			clearInterval(redBlinker);
	    			document.getElementById("redCounter").style.display = "none";
	    			counterComponent.innerText = "Submitting the form...";
	    			formPage.submit();
	    		}
	    	},1000);
	    }    
	    
	    
	    window.onload = function () {
	        countDown(remainingTime);
	    };
	    
	    function zeroCounter() {
	    	/* countDown(0); */
	    }
	    
	    
	    let isBlinking = false;  

	    function blink() {  
	    	const timerBlink = document.getElementById("blinkit");
	    	const timerBlink2 = document.getElementById("blinkit2");
	        isBlinking = !isBlinking;  
	        timerBlink.style.color = isBlinking ? 'black' : 'white';
	        timerBlink2.style.color = isBlinking ? 'black' : 'white';
	    }  

	    let greenBlinker = setInterval(blink, 500);
	    
	    let isBlinking2 = true;  
 
	    function blink2() {  
	    	const timerBlinkred = document.getElementById("redblink");
	    	const timerBlinkred2 = document.getElementById("redblink2");
	        isBlinking2 = !isBlinking2;  
	        timerBlinkred.style.color = isBlinking2 ? 'black' : 'white';
	        timerBlinkred2.style.color = isBlinking2 ? 'black' : 'white';
	    } 

	    
		
</script>
</head>
<body>
    <div class="container">
    <input type="hidden" id='timeValue' name="timeValue" value="${timeValue}"/>
    <h6 style="display: inline-block; font-size: 14px;">Remaining Time : </h6>
    <h5 id="counter" >Timer loading...<span id='blinkit'></span><span id='blinkit2'></span></h5>
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
