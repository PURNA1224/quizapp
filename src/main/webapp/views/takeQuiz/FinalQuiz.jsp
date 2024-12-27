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
        #reviewingQuestions {
        	position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,
                    0,
                    0,
                    0.6);
            display: none;
            font-family: initial;
        }
        .popup-content {
        	background-color: white;
            margin: 10% auto;
            padding: 20px;
            border: 1px solid #888888;
            font-weight: bolder;
            max-width: fit-content;
    		border-radius: 30px;
    		padding: 50px;
    		margin-bottom: 5px;
        }
        .popUpElements {
        	display: inline-block;
        	margin: unset;
        	color: black;
        	font-size: 20px;
    		font-weight: initial;
        }
        .popUpElementsAnsweredNot{
        	display: inline-block;
        	margin: unset;
        }
        .circleDiv{
        	width: 15px;
    		height: 15px;
		    background-color: #E60101;
		    display: inline-block;
		    border-radius: 25px;
		    margin-right: 5px;
        }
        #popUpHeading {
	        font-size: 30px;
	        margin: unset;
	        margin-bottom: 30px;
	        font-weight: 525;
        }
        .tableContentHead{
    		font-weight: normal;
    		font-size: 14px;
        }
        .tableContentData {
        	font-weight: normal;
        	text-align: center;
        }
		
    </style>
    <script type="text/javascript">
    
    	//Timer and it's blinking effect
	    var remainingTime = parseInt(${timeValue})/1000;
	    let redBlinker;
	    let questionStatus = {};
	    const endTimeKey = 'counter_end_time';
	    let endTimeTrigger = sessionStorage.getItem(endTimeKey);
	    
	    
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
	        if(endTimeTrigger > 0){
			    const counterComponent = document.getElementById('counter');
			    const formPage = document.getElementById('testPage');
		    	counterComponent.innerText = "Submitting the form...";
				formPage.submit();
		    }
		    sessionStorage.setItem(endTimeKey, Date.now());
	        const numQs = document.getElementById('numQuestions').value;
	        document.getElementById("totalNoQuestions").innerText = numQs;
	    	let AnsweredCount = 0;
	        let lengthOfObject = 0;
	        let qn = 0;
	        const popUpContent = document.getElementById('item-content');
	        document.getElementById("answeredCount").innerText = 0;
            document.getElementById("unansweredCount").innerText = numQs;
	        
	        document.querySelectorAll(".question").forEach((questions)=>{
	        	document.querySelectorAll("label").forEach((labels)=>{
	        		labels.querySelectorAll('input[type="hidden"]').forEach((radio) => {
	        			lengthOfObject = Object.keys(questionStatus).length;
	        			if(lengthOfObject<numQs){
	        				qn += 1;
				        	questionStatus[radio.name] = false;
				        	popUpContent.innerHTML += "<center><div id='circleDiv"+ radio.name.replace("q","") +"' class='circleDiv'></div><h6 id='mainQno" + radio.name.replace("q","") + "' class='popUpElements'> Question " + qn + "</h6></center>";
	        			}
	        			
			        });
		        })
	        });
	        
	        
	        
	        const radioButtons = document.querySelectorAll("input[type='radio']");
	     
	        document.querySelectorAll('input[type="radio"]').forEach((radio) => {
	        	
	            radio.addEventListener('change', function() {
	                // Get the question number and selected answer
	                AnsweredCount += 1;
	                const questionNumber = this.name.replace('q', '');
	                const setAnsweredQuestion = document.getElementById("qno"+questionNumber);
	                const setMainAnsweredQuestion = document.getElementById("mainQno"+questionNumber);
	                questionStatus[this.name] = true;
	                document.getElementById("circleDiv"+questionNumber).style.backgroundColor = "#00A136";
	                let countMe = 0;
	                for(let key in questionStatus){
	                	if(questionStatus[key] == true){
	                		countMe += 1;
	                	}
	                }
	                AnsweredCount = countMe;
	                document.getElementById("answeredCount").innerText = AnsweredCount;
	                document.getElementById("unansweredCount").innerText = numQs - AnsweredCount;
	            });
	        });
	        
	    }; 
	    
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

	    
	    
	    //Reviewing Questions Popup
	    
	    function openPopMe() {
	    	const popUpWindow = document.getElementById("reviewingQuestions");
	    	popUpWindow.style.display = "block";
	    	
	    }
	    
	    function closePopMe() {
	    	const popUpWindow = document.getElementById("reviewingQuestions");
	    	popUpWindow.style.display = "none";
	    }
	    
	    function submitingForm() {
	    	/* sessionStorage.setItem(endTimeKey, 1); */
			const formPage = document.getElementById('testPage');
	    	formPage.submit();
	    	
	    }
	    
	    window.addEventListener(
	            "click",
	            function (event) {
	            	const popUpWindow = document.getElementById("reviewingQuestions");
	                if (event.target == popUpWindow) {
	                	popUpWindow.style.display = "none";
	                }
	            }
	    );
	    
	
</script>
</head>
<body>
    <div class="container">
	    <input type="hidden" id='timeValue' name="timeValue" value="${timeValue}"/>
	    <h6 style="display: inline-block; font-size: 14px;">Remaining Time : </h6>
	    <h5 id="counter" >Timer loading...<span id='blinkit'></span><span id='blinkit2'></span></h5>
	    <h5 id="redCounter"></h5>
	    
	    <h1>Take Quiz</h1>
			<form id="testPage" action="/calculatingResult" method="GET">
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
		            		
			            		<p>${question.questionTitle}</p><br>
			            		<label> <input type="radio" name="q${question.id}" value="${question.option1}" > ${question.option1} </label> <br>
			            		<label> <input type="radio" name="q${question.id}" value="${question.option2}" > ${question.option2} </label> <br>
			            		<label> <input type="radio" name="q${question.id}" value="${question.option3}" > ${question.option3} </label> <br>
			           			<label> <input type="radio" name="q${question.id}" value="${question.option4}" > ${question.option4} </label> <br>
			           			<label> <input type="hidden" name="q${question.id}" value="No answer" checked></label> <br>
		            	</div>
	            	</li>
	            	</c:forEach>
	            </ol>
	        </form>
			<button id="openPop" onclick="openPopMe()">Submit Quiz</button>
			
	    
    </div>
</body>
<div id="reviewingQuestions">
	<div class="popup-content">
		<center><p id="popUpHeading">Quiz Questions status</p></center>
		<h3 id="item-content"></h3>
		
		<table style="margin-left: auto; margin-right: auto; margin-top: 30px;">
			<thead>
				<tr class="tableContentHead">
					<th style="padding-right: 30px;">Total No Questions</th>
					<th style="padding-right: 30px;">Answered</th>
					<th>Unanswered</th>
				</tr>
			</thead>
			<tbody>
				<tr class="tableContentData">
					<td><p id="totalNoQuestions" style="padding-right: 30px;"></p></td>
					<td><p id="answeredCount" style="padding-right: 30px;"></p></td>
					<td><p id="unansweredCount"></p></td>
				</tr>
			</tbody>
		</table>
		
		<p style="font-size: 14px; font-weight: normal; margin-top: 20px; margin-left: 10px; margin-bottom: -5px;">Circles represented by red are not answered questions.</p>
		<p style="font-size: 14px; font-weight: normal; margin-bottom: 20px; margin-left: 10px;">Circles represented by green are answered questions. </p>		
		<button onclick="closePopMe()" style="background-color: #E60101; font-family: inherit;">Go Back</button>
	    <button type="submit" id="submitButton" onclick="submitingForm()" style="float: right; background-color: #00A136; font-family: inherit;">Confirm</button>
	    
	</div>
</div>
</html>
