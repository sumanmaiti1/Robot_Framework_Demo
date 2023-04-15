*** Settings ***
Documentation     *This line is in BOLD font*    # Below line is a blank line
...
...               _This line is in *italic* font_
...               This line contains a link. i.e. _*https://google.co.in*_
Suite Setup       Log To console    "This is Test Suite Setup"
Suite Teardown    Log To Console    This is Suite Teardown    # Comment for suite Teardown
Test Setup        Log to console    This is Test Setup
Test Teardown     Log to console    This is Test Teardown    #Comment for test Teardown
Default Tags      'Variables'    "Scalar    Variables"
Test Timeout      2min 10 secs

*** Variables ***
#--------------these are scalar variables----------------
${var1}           'Suman'    #----Contains String
${var2}           'Maiti'    #----Contains String
${var3}           10    #----Contains integer
${var3}           20    #----Contains integer
${var5}           True    #----Contains boolean
${var6}           False    #----Contains boolean
${var7}           3+4j    # Contains complex
${var8}           3-4j    # Contains complex
${var9}           [1,2,3,"Suman"]    # Contains List
${var10}          (1,2,3,"Suman")    # Contains Tuple
${var11}          {'Name':'Suman'}    # Contains Dictionary

#--------------these are List variables----------------
@{student_name}    Suman    Sumana    Rita    Satadal    Anjana
@{student_marks}=  10   20  30  40  50

#--------------these are Dictionary variables----------------
&{student_details}    name=Suman    id=01    hobby=Listening ${SPACE}Songs
&{student_details1}    name=Suman    id=01    hobby=Listening ${SPACE}Songs

*** Test Cases ***
TC_01_Printing the Type of Scalar variables
    ${typevar1}    Evaluate    type(${var1})
    ${typevar1}    Catenate    Type of Var1 is :    ${typevar1}    and value of Var1 is :    ${var1}
    Log To Console    ${typevar1}
    ${typevar2}    Evaluate    type(${var2}).__name__
    ${typevar2}    Catenate    Type of Var2 is :    ${typevar2}    and value of Var2 is :    ${var2}
    Log To Console    ${typevar2}
    ${typevar3}    Evaluate    type(${var3})
    ${typevar3}    Catenate    Type of Var3 is :    ${typevar3}    and value of Var3 is :    ${var3}
    Log To Console    ${typevar3}
    ${var3}    Set Variable    100
    Log To Console    Now the value of var3 : ${var3}
    ${typevar5}    Evaluate    type(${var5})
    ${typevar5}    Catenate    Type of var5 is :    ${typevar5}    and value of var5 is :    ${var5}
    Log To Console    ${typevar5}
    ${typevar6}    Evaluate    type(${var6})
    ${typevar6}    Catenate    Type of var6 is :    ${typevar6}    and value of var6 is :    ${var6}
    Log To Console    ${typevar6}
    ${typevar7}    Evaluate    type(${var7})
    ${typevar7}    Catenate    Type of var7 is :    ${typevar7}    and value of var7 is :    ${var7}
    Log To Console    ${typevar7}
    ${typevar8}    Evaluate    type(${var8})
    ${typevar8}    Catenate    Type of var8 is :    ${typevar8}    and value of var8 is :    ${var8}
    Log To Console    ${typevar8}
    ${typevar9}    Evaluate    type(${var9})
    ${typevar9}    Catenate    Type of var9 is :    ${typevar9}    and value of var9 is :    ${var9}
    Log To Console    ${typevar9}
    ${typevar10}    Evaluate    type(${var10})
    ${typevar10}    Catenate    Type of var10 is :    ${typevar10}    and value of var10 is :    ${var10}
    Log To Console    ${typevar10}.First item of the Tuple is : ${var10}(0)
    ${typevar11}    Evaluate    type(${var11})
    ${typevar11}    Catenate    Type of var11 is :    ${typevar11}    and value of var9 is :    ${var11}
    Log To Console    ${typevar11}

TC_02_Printing the Type of List variables
    Log To Console    ${student_name}[0] 
    Log To Console    ${student_marks}[0]

TC_03_Printing the Type of Dictionary variables
    Log To Console    ${student_details}[name]
    Log To Console    ${student_details.id}
    Log    ${student_details}[hobby]