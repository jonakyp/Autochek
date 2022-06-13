#Data Driven Style

*** Settings ***
Documentation  This is a POC for Autocheck
Library  SeleniumLibrary
Resource    ../../resources/actions/browser/browser_actions.robot
Resource    ../../resources/actions/homepage/homepage_actions.robot

Test Setup    User launches the browser
Test Teardown    User closes the browser

*** Variables ***
&{country}  Nigeria=Nigeria     Ghana=Ghana     Kenya=Kenya     Cotedvoire=Ivoire   Uganda=Uganda

*** Test Cases ***
AC-02 Web: User selects different countries or regions from homepage
    [Tags]    @smoke    @AC-02
    [Template]    User selecting different countries
    ${country.Nigeria}
    ${country.Ghana}
    ${country.Kenya}
    ${country.Uganda}
    ${country.Cotedvoire}

*** Keywords ***
