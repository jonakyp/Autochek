*** Settings ***

Resource    ../../utilities/utilities.robot
Resource    ../../pages/homepage/autocheck_homepage_page.robot
Resource    ../../pages/register/autocheck_register_page.robot

*** Variables ***
${HP_EXPECTED_TITLE}  Autochek: Buy & Sell Cars in Nigeria | Find New & Old Cars
${REG_EXPECTED_TITLE}    Register | AutoChek

*** Keywords ***
User is on the homepage
    Wait until Page loads
    Verify presence autocheck logo homepage
    ${title}=    get title
    should be equal as strings      ${title}    ${HP_EXPECTED_TITLE}

User clicks on the Register Link
    clicks on register link
    Wait until Page loads
    Verify presence create account text
    ${title}=    get title
    should be equal as strings      ${title}    ${REG_EXPECTED_TITLE}