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
    Set Tags    Regression    Smoke    
    Verify if page is populated successfully
    Select Frame    //iframe[@class='demo-frame']
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
    Page Should Contain Element  xpath://p[normalize-space()='Text field is disabled.']/preceding-sibling::div[1]/smart-text-box/div[1]/div/input
    Element Should Be Disabled    xpath://p[normalize-space()='Text field is disabled.']/preceding-sibling::div[1]/smart-text-box/div[1]/div/input
    Element Should Be Enabled    //input[@placeholder="Description (optional)"]
    Element Should Be Visible    xpath://input[contains(@placeholder,'Name')]  
    Sleep    2

TC_02_AutoComplete_Tab_textboxes
    Set Test Documentation    This test will deal with the textbox is Auto Complete Tab
    Set Tags    Regression
    Verify if page is populated successfully
    #-----------Clicking on Auto complete Tab in left plane ------------
    Click Element    xpath://a[text()='Auto Complete']
    Select Frame    //iframe[@class='demo-frame']
    Page Should Contain Element    xpath://input[@class="smart-input"]
    ${default_text}     Get Element Attribute    //input[@class="smart-input"]    value
    ${default_text}    Catenate    Default value in the Textbox is:    ${default_text}
    Log    ${default_text}
    Input Text    xpath://input[@class="smart-input"]    P
    sleep     2
    Scroll Element Into View    xpath://smart-list-item[@label='Portugal']
    Click Element    xpath://smart-list-item[@label='Portugal']
    ${present_text}     Get Element Attribute    //input[@class="smart-input"]    value
    ${present_text}=    Catenate    Default value in the Textbox is:     ${present_text} 
    Log    ${present_text}
    
TC_03_Basic_Tab_textboxes
    Set Test Documentation    This test will deal with the textbox is Basic Tab
    Set Tags    Regression
    Verify if page is populated successfully
    #-----------Clicking on Basic Tab in left plane ------------
    Click Element    xpath://a[text()='Basic']
    Select Frame    //iframe[@class='demo-frame']
    Page Should Contain Element    //input[@aria-label="smart Text Box"]
    ${previous_value}    Get Element Attribute    //input[@aria-label="smart Text Box"]    aria-label
    Log    Default Vaulue is:${previous_value}
    Input Text    css:input[aria-label="smart Text Box"]    Jay${SPACE*2} Shree ${SPACE*2} Krishna
    ${present_value}    Get Element Attribute    //input[@aria-label="smart Text Box"]    value
    Log    Present Vaulue is:${present_value}
    sleep    3
    Clear Element Text    css:input[aria-label="smart Text Box"]
    Sleep    3sec
    Input Text    css:input[aria-label="smart Text Box"]    Radhe Radhe
    ${present_value}    Get Element Attribute    //input[@aria-label="smart Text Box"]    value
    Log    Present Vaulue is:${present_value}
    Sleep    2

TC_04 Data Source Calback Textboxes
    Set Test Documentation    This test deal with the Data Source Callback Textboxes
    Set Tags    Regression
    Verify if page is populated successfully
    #-----------Clicking on Basic Tab in left plane ------------
    Click Link    //a[normalize-space()='Data Source Callback']
    Select Frame    //iframe[@class='demo-frame']
    Page Should Contain Element    //input[@role="textbox"]
    Input Text    //input[@role="textbox"]    C
    Sleep    2
    Element Should Be Visible    //div[text()='No Items']
    Clear Element Text    //input[@role="textbox"] 
    Input Text    //input[@role="textbox"]    Co
    Sleep    1
    Scroll to element in webpage    //span[normalize-space()='Cocos (Keeling) Islands']
    Click Element    //span[normalize-space()='Cocos (Keeling) Islands']
    sleep     2
    ${present_value}    Get Element Attribute    //input[@role="textbox"]    value
    Log    Selected Country is : ${present_value}
    Element Attribute Value Should Be    //input[@role="textbox"]    value    Cocos (Keeling) Islands

*** Keywords ***
Verify if page is populated successfully
    Set Selenium Implicit Wait    10sec
    Maximize Browser Window
    Set Selenium Timeout    10sec
    Wait Until Element Is Visible    //h1[text()='Smart.TextBox']
    Sleep    2

Scroll to element in webpage
    [Arguments]    ${ElementLocator}
    Wait Until Element Is Visible    ${ElementLocator}
    ${x}    Get Horizontal Position    ${ElementLocator}
    ${y}    Get Vertical Position    ${ElementLocator}
    Execute Javascript    window.scrollTo(${x},${y})
    Sleep    3