*** Settings ***
Library    SeleniumLibrary
Resource    ../../utilities/utilities.robot

*** Variables ***
${CREATE_ACC_XPATH}    //h1[contains(text(),'Create Account')]
${REG_FIRST_NAME_XPATH}    //input[@type='firstname']
${REG_LAST_NAME_XPATH}    //input[@type='lastname']
${REG_EMAIL_XPATH}    //input[@type='email']
${REG_TEL_XPATH}    //input[contains(@type,'tel')]
${REG_PASSWORD_XPATH}     //input[@type='password']
${REG_REF_CODE_XPATH}     //input[@name='referrer_code']
${REG_BUTTON}     //button[@type='submit']
${RETURN_HOMEPAGE_BTN}    //div[@class='sign-up'][contains(.,'Return to home page')]
${SUCCESS_TEXT_XPATH}    //span[contains(text(),'XXX')]


*** Keywords ***
Verify presence create account text
    element text should be    ${CREATE_ACC_XPATH}    Create Account

User enters the first name
    [Arguments]    ${first_name}
    input text    ${REG_FIRST_NAME_XPATH}    ${first_name}

User enters the last name
    [Arguments]    ${last_name}
    input text    ${REG_LAST_NAME_XPATH}    ${last_name}

User enters an email address
    [Arguments]    ${random_email}
    input text    ${REG_EMAIL_XPATH}     ${random_email}

User enters phone number
    [Arguments]  ${phone_number}
    input text    ${REG_TEL_XPATH}    ${phone_number}

User enters password
    [Arguments]  ${password}
    input password  ${REG_PASSWORD_XPATH}    ${password}

User enters Referral Code
    [Arguments]  ${referral_code}
    input text    ${REG_REF_CODE_XPATH}    ${referral_code}

User clicks register button
    click button    ${REG_BUTTON}
    wait until page contains element    ${RETURN_HOMEPAGE_BTN}    timeout=60


Verify succes page and email registered is present
    [Arguments]   ${email_sv}
    ${SUCCESS_TEXT_XPATH}=  Get updated xpath   xpath=${SUCCESS_TEXT_XPATH}  text=${email_sv}
    log to console   ${SUCCESS_TEXT_XPATH}
    wait until element is visible    ${SUCCESS_TEXT_XPATH}