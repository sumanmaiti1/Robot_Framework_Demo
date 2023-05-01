*** Settings ***
Documentation    This test suite will deal with the Accordians
...     This is another line added in Documentation
...    
Library    SeleniumLibrary
Library    Collections
Library    String
Library    Dialogs

Test Setup    Test_Setup
Test Teardown    Close All Browsers
Test Tags    Accordion
Test Timeout    2 min

*** Variables ***
${url}    https://www.htmlelements.com/demos/
${browser}    chrome

*** Test Cases ***
TC_01_Accordion_Basic
    Set Test Documentation    This Test case deals with the Accordions present in Basic Tab
    Set Tags    Regression    Smoke    Accordion
    Verify if page is populated
    Click on diferent tabs for Accordion    Basic
    Page Should Contain Element    //smart-accordion-item[@label="First Item"]
    Element Should Be Visible    //div[text()='First Item Content.']
    Element Should Not Be Visible    //div[text()='Second Item Content.']
    Page Should Contain Element    //smart-accordion-item[@label="Second Item"]
    Page Should Contain Element    //smart-accordion-item[@label="Third Item"]
    Page Should Contain Element    //smart-accordion-item[@label="Fourth Item"]
    Click Element    //smart-accordion-item[@label="Fourth Item"]
    sleep    2
    Element Should Be Visible    //div[text()='Fourth Item Content.']
    Element Should Not Be Visible    //div[text()='First Item Content.']
    Sleep    2

TC_02_Accordion_Events
    Set Test Documentation    This Test case deals with the Accordions present in Events Tab
    Set Tags    Regression    Accordion
    Verify if page is populated
    Click on diferent tabs for Accordion    Events
    Page Should Contain Element    //smart-accordion-item[@label="Item 0"]
    Page Should Contain Element    //smart-accordion-item[@label="Item 1"]
    Page Should Contain Element    //smart-accordion-item[@label="Item 2"]
    Page Should Contain Element    //smart-accordion-item[@label="Item 3"]
    Page Should Contain Element    //smart-accordion-item[@label="Item 4"]
    Page Should Contain Element    //smart-accordion-item[@label="Item 5"]
    Element Should Be Visible    //smart-accordion-item[@label="Item 0"]//div[@smart-id="contentContainer" and normalize-space()='Content']
    Element Should Not Be Visible    //smart-accordion-item[@label="Item 1"]//div[@smart-id="contentContainer" and normalize-space()='Content']
    Element Should Not Be Visible    //smart-accordion-item[@label="Item 2"]//div[@smart-id="contentContainer" and normalize-space()='Content']
    Element Should Not Be Visible    //smart-accordion-item[@label="Item 3"]//div[@smart-id="contentContainer" and normalize-space()='Content']
    Element Should Not Be Visible    //smart-accordion-item[@label="Item 4"]//div[@smart-id="contentContainer" and normalize-space()='Content']
    Element Should Not Be Visible    //smart-accordion-item[@label="Item 5"]//div[@smart-id="contentContainer" and normalize-space()='Content']
    Verify Event Texts    event_log=No Log
    Click Element    //smart-accordion-item[@label="Item 3"]
    sleep    2
    Verify Event Texts    event_log=collapsing item #0>expanding item #2
    Element Should Be Visible    //smart-accordion-item[@label="Item 3"]//div[@smart-id="contentContainer" and normalize-space()='Content']
    Element Should Not Be Visible    //smart-accordion-item[@label="Item 0"]//div[@smart-id="contentContainer" and normalize-space()='Content']
    Element Should Not Be Visible    //smart-accordion-item[@label="Item 1"]//div[@smart-id="contentContainer" and normalize-space()='Content']
    Element Should Not Be Visible    //smart-accordion-item[@label="Item 2"]//div[@smart-id="contentContainer" and normalize-space()='Content']
    Element Should Not Be Visible    //smart-accordion-item[@label="Item 4"]//div[@smart-id="contentContainer" and normalize-space()='Content']
    Element Should Not Be Visible    //smart-accordion-item[@label="Item 5"]//div[@smart-id="contentContainer" and normalize-space()='Content']
    Sleep    2

TC_03_Accordion_Methods
    Set Test Documentation    This Test case deals with the Accordions present in Methods Tab
    Set Tags    Regression    Accordion
    Verify if page is populated
    Click on diferent tabs for Accordion    Methods
    Page Should Contain Element    //smart-accordion-item[@label="Item 0"]
    Page Should Contain Element    //smart-accordion-item[@label="Item 1"]
    Page Should Contain Element    //smart-accordion-item[@label="Item 1"]

    Page Should Contain Element    //button[text()='Collapse #']
    Page Should Contain Element    //button[text()='Expand #']
    Page Should Contain Element    //input[@id="expandCollapseIndex"]
    Page Should Contain Element    //button[text()='Insert #']
    Page Should Contain Element    //button[text()='Update #']
    Page Should Contain Element    //button[text()='Remove #']
    Page Should Contain Element    //input[@id="crudIndex"]

    Click Element    //smart-accordion-item[@label="Item 0"]
    Sleep    1
    Element Should Be Visible    //div[text()="Content 0"]
    Element Should Not Be Visible    //div[text()="Content 1"]
    Element Should Not Be Visible    //div[text()="Content 2"]

    Click Element    //smart-accordion-item[@label="Item 2"]
    Sleep    1
    Element Should Be Visible    //div[text()="Content 2"]
    Element Should Not Be Visible    //div[text()="Content 0"]
    Element Should Not Be Visible    //div[text()="Content 1"]

    Input Text    //input[@id="expandCollapseIndex"]    1
    Click Button    //button[text()='Expand #']
    Sleep    1
    Element Should Be Visible    //div[text()="Content 1"]
    Element Should Not Be Visible    //div[text()="Content 0"]
    Element Should Not Be Visible    //div[text()="Content 2"]

    Click Button    //button[text()='Collapse #']
    Sleep    1
    Element Should Not Be Visible    //div[text()="Content 0"]
    Element Should Not Be Visible    //div[text()="Content 1"]
    Element Should Not Be Visible    //div[text()="Content 2"]

    Input Text    //input[@id="crudIndex"]    2
    Click Button    //button[text()='Insert #']
    Sleep    1
    Page Should Contain Element    //smart-accordion-item[@label="Item 0"]
    Page Should Contain Element    //smart-accordion-item[@label="Item 1"]
    Page Should Contain Element    //smart-accordion-item[@label="New label"]
    Page Should Contain Element    //smart-accordion-item[@label="Item 1"]

    Input Text    //input[@id="expandCollapseIndex"]    2
    Click Button    //button[text()='Expand #']
    Sleep    1
    Element Should Be Visible    //div[contains(text(),'New content')]
    Element Should Not Be Visible    //div[text()="Content 0"]
    Element Should Not Be Visible    //div[text()="Content 1"]
    Element Should Not Be Visible    //div[text()="Content 2"]

    Click Button    //button[text()='Collapse #']
    Sleep    1
    Element Should Not Be Visible    //div[contains(text(),'New content')]
    Element Should Not Be Visible    //div[text()="Content 0"]
    Element Should Not Be Visible    //div[text()="Content 1"]
    Element Should Not Be Visible    //div[text()="Content 2"]
    
    Clear Element Text    //input[@id="crudIndex"]
    Sleep    1
    Input Text    //input[@id="crudIndex"]    2
    Click Button    //button[text()='Update #']
    Sleep    1
    Page Should Contain Element    //smart-accordion-item[@label="Item 0"]
    Page Should Contain Element    //smart-accordion-item[@label="Item 1"]
    Page Should Contain Element    //smart-accordion-item[@label="Updated Label"]
    Page Should Contain Element    //smart-accordion-item[@label="Item 1"] 

    Click Button    //button[text()='Expand #']
    Sleep    2
    Element Should Be Visible    //div[contains(text(),'Updated Content') and @smart-id="contentContainer"]
    Element Should Not Be Visible    //div[text()="Content 0"]
    Element Should Not Be Visible    //div[text()="Content 1"]
    Element Should Not Be Visible    //div[text()="Content 2"]

    Click Button    //button[text()='Remove #']
    Sleep    1

    Page Should Not Contain Element    //smart-accordion-item[@label="Updated Label"]
    Page Should Not Contain Element    //smart-accordion-item[@label="Item 1"]
    Page Should Not Contain Element    //smart-accordion-item[@label="Item 1"]
    Page Should Not Contain Element    //smart-accordion-item[@label="Item 2"]

TC_04_Accordion_Expand_Modes
    Set Test Documentation    This Test case deals with the Accordions present in Expand Modes Tab
    Set Tags    Regression    Accordion
    Verify if page is populated
    Click on diferent tabs for Accordion    Expand Modes
    Click Element    //span[@id='expandModeActionButton']
    Sleep    .5
    Click Element    //smart-list-item[@value="multiple"]

    Page Should Contain Element    //smart-accordion-item[@label="Item 0"]
    Page Should Contain Element    //smart-accordion-item[@label="Item 1"]
    Page Should Contain Element    //smart-accordion-item[@label="Item 2"]
    Page Should Contain Element    //smart-accordion-item[@label="Item 3"]
    Page Should Contain Element    //smart-accordion-item[@label="Item 4"]
    Element Should Be Visible    //smart-accordion-item[@label="Item 0"]//div[contains(text(),'Content')]
    Element Should Not Be Visible    //smart-accordion-item[@label="Item 1"]//div[contains(text(),'Content')]
    Element Should Not Be Visible    //smart-accordion-item[@label="Item 2"]//div[contains(text(),'Content')]
    Element Should Not Be Visible    //smart-accordion-item[@label="Item 3"]//div[contains(text(),'Content')]
    Element Should Not Be Visible    //smart-accordion-item[@label="Item 4"]//div[contains(text(),'Content')]

    Click Element    //smart-accordion-item[@label="Item 0"]
    Sleep    2
    Element Should Not Be Visible    //smart-accordion-item[@label="Item 0"]//div[contains(text(),'Content')]
    Click Element    //smart-accordion-item[@label="Item 0"]
    Sleep    1
    Click Element    //smart-accordion-item[@label="Item 1"]
    Sleep    1
    Click Element    //smart-accordion-item[@label="Item 2"]
    Sleep    1
    Click Element    //smart-accordion-item[@label="Item 3"]
    Sleep    1
    Click Element    //smart-accordion-item[@label="Item 4"] 
    sleep    1
    
    Element Should Be Visible    //smart-accordion-item[@label="Item 0"]//div[contains(text(),'Content')]
    Element Should Be Visible    //smart-accordion-item[@label="Item 1"]//div[contains(text(),'Content')]
    Element Should Be Visible    //smart-accordion-item[@label="Item 2"]//div[contains(text(),'Content')]
    Element Should Be Visible    //smart-accordion-item[@label="Item 3"]//div[contains(text(),'Content')]
    Element Should Be Visible    //smart-accordion-item[@label="Item 4"]//div[contains(text(),'Content')]

TC_05_Accordion_In_Tabs
    Set Test Documentation    This Test case deals with the Accordions present in In Tab Tab
    Set Tags    Regression    Accordion
    Verify if page is populated
    Click on diferent tabs for Accordion    In Tabs
    Page Should Contain Element    //div[@aria-label="Accordion 1"]
    Page Should Contain Element    //div[@aria-label="Accordion 2"]
    Page Should Contain Element    //div[@aria-label="Accordion 3"]
    
    Page Should Contain Element    //smart-Tab-item[@label="Accordion 1"]//smart-accordion-item[@label="Item 0"]
    Page Should Contain Element    //smart-Tab-item[@label="Accordion 1"]//smart-accordion-item[@label="Item 1"]    
    Page Should Contain Element    //smart-Tab-item[@label="Accordion 1"]//smart-accordion-item[@label="Item 3"]
    
    Element Should Be Visible    //smart-Tab-item[@label="Accordion 1"]//smart-accordion-item[@label="Item 0"]//div[text()="Content"]
    Element Should Not Be Visible    //smart-Tab-item[@label="Accordion 1"]//smart-accordion-item[@label="Item 1"]//div[text()="Content"]
    Element Should Not Be Visible    //smart-Tab-item[@label="Accordion 1"]//smart-accordion-item[@label="Item 3"]//div[text()="Content"]
    
    Click Element    //div[@aria-label="Accordion 3"]
    sleep    2
    Click Element    //smart-Tab-item[@label="Accordion 3"]//smart-accordion-item[@label="Item 3"]
    sleep    1
    Element Should Be Visible    //smart-Tab-item[@label="Accordion 3"]//smart-accordion-item[@label="Item 3"]//div[text()="Content"]
    Element Should Not Be Visible    //smart-Tab-item[@label="Accordion 3"]//smart-accordion-item[@label="Item 1"]//div[text()="Content"]
    Element Should Not Be Visible    //smart-Tab-item[@label="Accordion 3"]//smart-accordion-item[@label="Item 0"]//div[text()="Content"]
    
    Click Element    //div[@aria-label="Accordion 2"]
    sleep    2
    Click Element    //smart-Tab-item[@label="Accordion 2"]//smart-accordion-item[@label="Item 1"]
    sleep    1
    Element Should Be Visible    //smart-Tab-item[@label="Accordion 2"]//smart-accordion-item[@label="Item 1"]//div[contains(text(),"Content")]
    Element Should Not Be Visible    //smart-Tab-item[@label="Accordion 2"]//smart-accordion-item[@label="Item 3"]//div[contains(text(),"Content")]
    Element Should Not Be Visible    //smart-Tab-item[@label="Accordion 2"]//smart-accordion-item[@label="Item 0"]//div[contains(text(),"Content")]

TC_06__Accordion_With_Tabs
    Set Test Documentation    This Test case deals with the Accordions present in With Tab Tab
    Set Tags    Regression    Accordion
    Verify if page is populated
    Click on diferent tabs for Accordion    With Tabs
    
    Page Should Contain Element    //smart-accordion-item[@label="Tabs 1"]
    Page Should Contain Element    //smart-accordion-item[@label="Tabs 2"]
    Page Should Contain Element    //smart-accordion-item[@label="Tabs 3"]
    Page Should Contain Element    //smart-accordion-item[@label="Tabs 4"]
    
    Element Should Be Visible    //smart-accordion-item[@label="Tabs 1"]//smart-tab-item[@label="TAB 2"]//div[text()='Content 2']
    Click Element    //smart-accordion-item[@label="Tabs 1"]//div[@aria-label="TAB 1"]
    sleep    1
    Element Should Be Visible    //smart-accordion-item[@label="Tabs 1"]//smart-tab-item[@label="TAB 1"]//div[text()='Content 1']
    Element Should Not Be Visible    //smart-accordion-item[@label="Tabs 1"]//smart-tab-item[@label="TAB 2"]//div[text()='Content 2']

    Click Element    //smart-accordion-item[@label="Tabs 2"]
    sleep    2
    Element Should Be Visible    //smart-accordion-item[@label="Tabs 2"]//smart-tab-item[@label="TAB 2"]//div[text()='Content 2']
    Element Should Not Be Visible    //smart-accordion-item[@label="Tabs 1"]//smart-tab-item[@label="TAB 1"]//div[text()='Content 1']

    Click Element    //smart-accordion-item[@label="Tabs 3"]
    Sleep    2
    Element Should Be Visible    //smart-accordion-item[@label="Tabs 3"]//smart-tab-item[@label="TAB 2"]//div[text()='Content 2']
    Element Should Not Be Visible    //smart-accordion-item[@label="Tabs 2"]//smart-tab-item[@label="TAB 2"]//div[text()='Content 2']
    Page Should Contain Element    //smart-accordion-item[@label="Tabs 3"]//div[@aria-label="TAB 1"]
    Page Should Contain Element    //smart-accordion-item[@label="Tabs 3"]//div[@aria-label="TAB 2"]
    Page Should Contain Element    //smart-accordion-item[@label="Tabs 3"]//div[@aria-label="TAB 3"]

    Click Element    //smart-accordion-item[@label="Tabs 3"]//div[@aria-label="TAB 3"]
    Sleep    2
    Element Should Be Visible    //smart-accordion-item[@label="Tabs 3"]//smart-tab-item[@label="TAB 3"]//div[text()='Content 3']
    Element Should Not Be Visible    //smart-accordion-item[@label="Tabs 3"]//smart-tab-item[@label="TAB 3"]//div[text()='Content 2']

    Click Element    //smart-accordion-item[@label="Tabs 4"]
    Sleep    2
    Element Should Be Visible    //smart-accordion-item[@label="Tabs 4"]//smart-tab-item[@label="TAB 2"]//div[text()='Content 2']
    Element Should Not Be Visible    //smart-accordion-item[@label="Tabs 3"]//smart-tab-item[@label="TAB 3"]//div[text()='Content 3']
    Page Should Contain Element    //smart-accordion-item[@label="Tabs 4"]//div[@aria-label="TAB 1"]
    Page Should Contain Element    //smart-accordion-item[@label="Tabs 4"]//div[@aria-label="TAB 2"]
    Page Should Contain Element    //smart-accordion-item[@label="Tabs 4"]//div[@aria-label="TAB 3"]
    Page Should Contain Element    //smart-accordion-item[@label="Tabs 4"]//div[@aria-label="TAB 4"]

    Click Element    //smart-accordion-item[@label="Tabs 4"]//div[@aria-label="TAB 4"]
    Sleep    2
    Element Should Be Visible    //smart-accordion-item[@label="Tabs 4"]//smart-tab-item[@label="TAB 4"]//div[text()='Content 4']
    Element Should Not Be Visible    //smart-accordion-item[@label="Tabs 4"]//smart-tab-item[@label="TAB 4"]//div[text()='Content 2']

    Click Element    //smart-accordion-item[@label="Tabs 2"]
    sleep    2
    Element Should Be Visible    //smart-accordion-item[@label="Tabs 2"]//smart-tab-item[@label="TAB 2"]//div[text()='Content 2']
    Element Should Not Be Visible    //smart-accordion-item[@label="Tabs 4"]//smart-tab-item[@label="TAB 4"]//div[text()='Content 4']
TC_07_Accordion_Reorder_Tabs
    Set Test Documentation    This Test case deals with the Accordions present in Reorder Tab
    Set Tags    Regression    Accordion
    Verify if page is populated
    Click on diferent tabs for Accordion    Reorder
    Drag And Drop By Offset    //smart-accordion-item[@label="Second Item"]    0    -100
    Drag And Drop By Offset    //smart-accordion-item[@label="Fourth Item"]    0    -300
    Drag And Drop By Offset     //smart-accordion-item[@label="First Item"]    0    100
    
*** Keywords ***
Test_Setup
    Open Browser    ${url}    ${browser}
    Set Selenium Implicit Wait    10sec
    Set Selenium Timeout    10 sec
    Wait Until Element Is Visible    //span[@title='Showcase Demos']
    Maximize Browser Window
    Click Element    //span[@title='HTML Accordion UI Element']
    Page Should Contain Element    //span[@title='HTML Accordion']
    
Verify if page is populated
    Set Selenium Timeout    10sec
    Wait Until Element Is Visible   //span[@title="HTML Accordion"]
Click on diferent tabs for Accordion
    [Arguments]    ${TabName}
    Page Should Contain Element    //a[text()='${TabName}']
    Click Element    //a[text()='${TabName}']
    sleep   2
    Page Should Contain Element    //h1[text()='Smart.Accordion']
    Select Frame    //iframe[@class='demo-frame']

Verify Event Texts
    [Arguments]    ${event_log}=No Log
    ${msglist}    Split String    ${event_log}    >
    Log    ${msglist}
    
    IF  '${event_log}'=='No Log'
        ${itemcount}    Get Element Count    //div[@id='log']/div
        ${itemcount}    Convert To Integer    ${itemcount}
        Should Be Equal As Integers    ${itemcount}    0
    ELSE
        FOR    ${element}    IN    @{msglist}
            ${locator}=   Catenate    SEPARATOR=    //div[text()='    ${element}   '] 
            Element Should Be Visible    ${locator}
        END        
    END

