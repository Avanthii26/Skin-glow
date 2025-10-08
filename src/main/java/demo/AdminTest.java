package demo;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.edge.EdgeDriver;

public class AdminTest {
    public static void main(String[] args) throws InterruptedException {

        WebDriver driver = new EdgeDriver();

        driver.get("http://localhost:8081/Skin/login.jsp");
        System.out.println("Opened Admin Login Page");

        System.out.println("Title: " + driver.getTitle());
        System.out.println("URL: " + driver.getCurrentUrl());

        Thread.sleep(3000);
        driver.quit(); 
    }
}
