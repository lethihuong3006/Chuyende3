*** Settings ***
Documentation     Template robot main suite.
# Suite Setup     Run Keyword    Minimal task
Library           RPA.Browser
Library           Dialogs
Library           RPA.Salesforce

*** Test Cases ***
TC_01. Verify user "ADD TO CART" is successful
    [Setup]    Test Cases Setup
    Navigate to Home Form
    Execute JavaScript    window.scrollTo(0,900)
    Click Element    //a[contains(text(),'$25 Virtual Gift Card')]
    Input "Huong" to Recipient's Name Textarea
    Input "huong@gmail.com" to Recipient's Email Textarea
    Input "Hoang" to Your Name Textarea
    Input "minhhoang@gmail.com" to Your Email Textarea
    Input "Happy" to Message Textarea
    Click "Add to cart" button
    Sleep    2s

TC_02. Verify user "Checkout" is successful
    Click Element    //span[contains(text(),'Shopping cart')]
    Click Element    //input[@id="termsofservice"]
    Click "Checkout" button
    Click "Checkout as Guest" button
    Input "Le" to BillingNewAddress.FirstName Textarea
    Input "Huong" to BillingNewAddress.LastName Textarea
    Input "huongle@gmail.com" to BillingNewAddress.Email Textarea
    Input "ABCCCD" to BillingNewAddress.Company Textarea
    Select "171" to BillingNewAddress.CountryId
    Select "0" to BillingNewAddress.StateProvinceId
    Input "Abbbbbbbbbbb" to BillingNewAddress.City Textarea
    Input "18 Le Lai" to BillingNewAddress.Address1 Textarea
    Input "20 Luu Huu Phuoc" to BillingNewAddress.Address2 Textarea
    Input "AAAAAAAAA" to BillingNewAddress.ZipPostalCode Textarea
    Input "0702334812" to BillingNewAddress.PhoneNumber Textarea
    Input "0902755036" to BillingNewAddress.FaxNumber Textarea
    Click "Continue 1" button
    Click Element    //*[@id="paymentmethod_0"]
    Click "Continue 2" button
    Click "Continue 3" button
    Click "Confirm" button
    [Teardown]    Close All Browsers

*** Keywords ***
Test Cases Setup
    Open Available Browser    https://demo.nopcommerce.com/
    Maximize Browser Window
    Set Selenium Speed    1 seconds

Navigate to Home Form
    Page Should Contain Element    //h2[contains(.,"Welcome to our store")]

Input "${recipientName}" to Recipient's Name Textarea
    Input Text    //input[@id="giftcard_43_RecipientName"]    ${recipientName}

Input "${RecipientEmail'}" to Recipient's Email Textarea
    Input Text    //input[@id="giftcard_43_RecipientEmail"]    ${RecipientEmail'}

Input "${yourname}" to Your Name Textarea
    Input Text    //input[@id='giftcard_43_SenderName']    ${yourname}

Input "${youremail}" to Your Email Textarea
    Input Text    //input[@id='giftcard_43_SenderEmail']    ${youremail}

Input "${message}" to Message Textarea
    Input Text    //textarea[@id="giftcard_43_Message"]    ${message}

Click "Add To Cart" button
    Click Element    //button[@id="add-to-cart-button-43"]
    Sleep    4s
    Page Should Contain Element    //p[@class='content' and contains(.,"The product has been added to your shopping cart" )]

Click Close Notification
    Click Element    //span[@class="close"]
    Sleep    4s

Click "Checkout" button
    Click Element    //button[@id='checkout']
    Sleep    2s
    Page Should Contain Element    //strong[contains(text(),'Checkout as a guest or register')]

Click "Checkout as Guest" button
    Click Element    //button[contains(text(),'Checkout as Guest')]

Input "${firstname}" to BillingNewAddress.FirstName Textarea
    Input Text    //input[@id="BillingNewAddress_FirstName"]    ${firstname}

Input "${lastname}" to BillingNewAddress.LastName Textarea
    Input Text    //input[@id="BillingNewAddress_LastName"]    ${lastname}

Input "${email}" to BillingNewAddress.Email Textarea
    Input Text    //input[@id="BillingNewAddress_Email"]    ${email}

Input "${company}" to BillingNewAddress.Company Textarea
    Input Text    //input[@id="BillingNewAddress_Company"]    ${company}

Select "${country}" to BillingNewAddress.CountryId
    Select From List by Value    //select[@name="BillingNewAddress.CountryId"]    ${country}

Select "${stateprovince}" to BillingNewAddress.StateProvinceId
    Select From List by Value    //select[@id="BillingNewAddress_StateProvinceId"]    ${stateprovince}

Input "${city}" to BillingNewAddress.City Textarea
    Input Text    //input[@id="BillingNewAddress_City"]    ${city}

Input "${address1}" to BillingNewAddress.Address1 Textarea
    Input Text    //input[@id="BillingNewAddress_Address1"]    ${address1}

Input "${address2}" to BillingNewAddress.Address2 Textarea
    Input Text    //input[@id="BillingNewAddress_Address2"]    ${address2}

Input "${zippostalcode}" to BillingNewAddress.ZipPostalCode Textarea
    Input Text    //input[@id="BillingNewAddress_ZipPostalCode"]    ${zippostalcode}

Input "${phonenumber}" to BillingNewAddress.PhoneNumber Textarea
    Input Text    //input[@id="BillingNewAddress_PhoneNumber"]    ${phonenumber}

Input "${faxnumber}" to BillingNewAddress.FaxNumber Textarea
    Input Text    //input[@id="BillingNewAddress_FaxNumber"]    ${faxnumber}

Click "Continue 1" button
    Click Element    //body/div[6]/div[3]/div[1]/div[1]/div[1]/div[2]/ol[1]/li[1]/div[2]/div[1]/button[4]

Click "Continue 2" button
    Click Element    //body/div[6]/div[3]/div[1]/div[1]/div[1]/div[2]/ol[1]/li[2]/div[2]/div[1]/button[1]

Click "Continue 3" button
    Click Element    //body/div[6]/div[3]/div[1]/div[1]/div[1]/div[2]/ol[1]/li[3]/div[2]/div[1]/button[1]

Click "Confirm" button
    Click Element    //button[contains(text(),'Confirm')]
    Sleep    2s
    Page Should Contain Element    //h1[contains(text(),'Thank you')]

Custom Keywords AddToCart

