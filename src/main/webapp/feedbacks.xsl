<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="/feedbacks">
    <html>
      <head>
        <title>Feedback Summary</title>
        <style>
          body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: url('skin.jpg') no-repeat center center fixed;
            background-size: cover;
            color: white;
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
          h2 {
            text-align: center;
            margin-top: 50px;
            text-shadow: 2px 2px 5px black;
          }
          table {
            width: 80%;
            margin: 30px auto;
            border-collapse: collapse;
            text-align: left;
            font-size: 16px;
            background: rgba(255,255,255,0.1);
            border-radius: 10px;
            overflow: hidden;
          }
          th, td {
            padding: 12px;
            border: 1px solid rgba(255,255,255,0.3);
          }
          th {
            background: rgba(255,255,255,0.2);
          }
          tr:hover {
            background: rgba(255,255,255,0.2);
          }
          a {
            display: inline-block;
            margin: 20px auto;
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
        <h2>All Feedbacks</h2>
        <table border="1">
          <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Rating</th>
            <th>Comment</th>
            <th>Date</th>
          </tr>
          <xsl:for-each select="feedback">
            <tr>
              <td><xsl:value-of select="id"/></td>
              <td><xsl:value-of select="username"/></td>
              <td><xsl:value-of select="rating"/></td>
              <td><xsl:value-of select="comment"/></td>
              <td><xsl:value-of select="date"/></td>
            </tr>
          </xsl:for-each>
        </table>
        <div style="text-align:center;">
          <a href="adminDashboard.jsp">⬅ Back to Dashboard</a>
        </div>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
