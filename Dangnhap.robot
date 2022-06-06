** Settings **
Documentation     Template robot main suite.
# Suite Setup     Run Keyword    Minimal task
Library           RPA.Browser
Library           Dialogs


** Test Cases **
TC_01. Verify user Login unsuccessful when the using wrong Email
    [Setup]    Test Cases Setup
    Navigate to Login Form
    Input "leeeeeeeeeeeeeeeeeeeeee@gmail.com" to Email Textarea
    Input "111111" to Password Textarea 
    Click "Login" button
    Page Should Contain Element    //div[@class="message-error validation-summary-errors"]
    Sleep    2s
    Capture Page Screenshot    TC_01_LoginPage.png
    [Teardown]    Close All Browsers

TC_02. Verify user Login unsuccessful when the using wrong Password
    [Setup]    Test Cases Setup
    Navigate to Login Form
    Input "huong@gmail.com" to Email Textarea
    Input "222222" to Password Textarea
    Click "Login" button
    Page Should Contain Element    //div[@class="message-error validation-summary-errors"]
    Sleep    2s
    Capture Page Screenshot    TC_02_LoginPage.png
    [Teardown]    Close All Browsers

TC_03. Verify user Login unsuccessful when leaving the field blank Email
    [Setup]    Test Cases Setup
    Navigate to Login Form
    Input "" to Email Textarea
    Input "111111" to Password Textarea
    Click "Login" button
    Page Should Contain Element    //span[contains(.,"Please enter your email")]
    Sleep    2s
    Capture Page Screenshot    TC_03_LoginPage.png
    [Teardown]    Close All Browsers

TC_04. Verify user Login unsuccessful when leaving the field blank Password
    [Setup]    Test Cases Setup
    Navigate to Login Form
    Input "huong@gmail.com" to Email Textarea
    Input "" to Password Textarea
    Click "Login" button
    Page Should Contain Element    //div[@class="message-error validation-summary-errors"]
    Sleep    2s
    Capture Page Screenshot    TC_04_LoginPage.png
    [Teardown]    Close All Browsers

TC_05. Verify user login is unsuccessful when leaving all the fields blank
    [Setup]    Test Cases Setup
    Navigate to Login Form
    Input "" to Email Textarea
    Input "" to Password Textarea
    Click "Login" button
    Page Should Contain Element    //span[contains(.,"Please enter your email")]
    Sleep    2s
    Capture Page Screenshot    TC_05_LoginPage.png
    [Teardown]    Close All Browsers

TC_06. Verify user login unsuccessful when entering wrong email format
    [Setup]    Test Cases Setup
    Navigate to Login Form
    Input "huong.com" to Email Textarea
    Input "111111" to Password Textarea
    Click "Login" button
    Page Should Contain Element    //span[contains(.,"Wrong email")]
    Sleep    2s
    Capture Page Screenshot    TC_06_LoginPage.png
    [Teardown]    Close All Browsers

TC_07. Verify user Login successful when using correctly Email and Password
    [Setup]    Test Cases Setup
    Navigate to Login Form
    Input "huong@gmail.com" to Email Textarea
    Input "Huong@123" to Password Textarea
    Click "Login" button
    Sleep    2s
    Execute JavaScript    window.scrollTo(0,200)
    [Teardown]    Close All Browsers


** Keywords **
Test Cases Setup
    Open Available Browser    https://demo.nopcommerce.com/
    Maximize Browser Window
    Set Selenium Speed    1 seconds

Navigate to Login Form
    Click Element    //a[@class="ico-login"]
    Page Should Contain Element    //h1[contains(.,"Welcome, Please Sign In!")]
    
Input "${email}" to Email Textarea
    Input Text    //input[@id="Email"]    ${email}

Input "${password}" to Password Textarea
    Input Text    //input[@class="password"]    ${password}

Click "Login" button
    Click Element    //button[@class="button-1 login-button"]

Custom Keywords Login