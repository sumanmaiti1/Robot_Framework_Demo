*** Settings ***
Documentation     This Test Suite is creted for learing Robot framework
...               *This comment is BOLD*
...               _This comment is in ITALIC_
...               This is link https://www.google.com/
*** Variables ***
${var1}           10    # This is my first scalar variable
${var2}           10    # This is my second scalar variable
*** Test Cases ***
TC_001 Checking if two variables are having same value
    [Tags]    Smoke Test    Regression Test
    Should Be Equal As Integers    ${var1}    ${var2}    Test Message1
    Should NOT Be Equal As Integers    ${var1}    ${var2}    Test Message2
