*** Settings ***
Documentation           Test cases basic funtion on The Internet Herokuapp
Suite Setup             Open the login page
Suite Teardown          Close Browser
Test Setup              Go to Login page
Test Template           Test case login template
Resource                resource.robot

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





