<%-- 
    Document   : veiwcommunity.jsp
    Created on : Feb 25, 2024, 11:09:51 PM
    Author     : LENOVO
--%>

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Community</title>
    <style>
       body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
       header {
            padding: 20px;
            background-color: #3ea5d5;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        #logo {
            width: 120px;
            
            display: block;
            margin: 0 auto;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            background-image: linear-gradient(#a0c7da, white);
            box-shadow:20px -19px 8px rgb(0 0 0 / 24%);
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #1e5783;
        }

        .job-box {
            border: 1px solid #ddd;
            padding: 20px;
            margin-bottom: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .job-title {
            font-size: 18px;
            font-weight: bold;
            color: #1e5783;
            margin-bottom: 10px;
        }

        .job-details {
            font-size: 14px;
            color: #555;
            margin-bottom: 10px;
        }

        .apply-link {
            text-decoration: none;
            color: #1e5783;
            cursor: pointer;
            display: inline-block;
            padding: 8px 12px;
            background-color: #eee;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .apply-link:hover {
            background-color: #3ea5d5;
            color: #fff;
        }
    </style>
</head>
<body>
    <header>
    <div id="google_translate_element" align="left"></div>
 
    <script type="text/javascript">
        function googleTranslateElementInit() {
            new google.translate.TranslateElement(
                {pageLanguage: 'en'},
                'google_translate_element'
            );
        }
    </script>
 
    <script type="text/javascript"
            src=
"https://translate.google.com/translate_a/element.js?
cb=googleTranslateElementInit">
    </script>
    <img id="logo" src="Banasthali_Vidyapeeth_Logo.png" alt="Logo">
    </header>
<div class="container">
    <h1>View Community</h1>
     <lable><h3>TO join any community copy and paste the link on your Whatsapp</h4></lable><br>
    <%
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/beyondbias","root","root@bv1");
            Statement statement = connection.createStatement();

            String query = "SELECT * FROM community";
            ResultSet resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
    %>
    <div class="job-box">
       
        
        
        <div class="community-details">
            
            <strong>Email:</strong> <%= resultSet.getString("email") %><br>
            <strong> Name:</strong> <%= resultSet.getString("name") %><br>
            <strong>Community Name:</strong> <%= resultSet.getString("cname") %><br>
            <strong>Community Purpose:</strong> <%= resultSet.getString("cpurpose") %><br>
            <strong>TC_Members:</strong> <%= resultSet.getString("cmember") %><br>
            <strong>Group link:</strong> <%= resultSet.getString("grouplink") %><br>
            <strong>Contact:</strong> <%= resultSet.getString("contact") %><br>
             
        </div>
       
    </div>
    
    <%
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
     <a href="jobseekerhome.jsp" style="text-decoration: none; color: #0074D9; display: block; margin-bottom: 10px;" align="center"  >Back to Home</a>
</div>


</body>
</html>
