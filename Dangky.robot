** Settings **
Documentation     Template robot main suite.
# Suite Setup     Run Keyword    Minimal task
Library           RPA.Browser
Library           Dialogs


** Test Cases **
TC_01. Verify user registration unsuccessful when leave field blank First name
    [Setup]    Test Cases Setup
    Navigate to Register Form
    Check "female" to Gender
    Input "" to Firstname Textarea
    Input "Huong" to Lastname Textarea
    Select "30" to DateOfBirthDay
    Select "6" to DateOfBirthMonth
    Select "2000" to DateOfBirthYear
    Input "huongle1@gmail.com" to Email Textarea
    Input "Hhhhhh" to Companyname Textarea
    Select "true" to Newsletter
    Input "11111111" to Password Textarea
    Input "11111111" to Confirmpassword Textarea
    Click "Register" button
    Page Should Contain Element    //span[contains(.,"First name is required.")]
    Sleep    2s
    Capture Page Screenshot    TC_01_Register.png
    [Teardown]    Close All Browsers

TC_02. Verify user registration unsuccessful when leave field blank Last name
    [Setup]    Test Cases Setup
    Navigate to Register Form
    Check "female" to Gender
    Input "Le" to Firstname Textarea
    Input "" to Lastname Textarea
    Select "30" to DateOfBirthDay
    Select "6" to DateOfBirthMonth
    Select "2000" to DateOfBirthYear
    Input "huonghuong1@gmail.com" to Email Textarea
    Input "Hhhhhh" to Companyname Textarea
    Select "true" to Newsletter
    Input "11111111" to Password Textarea
    Input "11111111" to Confirmpassword Textarea
    Click "Register" button
    Page Should Contain Element    //span[contains(.,"Last name is required.")]
    Sleep    2s
    Capture Page Screenshot    TC_02_Register.png
    [Teardown]    Close All Browsers

TC_03. Verify user registration unsuccessful when leave field blank Email
    [Setup]    Test Cases Setup
    Navigate to Register Form
    Check "female" to Gender
    Input "Le" to Firstname Textarea
    Input "Huong" to Lastname Textarea
    Select "30" to DateOfBirthDay
    Select "6" to DateOfBirthMonth
    Select "2000" to DateOfBirthYear
    Input "" to Email Textarea
    Input "Hhhhhh" to Companyname Textarea
    Select "true" to Newsletter
    Input "222222" to Password Textarea
    Input "222222" to Confirmpassword Textarea
    Click "Register" button
    Page Should Contain Element    //span[@id="Email-error"]
    Sleep    2s
    Capture Page Screenshot    TC_03_Register.png
    [Teardown]    Close All Browsers

TC_04. Verify that user registration unsuccessful when leave field blank Password
    [Setup]    Test Cases Setup
    Navigate to Register Form
    Check "female" to Gender
    Input "Le" to Firstname Textarea
    Input "Huong" to Lastname Textarea
    Select "30" to DateOfBirthDay
    Select "6" to DateOfBirthMonth
    Select "2000" to DateOfBirthYear
    Input "lehuong1@gmail.com" to Email Textarea
    Input "Hhhhhh" to Companyname Textarea
    Select "true" to Newsletter
    Input "" to Password Textarea
    Input "222222" to Confirmpassword Textarea
    Click "Register" button
    Page Should Contain Element    //span[@data-valmsg-for="Password"]
    Sleep    2s
    Capture Page Screenshot    TC_04_Register.png
    [Teardown]    Close All Browsers

TC_05. Verify that user registration unsuccessful when leave field blank Confirm password
    [Setup]    Test Cases Setup
    Navigate to Register Form
    Check "female" to Gender
    Input "Le" to Firstname Textarea
    Input "Huong" to Lastname Textarea
    Select "30" to DateOfBirthDay
    Select "6" to DateOfBirthMonth
    Select "2000" to DateOfBirthYear
    Input "lehuong2@gmail.com" to Email Textarea
    Input "Hhhhhh" to Companyname Textarea
    Select "true" to Newsletter
    Input "222222" to Password Textarea
    Input "" to Confirmpassword Textarea
    Click "Register" button
    Page Should Contain Element    //span[@id="ConfirmPassword-error"]
    Sleep    2s
    Capture Page Screenshot    TC_05_Register.png
    [Teardown]    Close All Browsers

TC_06. Verify of registered user unsuccessful when wrong email format was entered
    [Setup]    Test Cases Setup
    Navigate to Register Form
    Check "female" to Gender
    Input "Le" to Firstname Textarea
    Input "Huong" to Lastname Textarea
    Select "30" to DateOfBirthDay
    Select "6" to DateOfBirthMonth
    Select "2000" to DateOfBirthYear
    Input "lehuonggmail.com" to Email Textarea
    Input "Hhhhhh" to Companyname Textarea
    Select "true" to Newsletter
    Input "222222" to Password Textarea
    Input "222222" to Confirmpassword Textarea
    Click "Register" button
    Page Should Contain Element    //span[contains(.,"Wrong email")]
    Sleep    2s
    Capture Page Screenshot    TC_06_Register.png
    [Teardown]    Close All Browsers

TC_07. Verify that user entered Password must match Confirm Password
    [Setup]    Test Cases Setup
    Navigate to Register Form
    Check "female" to Gender
    Input "Le" to Firstname Textarea
    Input "Huong" to Lastname Textarea
    Select "30" to DateOfBirthDay
    Select "6" to DateOfBirthMonth
    Select "2000" to DateOfBirthYear
    Input "lehuong13@gmail.com" to Email Textarea
    Input "Hhhhhh" to Companyname Textarea
    Select "true" to Newsletter
    Input "222222" to Password Textarea
    Input "2222221" to Confirmpassword Textarea
    Click "Register" button
    Page Should Contain Element    //span[contains(.,"The password and confirmation password do not match.")]
    Sleep    2s
    Capture Page Screenshot    TC_07_Register.png
    [Teardown]    Close All Browsers

TC_08. Verify user Register unsuccessful when entering a password less than 6 characters
    [Setup]    Test Cases Setup
    Navigate to Register Form
    Check "female" to Gender
    Input "Le" to Firstname Textarea
    Input "Huong" to Lastname Textarea
    Select "30" to DateOfBirthDay
    Select "6" to DateOfBirthMonth
    Select "2000" to DateOfBirthYear
    Input "lehuong124@gmail.com" to Email Textarea
    Input "Hhhhhh" to Companyname Textarea
    Select "true" to Newsletter
    Input "2222" to Password Textarea
    Input "2222" to Confirmpassword Textarea
    Click "Register" button
    Page Should Contain Element    //span[@id="Password-error"]
    Sleep    2s
    Capture Page Screenshot    TC_08_Register.png
    [Teardown]    Close All Browsers

TC_09. Verify user Rigister successful
    [Setup]    Test Cases Setup
    Navigate to Register Form
    Check "male" to Gender
    Input "Le" to Firstname Textarea
    Input "Huong" to Lastname Textarea
    Select "30" to DateOfBirthDay
    Select "5" to DateOfBirthMonth
    Select "2000" to DateOfBirthYear
    Input "huong@gmail.com" to Email Textarea
    Input "Hhhhhh" to Companyname Textarea
    Select "true" to Newsletter
    Input "Huong@123" to Password Textarea
    Input "Huong@123" to Confirmpassword Textarea
    Click "Register" button
    Page Should Contain Element    //div[contains(.,"Your registration completed")]
    Sleep    2s
    Capture Page Screenshot    TC_09_Register.png
    [Teardown]    Close All Browsers

** Keywords **
Test Cases Setup
    Open Available Browser    https://demo.nopcommerce.com/
    Maximize Browser Window
    Set Selenium Speed    0.4 seconds

Navigate to Register Form
    Sleep    1s
    Click Element    //a[@class="ico-register"]
    Page Should Contain Element    //h1[contains(.,"Register")]

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

Input "${email}" to Email Textarea
    Input Text    //input[@id="Email"]    ${email}
    Execute JavaScript    window.scrollTo(0,200)

Input "${companyname}" to Companyname Textarea
    Input Text    //input[@id="Company"]    ${companyname}

Select "${newletter}" to Newsletter
    Select Checkbox    //input[@name="Newsletter"]

Input "${password}" to Password Textarea
    Input Text    //input[@id="Password"]    ${password}

Input "${confirmpassword}" to Confirmpassword Textarea
    Input Text    //input[@id="ConfirmPassword"]    ${confirmpassword}

Click "Register" button
    Sleep    2s
    Click Element    //button[@class="button-1 register-next-step-button"]
    

Custom Keywords Register