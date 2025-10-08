<%@ page import="javax.xml.parsers.*, org.w3c.dom.*, java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Feedbacks - Skin Glow</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: url('skin.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        body::before {
            content: "";
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background: rgba(0,0,0,0.6);
            backdrop-filter: blur(3px);
            z-index: -1;
        }
        .summary-box {
            background: rgba(255,255,255,0.1);
            padding: 40px 60px;
            border-radius: 20px;
            box-shadow: 0px 4px 20px rgba(0,0,0,0.5);
            width: 80%;
            max-width: 800px;
            overflow-x: auto;
        }
        h2 {
            font-size: 32px;
            margin-bottom: 30px;
            text-align: center;
            text-shadow: 2px 2px 5px black;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
            font-size: 16px;
        }
        th, td {
            padding: 10px;
            border: 1px solid rgba(255,255,255,0.3);
        }
        th {
            background: rgba(255,255,255,0.2);
        }
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 30px;
            font-size: 18px;
            font-weight: bold;
            text-decoration: none;
            color: white;
            border-radius: 25px;
            background: linear-gradient(to right, #36d1dc, #5b86e5);
            transition: 0.3s;
        }
        a:hover {
            background: linear-gradient(to right, #5b86e5, #36d1dc);
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="summary-box">
        <h2>All Feedbacks</h2>

<%
String xmlFile = "C:/Users/AVANTHIKA/eclipse-workspace/Skin/feedbacks.xml";
File f = new File(xmlFile);

if (f.exists()) {
    try {
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        DocumentBuilder db = dbf.newDocumentBuilder();
        Document doc = db.parse(f);
        NodeList list = doc.getElementsByTagName("feedback");

        if (list.getLength() > 0) {
%>
<table>
<tr><th>ID</th><th>Username</th><th>Rating</th><th>Comment</th><th>Date</th></tr>
<%
            for (int i = 0; i < list.getLength(); i++) {
                Element fb = (Element) list.item(i);
%>
<tr>
<td><%= fb.getElementsByTagName("id").item(0).getTextContent() %></td>
<td><%= fb.getElementsByTagName("username").item(0).getTextContent() %></td>
<td><%= fb.getElementsByTagName("rating").item(0).getTextContent() %></td>
<td><%= fb.getElementsByTagName("comment").item(0).getTextContent() %></td>
<td><%= fb.getElementsByTagName("date").item(0).getTextContent() %></td>
</tr>
<%
            } // end for
%>
</table>
<%
        } else {
%>
<p style="text-align:center; font-size:18px;">No feedback submitted yet.</p>
<%
        }
    } catch (Exception e) {
%>
<p style="text-align:center; font-size:18px; color:red;">Error reading feedbacks: <%= e.getMessage() %></p>
<%
    }
} else {
%>
<p style="text-align:center; font-size:18px;">No feedback submitted yet.</p>
<%
}
%>

        <div style="text-align:center;">
            <a href="feedback.jsp">Submit Another Feedback</a>
        </div>
    </div>
</body>
</html>
