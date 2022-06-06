** Settings **
Documentation     Template robot main suite.
# Suite Setup     Run Keyword    Minimal task
Library           RPA.Browser
Library           Dialogs
Library           RPA.Salesforce

** Test Cases **
TC_01. Verify user "ADD TO CART" is successful when selecting Category Digital downloads
    [Setup]    Test Cases Setup
    Navigate to Home Form
    Execute JavaScript    window.scrollTo(0,200)
    Click "Digital downloads" on Navbar to Access "Digital downloads" Page
    Click to button ADD TO CART at number "2"
    Capture Page Screenshot    ss01_TC_01_AddToCart.png
    [Teardown]    Close All Browsers

TC_02. Verify user "ADD TO CART" is successful when selecting Category Books
    [Setup]    Test Cases Setup
    Navigate to Home Form
    Execute JavaScript    window.scrollTo(0,200)
    Click "Books" on Navbar to Access "Books" Page
    Click to button ADD TO CART at number "2"
    Capture Page Screenshot    ss02TC_02_AddToCart.png
    [Teardown]    Close All Browsers

TC_03. Verify user "ADD TO CART" is successful when selecting Catalogy Jewerly
    [Setup]    Test Cases Setup
    Navigate to Home Form
    Execute JavaScript    window.scrollTo(0,200)
    Click "Jewelry" on Navbar to Access "Jewerly" Page
    Click to button ADD TO CART at number "3"
    Capture Page Screenshot    ss03_TC_03_AddToCart.png
    [Teardown]    Close All Browsers

** Keywords **
Navigate to Home Form
    Page Should Contain Element    //h2[contains(.,"Welcome to our store")]

Click "${category}" on Navbar to Access "${title}" Page
    ${link} =    Set Variable If    "${category}"=="Digital downloads"    /digital-downloads    "${category}"=="Books"    /books    "${category}"=="Jewelry"    /jewelry
    Click Element    //ul[@class="top-menu notmobile"]//a[@href='${link}']

Click to button ADD TO CART at number "${addtocart}"
    Click Element    //div[@class="item-grid"]//div[@class="item-box"][${addtocart}]//button[@class="button-2 product-box-add-to-cart-button"]
    Sleep    4s
    Page Should Contain Element    //p[@class='content' and contains(.,"The product has been added to your shopping cart" )]

Click Close Notification
    Click Element    //span[@class="close"]
    Sleep    2s

Test Cases Setup
    Open Available Browser    https://demo.nopcommerce.com/
    Maximize Browser Window

Custom Keywords AddToCart