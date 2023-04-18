*** Settings ***
Documentation    This will deal with Textboxes and different operations on them
...    
...    This is written by Suman Maiti  

Library    SeleniumLibrary
Test Setup    Open Browser    ${url}    ${browser}  
Test Teardown    Close All Browsers
Test Timeout    1 min

*** variables ***
${browser}    chrome
${url}    https://www.htmlelements.com/demos/textbox/

*** Test Cases ***
TC_01_Overview_Tab_textboxes
    Set Test Documentation    This Test case deals with the textbox present in OverviewTab
    Set Selenium Implicit Wait    10 sec
    Set Selenium Timeout    10sec
    Maximize Browser Window
    Wait Until Element Is Visible    //h1[text()='Smart.TextBox']
    Sleep    2


*** Keywords ***
