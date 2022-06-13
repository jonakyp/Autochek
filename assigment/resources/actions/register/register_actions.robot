
*** Settings ***
Library    SeleniumLibrary
Library    ../../../lib/RandomGen.py    WITH NAME    RANGEN
Resource    ../../pages/register/autochek_register_page.robot


*** Variables ***
${REG_SUCCESS_TITLE}   K TITLE

*** Keywords ***
User inserts random First Name and Last Name
    [Arguments]    ${first_name}   ${last_name}
    User enters the first name    ${first_name}
    User enters the last name    ${last_name}

User inserts a valid Email Address
    [Arguments]  ${random_email}
    User enters an email address    ${random_email}

User inserts a valid Phone number
    [Arguments]  ${phone_number}
    User enters phone number    ${phone_number}

User inserts a valid Password
    [Arguments]  ${password}
    User enters password    ${password}


User inserts a valid Referral Code
    [Arguments]  ${referral_code}
    User enters Referral Code    ${referral_code}

User clicks on the Register button
    User clicks register button

User should be registered succesfully
    [Arguments]   ${email_sv}
    Verify succes page and email registered is present    ${email_sv}





