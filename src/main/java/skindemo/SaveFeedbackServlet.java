package skindemo;

import java.io.*;
import java.time.LocalDate;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.xml.parsers.*;
import javax.xml.transform.*;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.*;

public class SaveFeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private String xmlFilePath;

    @Override
    public void init() throws ServletException {
   
        xmlFilePath = "C:/Users/AVANTHIKA/eclipse-workspace/Skin/feedbacks.xml";
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        response.getWriter().println("<h3>SaveFeedbackServlet is running. Please submit feedback using the form.</h3>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String rating = request.getParameter("rating");
        String comment = request.getParameter("comment");
        String date = LocalDate.now().toString();

        try {
            File xmlFile = new File(xmlFilePath);
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();

            Document doc;
            Element root;

            if (!xmlFile.exists()) {
             
                doc = dBuilder.newDocument();
                root = doc.createElement("feedbacks");
                doc.appendChild(root);
            } else {
                doc = dBuilder.parse(xmlFile);
                root = doc.getDocumentElement();
            }

            // New feedback element
            Element feedback = doc.createElement("feedback");

            Element id = doc.createElement("id");
            id.setTextContent(String.valueOf(root.getElementsByTagName("feedback").getLength() + 1));
            feedback.appendChild(id);

            Element uname = doc.createElement("username");
            uname.setTextContent(username);
            feedback.appendChild(uname);

            Element rate = doc.createElement("rating");
            rate.setTextContent(rating);
            feedback.appendChild(rate);

            Element comm = doc.createElement("comment");
            comm.setTextContent(comment);
            feedback.appendChild(comm);

            Element dt = doc.createElement("date");
            dt.setTextContent(date);
            feedback.appendChild(dt);

            root.appendChild(feedback);

            
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            transformer.setOutputProperty(OutputKeys.INDENT, "yes");

            DOMSource source = new DOMSource(doc);
            StreamResult result = new StreamResult(xmlFile);
            transformer.transform(source, result);

            System.out.println("Feedback saved to: " + xmlFilePath);
          
            response.sendRedirect("feedbacks.jsp");

        } catch (Exception e) {
            throw new ServletException("Error saving feedback", e);
        }
    }
}
