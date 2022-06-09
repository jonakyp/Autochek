*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${AUTOCHECK_LOGO}    //img[@src='https://media.autochek.africa/file/publicAssets/full-color-logo-new.png']
${HP_REGISTER_LINK}    Register


*** Keywords ***
Verify presence autocheck logo homepage
    page should contain image    ${AUTOCHECK_LOGO}    timeout=60

clicks on register link
    click link    ${HP_REGISTER_LINK}


