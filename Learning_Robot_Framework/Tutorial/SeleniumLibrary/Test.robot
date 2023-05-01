*** Settings ***
Documentation     This will deal with Textboxes and different operations on them
...
...               This is written by Suman Maiti
Test Setup        Open Browser    ${url}    ${browser}
Test Teardown     Close All Browsers
Test Timeout      1 min
Library           SeleniumLibrary

*** variables ***
${browser}        chrome
${url}            https://www.htmlelements.com/demos/textbox/




*** Test Cases ***
TC_01_Overview_Tab_textboxes
    Set Selenium Implicit Wait    1 sec
    Maximize Browser Window
    Set Selenium Timeout    10sec
    Wait Until Element Is Visible    //h1[text()='Smart.TextBox']
    Sleep    2
    Select Frame    //iframe[@class='demo-frame']
    Page Should Contain Element    //span[@id="textBox86d0Hint"]
