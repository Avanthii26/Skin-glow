package demo;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.edge.EdgeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;
import java.util.List;

public class AdminLoginElementsTest {

    public static void main(String[] args) {

        System.setProperty("webdriver.edge.driver", 
            "C:\\Users\\AVANTHIKA\\Downloads\\edgedriver_win64\\msedgedriver.exe");

        WebDriver driver = new EdgeDriver();

        try {
            driver.get("http://localhost:8081/Skin/login.jsp");

            WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));

            WebElement adminIdInput = wait.until(
                    ExpectedConditions.visibilityOfElementLocated(By.name("email"))
            );
            WebElement passwordInput = wait.until(
                    ExpectedConditions.visibilityOfElementLocated(By.name("password"))
            );
            WebElement loginButton = wait.until(
                    ExpectedConditions.elementToBeClickable(By.tagName("button"))
            );

            System.out.println("Admin ID displayed: " + adminIdInput.isDisplayed());
            System.out.println("Admin ID enabled: " + adminIdInput.isEnabled());
            System.out.println("Password displayed: " + passwordInput.isDisplayed());
            System.out.println("Password enabled: " + passwordInput.isEnabled());
            System.out.println("Login button displayed: " + loginButton.isDisplayed());
            System.out.println("Login button enabled: " + loginButton.isEnabled());

            adminIdInput.clear();
            adminIdInput.sendKeys("admin@gmail.com");
            passwordInput.clear();
            passwordInput.sendKeys("admin@123");

            System.out.println("Admin ID placeholder: " + adminIdInput.getAttribute("placeholder"));
            System.out.println("Password placeholder: " + passwordInput.getAttribute("placeholder"));
            System.out.println("Login button text: " + loginButton.getText());

            List<WebElement> inputFields = driver.findElements(By.tagName("input"));
            System.out.println("Total input fields found: " + inputFields.size());
            for (WebElement input : inputFields) {
                System.out.println("Input placeholder: " + input.getAttribute("placeholder"));
            }

            loginButton.click();

            Thread.sleep(2000); 
            System.out.println("Page title after login: " + driver.getTitle());
            System.out.println("Page source length: " + driver.getPageSource().length());

            WebElement signupLink = wait.until(
                    ExpectedConditions.visibilityOfElementLocated(By.linkText("Signup"))
            );
            System.out.println("Signup link displayed: " + signupLink.isDisplayed());
            System.out.println("Signup link text: " + signupLink.getText());
            System.out.println("Signup link href: " + signupLink.getAttribute("href"));

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            driver.quit(); 
        }
    }
}