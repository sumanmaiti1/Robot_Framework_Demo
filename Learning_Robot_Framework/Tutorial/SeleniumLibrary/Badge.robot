*** Settings ***
Documentation    This test suite wil deal with the Badge elements
...    This is another line in Suite Documentation

Library    SeleniumLibrary
Suite Setup     Setup
Suite Teardown    Close All Browsers
Test Timeout    2 Min

*** Variables ***
${url}    https://www.htmlelements.com/demos/
${browser}    chrome

*** Test Cases ***
TC_01
    Set Test Documentation    This test wil deal with the overview Tab of Badges
    Set Tags    Regression    Badge
    Click on diferent tabs for Badge    Overview
    #----- To verify now many elements named NEW is present on the screen ----------
    ${element_count}    Get Element Count    //span[text()='New']
    Log    Total ${element_count} elements present with the name NEW
    #------------- Getting the background Colour of Element Danger --------------
    
    ${danger_list}    Get WebElements    //span[text()='Danger']
    Log    ${danger_list}
    
    ${danger}    Get WebElement    //span[@class="smart-badge smart-badge-danger smart-badge-pill"]
    ${bg_color}    Call Method    ${danger}    value_of_css_property    background-color
    Log    ${bg_color}

    ${color}    Execute Javascript    return document.defaultView.getComputedStyle(document.getElementsByClassName("smart-badge smart-badge-danger smart-badge-pill")[0],null)['background-color']
    Log    ${Color}
    
    FOR    ${element}    IN    @{danger_list}
        ${background_color}=    Call Method    ${element}     value_of_css_property    background-color
        Log    ${background_color} 
        IF    '${background_color}' == 'rgba(176, 0, 32, 1)'
            Log    Background colour is : Dark Red Colour             
        END
    END


*** Keywords *** 
Setup
    Open Browser    ${url}    ${browser}
    Set Selenium Implicit Wait    10sec
    Set Selenium Timeout    10 sec
    Wait Until Element Is Visible    //span[@title='HTML Badge UI Element']
    Maximize Browser Window
    Click Element    //span[@title='HTML Badge UI Element']
    Page Should Contain Element    //span[@title='HTML Badge']
Click on diferent tabs for Badge
    [Arguments]    ${TabName}
    Page Should Contain Element    //a[text()='${TabName}']
    Click Element    //a[text()='${TabName}']
    sleep   2
    Page Should Contain Element    //h1[text()='Smart.Badge']
    Select Frame    //iframe[@class='demo-frame']