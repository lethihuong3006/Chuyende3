** Settings **
Documentation     Template robot main suite.
# Suite Setup     Run Keyword    Minimal task
Library           RPA.Browser
Library           Dialogs


** Test Cases **

TC_01. Verify user ChangePassword successful 
    [Setup]    Test Cases Setup
    Navigate to Login Form
    Input "huong@gmail.com" to Email Textarea
    Input "222222" to Password Textarea
    Click "Login" button
    Navigate to MyAccount Form
    Navigate to ChangePassword Form
    Input "222222" to OldPassword Textarea
    Input "22222211" to NewPassword Textarea
    Input "22222211" to ConfirmPassword Textarea
    Click "ChangePassword" button
    Capture Page Screenshot    TC_01_ChangePassword.png
    Click Close Notification
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
    Input Text    //input[@class="email"]    ${email}

Input "${password}" to Password Textarea
    Input Text    //input[@class="password"]    ${password}

Input "${oldpassword}" to OldPassword Textarea
    Input Text    //input[@id="OldPassword"]    ${oldpassword}

Input "${newpassword}" to NewPassword Textarea
    Input Text    //input[@id="NewPassword"]    ${newpassword}

Input "${confirmpassword}" to ConfirmPassword Textarea
    Input Text    //input[@id="ConfirmNewPassword"]    ${confirmpassword}

Click "Login" button
    Click Element    //button[@class="button-1 login-button"]

Navigate to MyAccount Form
    Click Element    //a[@class="ico-account"]
    Page Should Contain Element    //div[contains(.,"My account")]

Navigate to ChangePassword Form
    Click Element     //a[contains(.,"Change password")]

Click "ChangePassword" button
    Click Element    //button[@class="button-1 change-password-button"]
    Page Should Contain Element    //p[@class='content' and contains(.,"Password was changed" )]

Click Close Notification
    Click Element    //span[@class="close"]
    Sleep    2s
Custom Keywords ChangePassword