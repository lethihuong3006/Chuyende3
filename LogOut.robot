** Settings **
Documentation     Template robot main suite.
# Suite Setup     Run Keyword    Minimal task
Library           RPA.Browser
Library           Dialogs


** Test Cases **

TC_01. Verify user LogOut successful 
    [Setup]    Test Cases Setup
    Navigate to Login Form
    Input "huong@gmail.com" to Email Textarea
    Input "Huong@123" to Password Textarea
    Click "Login" button
    Navigate to Logout Form
    Capture Page Screenshot    TC_01_LogOut.png
    [Teardown]    Close All Browsers

TC_02. Verify user LogOut successful
    [Setup]    Test Cases Setup
    Navigate to Register Form
    Check "male" to Gender
    Input "Le" to Firstname Textarea
    Input "Huong" to Lastname Textarea
    Select "30" to DateOfBirthDay
    Select "5" to DateOfBirthMonth
    Select "2000" to DateOfBirthYear
    Input "mmmmm@gmail.com" to Email Textarea
    Input "Hhhhhh" to Companyname Textarea
    Select "true" to Newsletter
    Input "111111" to Password Textarea
    Input "111111" to Confirmpassword Textarea
    Click "Register" button
    Page Should Contain Element    //div[contains(.,"Your registration completed")]
    Capture Page Screenshot    TC_02_LogOut.png
    Navigate to Logout Form
    [Teardown]    Close All Browsers
** Keywords **
Test Cases Setup
    Open Available Browser    https://demo.nopcommerce.com/
    Maximize Browser Window
    Set Selenium Speed    1 seconds

Navigate to Login Form
    Click Element    //a[@class="ico-login"]
    Page Should Contain Element    //h1[contains(.,"Welcome, Please Sign In!")]

Navigate to Register Form
    Click Element    //a[@class="ico-register"]
    Page Should Contain Element    //h1[contains(.,"Register")]

Input "${email}" to Email Textarea
    Input Text    //input[@id="Email"]    ${email}
    Execute JavaScript    window.scrollTo(0,200)

Input "${password}" to Password Textarea
    Input Text    //input[@id="Password"]    ${password}

Click "Login" button
    Click Element    //button[@class="button-1 login-button"]

Check "${gender}" to Gender
    Click Element    //input[@id="gender-${gender}"]

Input "${firstname}" to Firstname Textarea
    Input Text    //input[@id="FirstName"]    ${firstname}

Input "${lastname}" to Lastname Textarea
    Input Text    //input[@id="LastName"]    ${lastname}

Select "${day}" to DateOfBirthDay
    Select From List by Value    //select[@name="DateOfBirthDay"]    ${day}

Select "${month}" to DateOfBirthMonth
    Select From List by Value    //select[@name="DateOfBirthMonth"]    ${month}

Select "${year}" to DateOfBirthYear
    Select From List by Value    //select[@name="DateOfBirthYear"]    ${year}

Navigate to Logout Form
    Click Element    //a[@class="ico-logout"]
    Page Should Contain Element    //h2[contains(.,"Welcome to our store")]

Input "${companyname}" to Companyname Textarea
    Input Text    //input[@id="Company"]    ${companyname}

Select "${newletter}" to Newsletter
    Select Checkbox    //input[@name="Newsletter"]

Input "${confirmpassword}" to Confirmpassword Textarea
    Input Text    //input[@id="ConfirmPassword"]    ${confirmpassword}

Click "Register" button
    Click Element    //button[@class="button-1 register-next-step-button"]
    Execute JavaScript    window.scrollTo(0,200)
Custom Keywords LogOut



    

