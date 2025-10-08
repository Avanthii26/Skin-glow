package demo;

import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.edge.EdgeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.time.Duration;
import java.util.List;

public class AdminLoginTest {

    public static void main(String[] args) {

        System.setProperty("webdriver.edge.driver",
                "C:\\Users\\AVANTHIKA\\Downloads\\edgedriver_win64\\msedgedriver.exe");

        WebDriver driver = new EdgeDriver();

        try {
            driver.get("http://localhost:8081/Skin/login.jsp");

            WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(15));

           
            WebElement formWrapper = wait.until(
                    ExpectedConditions.visibilityOfElementLocated(By.className("form-wrapper"))
            );

            // 2. By id / name
            WebElement emailInputById = wait.until(
                    ExpectedConditions.visibilityOfElementLocated(By.id("email"))
            );
            WebElement passwordInputByName = wait.until(
                    ExpectedConditions.visibilityOfElementLocated(By.name("password"))
            );

           
            WebElement loginButtonByTag = wait.until(
                    ExpectedConditions.visibilityOfElementLocated(By.tagName("button"))
            );

            WebElement loginButtonByCss = wait.until(
                    ExpectedConditions.elementToBeClickable(By.cssSelector("button[type='submit']"))
            );
            WebElement emailInputByCss = driver.findElement(By.cssSelector("input[name='email']"));
            WebElement passwordInputByCss = driver.findElement(By.cssSelector("input[name='password']"));

            WebElement loginButtonByXpath = driver.findElement(By.xpath("//button[text()='Login']"));
            WebElement emailInputByXpath = driver.findElement(By.xpath("//input[@id='email']"));
            WebElement passwordInputByXpath = driver.findElement(By.xpath("//input[@id='password']"));

           
            emailInputById.clear();
            emailInputById.sendKeys("admin@gmail.com");

            passwordInputByName.clear();
            passwordInputByName.sendKeys("admin@123");

            System.out.println("Email placeholder (CSS): " + emailInputByCss.getAttribute("placeholder"));
            System.out.println("Password placeholder (XPath): " + passwordInputByXpath.getAttribute("placeholder"));
            System.out.println("Login button text (tagName): " + loginButtonByTag.getText());
            System.out.println("Form container className: " + formWrapper.getAttribute("class"));

            List<WebElement> inputFields = driver.findElements(By.tagName("input"));
            System.out.println("Total input fields: " + inputFields.size());
            for (WebElement input : inputFields) {
                System.out.println("Input placeholder: " + input.getAttribute("placeholder"));
            }

            loginButtonByCss.click();

            Alert alert = wait.until(ExpectedConditions.alertIsPresent());
            System.out.println("Alert text: " + alert.getText());
            alert.accept(); 

            wait.until(ExpectedConditions.titleContains("Products")); 

            System.out.println("Page title after login: " + driver.getTitle());

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            driver.quit();
        }
    }
}
