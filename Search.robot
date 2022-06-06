** Settings **
Documentation     Template robot main suite.
# Suite Setup     Run Keyword    Minimal task
Library           RPA.Browser
Library           Dialogs

** Test Cases **
TC_01. Verify user Search successful
    [Setup]    Test Cases Setup
    Input "Apple MacBook Pro 13-inch" to Search Textarea
    Click "Search" button
    Sleep    2s
    Execute JavaScript    window.scrollTo(0,400)
    Capture Page Screenshot    TC_01_Search.png
    [Teardown]    Close All Browsers

TC_02. Verify user Search unsuccessful when the product does not exist
    [Setup]    Test Cases Setup
    Input "mmmmm" to Search Textarea
    Click "Search" button
    Page Should Contain Element    //div[contains(.,"No products were found that matched your criteria.")]
    Sleep    2s
    Capture Page Screenshot    TC_02_Search.png
    [Teardown]    Close All Browsers

TC_03. Verify user Search unsuccessful when Search term length is les than 3 characters
    [Setup]    Test Cases Setup
    Set Selenium Speed    1 seconds
    Input "mm" to Search Textarea
    Click "Search" button
    Page Should Contain Element    //div[contains(.,"Search term minimum length is 3 characters")]
    Sleep    2s
    Capture Page Screenshot    TC_03_Search.png
    [Teardown]    Close All Browsers
    
TC_04. Verify user Search unsuccessful when Search special characters
    [Setup]    Test Cases Setup
    Set Selenium Speed    1 seconds
    Input "*******!!!!" to Search Textarea
    Click "Search" button
   Page Should Contain Element    //div[contains(.,"No products were found that matched your criteria.")]
    Sleep    2s
    Capture Page Screenshot    TC_04_Search.png
    [Teardown]    Close All Browsers

** Keywords **
Test Cases Setup
    Open Available Browser    https://demo.nopcommerce.com/
    Maximize Browser Window
    Set Selenium Speed    1.8 seconds

Input "${search}" to Search Textarea
    Input Text    //input[@class="search-box-text ui-autocomplete-input"]    ${search}

Click "Search" button
    Click Element    //button[@class="button-1 search-box-button"]

Custom Keywords Search