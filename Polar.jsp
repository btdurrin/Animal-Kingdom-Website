<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!doctype html public "-//w3c//dtd html 4.0 transitional//en"
                      "http://www.w3.org/TR/REC-html40/strict.dtd">

<!-- These import statements are needed to run the SQL queries, they are
     part of the JDK. -->
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.*" %>

<html>
<head>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Architects+Daughter&family=Nerko+One&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="PolarInfo.css" />

<title>Polar Data</title>

</head>
<body>
<%!
/* My source for most of this code:
   http://www.webmasterbase.com/article/770/565 */

// Define variables
ArrayList<String> animalId = new ArrayList<String>();
ArrayList<String> animalName = new ArrayList<String>();
ArrayList<String> animalSciName = new ArrayList<String>();
ArrayList<String> type = new ArrayList<String>();
ArrayList<String> lifespan = new ArrayList<String>();
ArrayList<String> habitat = new ArrayList<String>();
ArrayList<String> diet = new ArrayList<String>();
ArrayList<String> funFact = new ArrayList<String>();

ArrayList<String> region = new ArrayList<String>();
ArrayList<String> ginfo = new ArrayList<String>();
ArrayList<String> locations = new ArrayList<String>();

%>

<%
// This is needed to use Connector/J. It basically creates a new instance
// of the Connector/J jdbc driver.
Class.forName("com.mysql.jdbc.Driver").newInstance();

// Open new connection.
java.sql.Connection conn;
/* To connect to the database, you need to use a JDBC url with the following 
   format ([xxx] denotes optional url components):
   jdbc:mysql://[hostname][:port]/[dbname][?param1=value1][&param2=value2]... 
   By default MySQL's hostname is "localhost." The database used here is 
   called "mydb" and MySQL's default user is "root". If we had a database 
   password we would add "&password=xxx" to the end of the url.
*/
conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/AnimalsDB", "root", "AnimalKingdom123");
Statement sqlStatement = conn.createStatement();

// Generate the SQL query.
String query = "SELECT id, Name, SciName, Type, Lifespan, Habitat, Diet, FunFact FROM Polar2";
String info_query = "SELECT Region, Info, Locations FROM GeneralInfo";

ResultSet sqlResult = sqlStatement.executeQuery(query);
while(sqlResult.next()){
	animalId.add(sqlResult.getString("id"));
	animalName.add(sqlResult.getString("Name"));
	animalSciName.add(sqlResult.getString("SciName"));
	type.add(sqlResult.getString("Type"));
	lifespan.add(sqlResult.getString("Lifespan"));
	habitat.add(sqlResult.getString("Habitat"));
	diet.add(sqlResult.getString("Diet"));
	funFact.add(sqlResult.getString("FunFact"));
}

ResultSet sqlInfoResult = sqlStatement.executeQuery(info_query);
while(sqlInfoResult.next()){
	region.add(sqlInfoResult.getString("Region"));
	ginfo.add(sqlInfoResult.getString("Info"));
	locations.add(sqlInfoResult.getString("Locations"));
}

%>
<<div class="Background"></div>

	<div class= "TopBar">
			<div class="topnav">
				<div class = "home"><a href="http://localhost:2001/animalKingdom/finalMain.html">
					Home
				</a></div>
				<div class = "full"><a href="http://localhost:2001/animalKingdom/fullMap.html">Full Map</a></div>
				<div class = "about"><a href="http://localhost:2001/animalKingdom/AboutUs.html">
					About
				</a></div>
				
				<div class = "references"><a href="http://localhost:8083/animalKingdom/ReferencePage.html">
					References
				</a></div>

			</div>
	</div>
	<div class = "logo">
			<img src="https://i.pinimg.com/originals/99/44/2b/99442b20affa5bd750652fc814b535d7.png">
	</div>
		
	<div class="foodChain"></div>
	<div class="genInfo"></div>
	<div class="refLink"></div>
	<div class="seeLocation"></div>
	<div class="animalName"></div>
	<div class="animalDescription"></div>
		
<div style="border:4.5px solid #999999;
	color:#000000;
	font-size:25px;
	display:block;
	float:left;
	width:23.7%;
	height:45%;
	display: block; 
	position: absolute;
	top: 15%;
	overflow:auto;
	font-family: 'Architects Daughter', cursive;">  <!-- style="text-align: left; margin-top: 100px">-->
	<h3><% out.print(ginfo.get(2));%></h3>
</div>

<div style="border:4.5px solid #999999;
	color:#000000;
	font-size:25px;
	display:block;
	float:left;
	width:23.7%;
	height:300px;
	display: block; 
	position: absolute;
	bottom: -57px;
	overflow:auto;
	font-family: 'Architects Daughter', cursive;">  <!-- style="text-align: left; margin-top: 100px">-->
	<h3>Some polar regions around the world: <% out.print(locations.get(2));%></h3>
</div>



	<div class="container" style="right: 52.8%; position:absolute; top: 25%;">
		<img class="image" src="https://media3.giphy.com/media/xULW8k7RO23zaweHbq/200.gif" alt="GIF of Snowy Owl" width="250" height="117">
		<div class="overlay">
    		  <div class="text" style="height: 117px; overflow-y:auto;"><p>Name: <%out.print(animalName.get(9));%>
    		  					<br>Scientific Name: <%out.print(animalSciName.get(9)); %></br>
    		  					<br>Type: <%out.print(type.get(9)); %></br>
    		  					<br>Lifespan: <%out.print(lifespan.get(9)); %></br>
    		  					<br>Habitat: <%out.print(habitat.get(9)); %></br>
    		  					<br>Diet: <%out.print(diet.get(9)); %></br>
    		  					<br>Fun Fact: <%out.print(funFact.get(9)); %></br></p></div>
		</div>
	</div>
	<div class="container" style="right: 25%; position:absolute; top: 25%;">
		<img class="image" src="https://media1.tenor.com/images/0df3daf29b06a655d9f05d7c87037ddf/tenor.gif?itemid=3478099" alt="GIF of Polar Bear" width="248" height="117">
		<div class="overlay">
    		  <div class="text" style="height: 117px; overflow-y:auto;"><p>Name: <%out.print(animalName.get(8));%>
    		  					<br>Scientific Name: <%out.print(animalSciName.get(8)); %></br>
    		  					<br>Type: <%out.print(type.get(8)); %></br>
    		  					<br>Lifespan: <%out.print(lifespan.get(8)); %></br>
    		  					<br>Habitat: <%out.print(habitat.get(8)); %></br>
    		  					<br>Diet: <%out.print(diet.get(8)); %></br>
    		  					<br>Fun Fact: <%out.print(funFact.get(8)); %></br></p></div>
		</div>
	</div>
	
	<div class="container" style="right: 34%; position:absolute; top: 65%;">
		<img class="image" src="https://media1.giphy.com/media/hmoswuJ5EKrwA/giphy.gif" alt="GIF of Emperor Penguin" width="198" height="117">
		<div class="overlay">
    		  <div class="text" style="height: 117px; overflow-y:auto;"><p>Name: <%out.print(animalName.get(7));%>
    		  					<br>Scientific Name: <%out.print(animalSciName.get(7)); %></br>
    		  					<br>Type: <%out.print(type.get(7)); %></br>
    		  					<br>Lifespan: <%out.print(lifespan.get(7)); %></br>
    		  					<br>Habitat: <%out.print(habitat.get(7)); %></br>
    		  					<br>Diet: <%out.print(diet.get(7)); %></br>
    		  					<br>Fun Fact: <%out.print(funFact.get(7)); %></br></p></div>
		</div>
	</div>
	<div class="container" style="right: 20%; position:absolute; top: 65%;">
		<img class="image" src="https://media3.giphy.com/media/6WtpXvFwSsI6sNyx8r/giphy.gif" alt="GIF of Loon" width="208" height="117">
		<div class="overlay">
    		  <div class="text" style="height: 117px; overflow-y:auto;"><p>Name: <%out.print(animalName.get(6));%>
    		  					<br>Scientific Name: <%out.print(animalSciName.get(6)); %></br>
    		  					<br>Type: <%out.print(type.get(6)); %></br>
    		  					<br>Lifespan: <%out.print(lifespan.get(6)); %></br>
    		  					<br>Habitat: <%out.print(habitat.get(6)); %></br>
    		  					<br>Diet: <%out.print(diet.get(6)); %></br>
    		  					<br>Fun Fact: <%out.print(funFact.get(6)); %></br></p></div>
		</div>
	</div>
	<div class="container" style="right: 61%; position:absolute; top: 65%;">
		<img class="image" src="https://media1.tenor.com/images/3f68999a4da1459dd079bad8b7bfe264/tenor.gif?itemid=10411408" alt="GIF of Arctic Fox" width="190" height="117">
		<div class="overlay">
    		  <div class="text" style="height: 117px; overflow-y:auto;"><p>Name: <%out.print(animalName.get(5));%>
    		  					<br>Scientific Name: <%out.print(animalSciName.get(5)); %></br>
    		  					<br>Type: <%out.print(type.get(5)); %></br>
    		  					<br>Lifespan: <%out.print(lifespan.get(5)); %></br>
    		  					<br>Habitat: <%out.print(habitat.get(5)); %></br>
    		  					<br>Diet: <%out.print(diet.get(5)); %></br>
    		  					<br>Fun Fact: <%out.print(funFact.get(5)); %></br></p></div>
		</div>
	</div>
	<div class="container" style="right: 47%; position:absolute; top: 65%;">
	    <img class="image" src="https://prd-wret.s3.us-west-2.amazonaws.com/assets/palladium/production/s3fs-public/styles/atom_page_medium/public/thumbnails/image/walrus-scratch.gif" alt="GIF of Walrus" width="190" height="117">
		<div class="overlay">
    		  <div class="text" style="height: 117px; overflow-y:auto;"><p>Name: <%out.print(animalName.get(4));%>
    		  					<br>Scientific Name: <%out.print(animalSciName.get(4)); %></br>
    		  					<br>Type: <%out.print(type.get(4)); %></br>
    		  					<br>Lifespan: <%out.print(lifespan.get(4)); %></br>
    		  					<br>Habitat: <%out.print(habitat.get(4)); %></br>
    		  					<br>Diet: <%out.print(diet.get(4)); %></br>
    		  					<br>Fun Fact: <%out.print(funFact.get(4)); %></br></p></div>
		</div>
	</div>
	
	<div class="container" style="right: 52.8%; position:absolute; top: 45%;">
		<img class="image" src="https://myrsbytes.files.wordpress.com/2017/12/bunny_chewing.gif" alt="GIF of Snowshoe Hare" width="200" height="117">
		<div class="overlay">
    		  <div class="text" style="height: 117px; overflow-y:auto;"><p>Name: <%out.print(animalName.get(3));%>
    		  					<br>Scientific Name: <%out.print(animalSciName.get(3)); %></br>
    		  					<br>Type: <%out.print(type.get(3)); %></br>
    		  					<br>Lifespan: <%out.print(lifespan.get(3)); %></br>
    		  					<br>Habitat: <%out.print(habitat.get(3)); %></br>
    		  					<br>Diet: <%out.print(diet.get(3)); %></br>
    		  					<br>Fun Fact: <%out.print(funFact.get(3)); %></br></p></div>
		</div>
	</div>
	<div class="container" style="right: 25%; position:absolute; top: 45%;">
		<img class="image" src="https://i.pinimg.com/originals/d1/cc/2c/d1cc2c21948d27519f146c5cb32eef6e.gif" alt="GIF of Ptarmigans" width="200" height="117">
		<div class="overlay">
    		  <div class="text" style="height: 117px; overflow-y:auto;"><p>Name: <%out.print(animalName.get(2));%>
    		  					<br>Scientific Name: <%out.print(animalSciName.get(2)); %></br>
    		  					<br>Type: <%out.print(type.get(2)); %></br>
    		  					<br>Lifespan: <%out.print(lifespan.get(2)); %></br>
    		  					<br>Habitat: <%out.print(habitat.get(2)); %></br>
    		  					<br>Diet: <%out.print(diet.get(2)); %></br>
    		  					<br>Fun Fact: <%out.print(funFact.get(2)); %></br></p></div>
		</div>
	</div>
	
	
	<div class="container" style="right: 52.8%; position:absolute; top: 85%;">
		<img class="image" src="https://thumbs.gfycat.com/DrearySecondAustralianfurseal-small.gif" alt="GIF of Grasses" width="203" height="117"></li>
		<div class="overlay">
    		  <div class="text" style="height: 117px; overflow-y:auto;"><p>Name: <%out.print(animalName.get(1));%>
    		  					<br>Scientific Name: <%out.print(animalSciName.get(1)); %></br>
    		  					<br>Type: <%out.print(type.get(1)); %></br>
    		  					<br>Lifespan: <%out.print(lifespan.get(1)); %></br>
    		  					<br>Habitat: <%out.print(habitat.get(1)); %></br>
    		  					<br>Diet: <%out.print(diet.get(1)); %></br>
    		  					<br>Fun Fact: <%out.print(funFact.get(1)); %></br></p></div>
		</div>
	</div>
	<div class="container" style="right: 25%; position:absolute; top: 85%;">
		<img class="image" src="https://thumbs.gfycat.com/ColorfulVigilantBongo-size_restricted.gif" alt="GIF of Arctic Willow" width="155" height="117"></li>
		<div class="overlay">
    		  <div class="text" style="height: 117px; overflow-y:auto;"><p>Name: <%out.print(animalName.get(0));%>
    		  					<br>Scientific Name: <%out.print(animalSciName.get(0)); %></br>
    		  					<br>Type: <%out.print(type.get(0)); %></br>
    		  					<br>Lifespan: <%out.print(lifespan.get(0)); %></br>
    		  					<br>Habitat: <%out.print(habitat.get(0)); %></br>
    		  					<br>Diet: <%out.print(diet.get(0)); %></br>
    		  					<br>Fun Fact: <%out.print(funFact.get(0)); %></br></p></div>
		</div>
	</div>
	

<%
//Close the connection.
sqlResult.close();
sqlStatement.close();
conn.close();
%>
</body>
</html>