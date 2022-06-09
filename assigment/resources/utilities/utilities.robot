*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***


*** Keywords ***
Get updated xpath
    [Arguments]     ${xpath}=None    ${text}=None    ${dynamic_string}=XXX
    ${xpath}=    replace string    ${xpath}    ${dynamic_string}    ${text}
    [Return]    ${xpath}

Wait until Page loads
    Wait For Condition    return document.readyState=="complete"
