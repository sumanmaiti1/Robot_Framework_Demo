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
    Verify if page is populated successfully
    #--------for Name Textbox ---------------
    ${default_text}    Get Element Attribute    xpath://input[contains(@placeholder,'Name')]    placeholder
    log    Default value of the textbox is ${default_text}
    Input Text    xpath://input[contains(@placeholder,'Name')]    Suman Maiti
    #${text_in_textbox}    Get Text    xpath://input[contains(@placeholder,'Name')]
    ${text_in_textbox}    Get Element Attribute   xpath://input[contains(@placeholder,'Name')]    value
    log    Text value of the Name textbox is ${text_in_textbox}

    #--------for Address & City Text Box---------------
    Input Text    xpath://input[contains(@placeholder,'Address')]    Vrindaban
    Input Text    xpath://input[contains(@placeholder,'City')]    Mathura

    #--------for Auto Suggestion Text Box---------------
    Input Text    //span[@id='layoutStateActionButton']/input[1]    N
    Page Should Contain Element    //smart-list-item[@label='NC'] 
    Click Element    //smart-list-item[@label='NC'] 
    ${text_in_textbox}    Get Text    //span[@id='layoutStateActionButton']/input[1] 
    log    Text value of the Address textbox is ${text_in_textbox}
    
    #--------for ZIP, Phone,ProductName,Price, Textbox ---------------
    Input Text    //input[@placeholder="Zip"]    721636
    Input Text    //input[@placeholder="Phone"]    9876543210
    Input Text    //input[@placeholder="Product name"]    Product${SPACE}${SPACE}${SPACE}001
    Input Text    //input[@placeholder="Price"]    10.00
    Input Text    //span[@id='layoutProductCategoryActionButton']/input[1]    Cal
    Page Should Contain Element    //smart-list-item[@label='California'] 
    Click Element    //smart-list-item[@label='California'] 
    
    #--------for Location,Description ---------------
    Input Text    //input[@placeholder="Location"]    Highway To Hell
    Input Text   //input[@placeholder="Description (optional)"]      Jay Shree krishna
    Scroll Element Into View    xpath://span[@id='textBoxbed1Label']/following-sibling::div[1]/input[1]
    Element Should Be Disabled    xpath://span[@id='textBoxbed1Label']/following-sibling::div[1]/input[1]
    Element Should Be Enabled    //input[@placeholder="Description (optional)"]
    Element Should Be Visible    xpath://input[contains(@placeholder,'Name')]  
    Sleep    5

*** Keywords ***
Verify if page is populated successfully
    Set Selenium Implicit Wait    10 sec
    Maximize Browser Window
    Set Selenium Timeout    10sec
    Wait Until Element Is Visible    //h1[text()='Smart.TextBox']
    Sleep    2
    Select Frame    //iframe[@class='demo-frame']