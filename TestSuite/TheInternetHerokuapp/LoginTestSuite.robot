*** Settings ***
Documentation           Test cases basic funtion on The Internet Herokuapp
Library                 SeleniumLibrary
Suite Setup             Open the login page
Suite Teardown          Close Browser
Test Setup              Go to Login page
Test Template           Test case login template

*** Variables ***
${BASE_URL}         https://the-internet.herokuapp.com
${LOGIN_URL}        ${BASE_URL}/login
${BROWSER}          headlesschrome
${VALID_USER}       tomsmith
${VALID_PASSWORD}   SuperSecretPassword!

*** Test Cases ***               USERNAME         PASSWORD              IS Valid?
Valid Login                      ${VALID_USER}    ${VALID_PASSWORD}     ${TRUE}
    [Tags]              Functionality
    [Documentation]     This is valid test cases to verify login function
Invalid Username                 invalid          ${VALID_PASSWORD}     ${FALSE}
    [Tags]              Functionality
    [Documentation]     This is invalid test cases to verify login function
Invalid Password                 ${VALID_USER}    invalid               ${FALSE}
    [Tags]              Functionality
    [Documentation]     This is invalid test cases to verify login function
Invalid Username And Password    invalid          whatever              ${FALSE}
    [Tags]              Functionality
    [Documentation]     This is invalid test cases to verify login function
Empty Username                   ${EMPTY}         ${VALID_PASSWORD}     ${FALSE}
    [Tags]              Functionality
    [Documentation]     This is invalid test cases to verify login function
Empty Password                   ${VALID_USER}    ${EMPTY}              ${FALSE}
    [Tags]              Functionality
    [Documentation]     This is invalid test cases to verify login function
Empty Username And Password      ${EMPTY}         ${EMPTY}              ${FALSE}
    [Tags]              Functionality
    [Documentation]     This is invalid test cases to verify login function

*** Keywords ***
Test case login template
    [Arguments]         ${username}    ${password}      ${Is_VALID}
    Input Username      ${username}
    Input Password      ${password}
    Submit Credentials
    IF    ${Is_VALID} == ${TRUE}
        Welcome page should open
    ELSE
         Login should be failed
    END

Login should be failed
    Element Should Be Visible    //*[@id="flash"]
    Capture Element Screenshot   //*[@id="flash"]   Evidences/${TEST NAME}-{index}.png

Open the login page
    Open Browser  ${LOGIN_URL}  ${BROWSER}
    Maximize Browser Window
    Login Page should be open

Go to Login page
    Go To    ${LOGIN_URL}
    Login Page should be open

Login Page should be open
    Element Should Contain    //h2[.='Login Page']    Login Page
    ##Capture Page Screenshot  LoginPage-{index}.png

Input Username
    [Arguments]  ${username}
    Input Text    username    ${username}  clear=True

Input Password
    [Arguments]  ${password}
    Input Text    password    ${password}  clear=True

Submit Credentials
    Click Button    //button[.=' Login']

Welcome page should open
    Capture Page Screenshot  Evidences/${TEST NAME}-{index}.png
    Location Should Contain    /secure
    Element Should Contain    //div[contains(text(),'You logged into a secure area!')]    You logged into a secure area!
    Element Should Be Visible    //i[.=' Logout']



