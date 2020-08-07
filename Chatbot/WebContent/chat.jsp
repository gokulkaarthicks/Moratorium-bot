<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
  <style>
     body {
    font-family: Garamond;
}

h1 {
    color: black;
    margin-bottom: 0;
    margin-top: 0;
    text-align: center;
    font-size: 40px;
}

h3 {
    color: black;
    font-size: 20px;
    margin-top: 3px;
    text-align: center;
}

#chatbox {
    margin-left: auto;
    margin-right: auto;
    width: 40%;
    margin-top: 60px;
}

#userInput {
    margin-left: auto;
    margin-right: auto;
    width: 40%;
    margin-top: 60px;
}

#textInput {
    width: 87%;
    border: none;
    border-bottom: 3px solid #009688;
    font-family: monospace;
    font-size: 17px;
}

#buttonInput {
    padding: 3px;
    font-family: monospace;
    font-size: 17px;
}

.userText {
    color: white;
    font-family: monospace;
    font-size: 17px;
    text-align: right;
    line-height: 30px;
}

.userText span {
    background-color: #009688;
    padding: 10px;
    border-radius: 2px;
}

.botText {
    color: white;
    font-family: monospace;
    font-size: 17px;
    text-align: left;
    line-height: 30px;
}

.botText span {
    background-color: #EF5350;
    padding: 10px;
    border-radius: 2px;
}

#tidbit {
    position:absolute;
    bottom:0;
    right:0;
    width: 300px;
}
     </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  </head>
  <body>
  <%
response.setHeader("cache-control","no-cache,no-store,must-revalidate");
response.setHeader("Pragma","no-cache");
response.setHeader("Expires","0");
if(session.getAttribute("username")==null)
	response.sendRedirect("Login.html");
session.removeAttribute("otp");
session.removeAttribute("password");
session.removeAttribute("role");
session.removeAttribute("username");

%>
    <h1>Moratorium Bot</h1>
    <div>
      <div id="chatbox">
        <p class="botText"><span>Hi! I'm Moratorium bot.</span></p>
      </div>    
      <div id="userInput">
      	
        <input id="textInput" type="text" name="msg" placeholder="Message">
        <input id="buttonInput" type="submit" value="Send">
        
      </div>    
      <script>
	var rawText;
        function getBotResponse() {
          rawText = $("#textInput").val();
          var userHtml = '<p class="userText"><span>' + rawText + '</span></p>';
          $("#textInput").val("");
          $("#chatbox").append(userHtml);
          document.getElementById('userInput').scrollIntoView({block: 'start', behavior: 'smooth'});
          $.post("Message",
        		rawText
        		  ,
        		  function(data, status){
        	  var botHtml = '<p class="botText"><span>' + data + '</span></p>';
      	       $("#chatbox").append(botHtml);
        		  });
        }
        $("#textInput").keypress(function(e) {
            if ((e.which == 13) && document.getElementById("textInput").value != "" ){
                getBotResponse();
            }
        });
        $("#buttonInput").click(function() {
            if (document.getElementById("textInput").value != "") {
                getBotResponse();
            }
        })
      </script>
    </div>
  </body>
</html>
    