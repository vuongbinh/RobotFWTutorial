*** Settings ***
Resource                resource.robot
Suite Setup             Open HOMEPAGE
Suite Teardown          Close Browser
Test Setup              Goto Login page
Test Template           Login Template

*** Test Cases ***                  EMAIL             PASSWORD             IS VALID
Login with Empty email & password   ${EMPTY}          ${EMPTY}             ${False}
    [Tags]  Funtionality, Negative
Login with valid account            ${VALID_EMAIL}    ${VALID_PASSWORD}    ${True}
    [Tags]  Funtionality, Possitive