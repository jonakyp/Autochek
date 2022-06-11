*** Settings ***
Library  SeleniumLibrary
Library   ../../../lib/PreConfig.py   WITH NAME    CONF
Library   ../../../lib/DriverManager.py   WITH NAME    DriverManager
Variables    ../../../../assigment/variables/config.py

*** Variables ***

${chrome_node_version}    102.0.5005.61

*** Keywords ***
User launches the browser
    set selenium speed    0.2
    ${URL}=    CONF.Get Environment URL
    ${browser}=    CONF.get random browser
    Log To Console    ${browser}
    ${path}=    DriverManager.Get Chrome driver Path
    IF    '${USE_GRID}'=='True'
        Launch browsers on grid    ${browser}    ${URL}
    ELSE
        Launch browsers via manager    ${browser}    ${URL}
    END
    maximize browser window


Launch browsers on grid
    [Arguments]    ${browser}    ${url}
    ${path}=    Get Chrome driver Path    ${chrome_node_version}
    Open Browser    ${url}    browser=chrome    remote_url=${SELENIUM_GRID}    executable_path=${path}


Launch browsers via manager
    [Arguments]    ${browser}    ${url}
    IF    '${browser}'=='chrome'
        ${path}=    DriverManager.Get Chrome driver Path
        Open Browser    ${url}    browser=${browser}    executable_path=${path}    options=add_argument("--no-sandbox"); add_argument("--disable-dev-shm-usage"); add_argument("--headless")
    ELSE IF    '${browser}'=='firefox'
        ${profile_path}=    DriverManager.Create firefox profile
        ${path}=    DriverManager.Get firefox driver path
        Open Browser    ${url}    browser=${browser}    executable_path=${path}    ff_profile_dir=${profile_path}
    ELSE IF    '${browser}'=='edge'
        ${path}=    DriverManager.Get edge driver path
        Open Browser    ${url}    browser=${browser}    executable_path=${path}
    END
    Log To Console    ${url}

User closes the browser
    CLOSE BROWSER
