#Behaviour-driven style

*** Settings ***
Documentation  This is a POC for Autocheck
Library  SeleniumLibrary
Resource    ../../resources/actions/browser/browser_actions.robot
Resource    ../../resources/actions/homepage/homepage_actions.robot
Resource    ../../resources/actions/register/register_actions.robot


*** Variables ***
${email_sv}
${password_sv}

*** Test Cases ***
AC-01 Web: Creating an account using the sign up form
    #Set Variables
    ${first_name}   generate random string
    ${last_name}    generate random string
    ${random_email}    RANGEN.random email
    ${phone_number}   RANGEN.random ng phone digits
    ${password}   generate random string
    ${referral_code}   generate random string
    set global variable   ${email_sv}     ${random_email}
    set global variable    ${password_sv}    ${password}

    [Documentation]    This will test succesfull user registration
    [Tags]    @smoke    @AC-01
    [Setup]    User launches the browser
    Given User is on the homepage
    And User clicks on the Register Link
    And User inserts random First Name and Last Name    ${first_name}    ${last_name}
    And User inserts a valid Email Address    ${random_email}
    And User inserts a valid Phone number    ${phone_number}
    And User inserts a valid Password    ${password}
    And User inserts a valid Referral Code    ${referral_code}
    When User clicks on the Register button
    Then User should be registered succesfully    ${email_sv}
    sleep    5
    [Teardown]    User closes the browser

*** Keywords ***
