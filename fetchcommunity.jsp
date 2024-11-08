<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Community Details</title>
     <style>
         
      body {
        background-color: #f2f2f2;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        text-align: center;
        background-size: cover;
    }
    .container {
            margin: auto;
            background-image: linear-gradient(#a0c7da, white);
            box-shadow:20px -19px 8px rgb(0 0 0 / 24%);
            width: 80%;
            max-width: 500px; 
            padding: 20px;
            background-color: #fff;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            margin-top: 50px;
        }

        .box {
            border: 1px solid #ccc;
            padding: 30px;
            margin-top: 30px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
         #logo {
            width: 120px;
            height: auto;
        }
        header {
            padding: 20px;
            background-color: #3ea5d5;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

       
        
        .or-text {
            font-size: 18px;
            margin: 20px 0;
            color: #888;
        }

        form {
            text-align: left;
        }

        label {
            display: block;
            margin: 15px 0 5px;
            font-size: 14px;
            color: #333;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .forgot-password {
            font-size: 14px;
            color: #4285F4;
            text-decoration: none;
            display: inline-block;
            margin-top: 10px;
        }

        .submit {
            background-color: #3ea5d5;
            color: #fff;
            padding: 15px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .submit:hover{
            background-color: #3ea5d5;
        }
        

    button[type="submit"] {
        width: 48%;
        background-color: #3ea5d5;
        color: #fff;
        padding: 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
         display: inline-block; 
    margin-right: 2%; 
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
        <h2>Job Details</h2>
        <% 
            String cname= request.getParameter("cname");
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/beyondbias?zeroDateTimeBehavior=convertToNull", "root", "root@bv1");
                String query = "SELECT * FROM community WHERE cname=?";
                stmt = conn.prepareStatement(query);
                stmt.setString(1, cname);
                rs = stmt.executeQuery();
                if (rs.next()) {
        %>
                    <form action="updatecommuunity.jsp" method="POST">
                        
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" value="<%= rs.getString("email") %>" required><br>
                         <label for="name">Name:</label>
                        <input type="text" id="name" name="name" value="<%= rs.getString("name") %>" required><br>
                        <label for="cname">Community Name:</label>
                        <input type="text" id="cname" name="cname" value="<%= rs.getString("cname") %>" required><br>
                        
                        
                        <label for="cpurpose">Community Purpose:</label>
                        <input type="text" id="cpurpose" name="cpurpose" value="<%= rs.getString("cpurpose") %>" required><br>
                        <label for="cmember">Community Member:</label>
                        <input type="text" id="cmember" name="cmember" value="<%= rs.getString("cmember") %>" required><br>
                        
                        <label for="grouplink">Group Link:</label>
                        <input type="text" id="grouplink" name="grouplink" value="<%= rs.getString("grouplink") %>" required><br>
                        <label for="contact">Contact:</label>
                        <input type="text" id="contact" name="contact" value="<%= rs.getString("contact") %>" required><br>
                       
                        
                        <button type="submit">Update</button>
                    </form>
                    <form action="deletecommunity.jsp" method="POST">
                        <input type="hidden" name="cname" value="<%= rs.getString("cname") %>">
                        <br><button type="submit">Delete</button>
                    </form>
        <% 
                } else {
        %>
                    <p>No job found with the provided ID.</p>
        <% 
                }
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </div>
</body>
</html>


















