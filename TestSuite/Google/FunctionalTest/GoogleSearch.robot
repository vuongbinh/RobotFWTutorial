*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary


*** Variables ***
${LOGIN_URL}  https://the-internet.herokuapp.com/login
${BROWSER}  firefox

*** Test Cases ***
Valid Login
    [Documentation]     Google Test
    [Tags]  regression
    Open Browser  ${LOGIN_URL}  chrome
    Close Browser

        
*** Keywords ***
Open Browser To Login Page
    Open Browser ${LOGIN_URL}   ${BROWSER}
    Title Should Be    The Internet

Input Username
    [Arguments] ${username}
    Input Text    username    tomsmith
    
Input Password
    [Arguments] ${password}
    Input Text    password    SuperSecretPassword!
    
Submit Credentials
    Click Button    submit

Welcome Page should be open
    Title Should Be    The Internet
