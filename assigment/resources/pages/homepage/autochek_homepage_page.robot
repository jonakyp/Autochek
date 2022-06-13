*** Settings ***
Library    SeleniumLibrary
Resource    ../../utilities/utilities.robot

*** Variables ***
${AUTOCHECK_LOGO}    //img[@src='https://media.autochek.africa/file/publicAssets/full-color-logo-new.png']
${HP_REGISTER_LINK}    Register
${COUNTRY_DROPDOWN_BTN}    //div[contains(@class,'topbar-location')]
${SELECT_COUNTRY}    //li[contains(.,'XXX')]
${HP_COUNTRTY_TITLE}    //h1[contains(@class,'title')]
${CONTINUE_BTN}    //button[contains(.,'Continue')]


*** Keywords ***
Verify presence autocheck logo homepage
    page should contain image    ${AUTOCHECK_LOGO}    timeout=60

clicks on register link
    click link    ${HP_REGISTER_LINK}

Clicks on the country dropdown
    mouse over    ${COUNTRY_DROPDOWN_BTN}
    click element    ${COUNTRY_DROPDOWN_BTN}

Click on country of choice
    [Arguments]    ${country}
    ${SELECT_COUNTRY}=  Get updated xpath   xpath=${SELECT_COUNTRY}  text=${country}
    mouse down    ${SELECT_COUNTRY}
    click element    ${SELECT_COUNTRY}

click continue button if present
    ${present}=    Run Keyword And Return Status    ELEMENT SHOULD BE VISIBLE    ${continue_btn}
    RUN KEYWORD IF    ${present}    click continue button

click continue button
    click element    ${CONTINUE_BTN}

