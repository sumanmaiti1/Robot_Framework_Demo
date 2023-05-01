*** Settings ***
Documentation     This will deal with Textboxes and different operations on them
...
...               This is written by Suman Maiti
#Test Setup        Open Browser    ${url}    ${browser}
#Test Teardown     Close All Browsers
Test Timeout      1 min
Library           SeleniumLibrary

*** variables ***
${browser}        chrome
${url}            https://www.htmlelements.com/demos/textbox/
${value}           10


*** Test Cases ***
TC_Test
    ${element}    Set Variable    Suman
    ${locator}=   Catenate    SEPARATOR=    //div[text()='    ${element}   '] 
    Log    ${locator}    

    IF    '${browser}' == 'chrome'
        Log    "inside if"
    ELSE
        Log    "inside else"
    END    

