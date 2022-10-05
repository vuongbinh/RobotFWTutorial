*** Settings ***
Library      SeleniumLibrary
Library      RequestsLibrary
Library      JSONLibrary
Library      Collections

*** Variables ***
${HOME_PAGE}                http://automationpractice.com/index.php
${VALID_EMAIL}              binh.vuonghao@gmail.com
${VALID_PASSWORD}           aA@12345
${BROWSER}                  firefox

*** Keywords ***
Login Template
    [Arguments]          ${email}           ${password}         ${is_valid}
    Input email          ${email}
    Input password       ${password}
    Submit Credential
    Run Keyword If    ${is_valid} == ${True}  Login should success
    ...    ELSE    Login should failed

Open HOMEPAGE
    Open Browser                    ${HOME_PAGE}        ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible   slider_row
    Page Should Contain       slider_row
Goto Login page
    Go To                           ${HOME_PAGE}?controller=authentication
    Wait Until Element Is Visible   //div[@id='center_column']
    Element Should Be Visible       //div[@id='center_column']
Login should success
    Wait Until Location Contains    ?controller=my-account      20
    Location Should Be              ${HOME_PAGE}?controller=my-account
    Wait Until Element Is Visible   //a[@href="http://automationpractice.com/index.php?mylogout="]
    Element Should Be Visible       //a[@href="http://automationpractice.com/index.php?mylogout="]
    Capture Page Screenshot         Evidences/${TEST NAME}-{index}.png
Login should failed
    Wait Until Element Is Visible   //h1[.='Authentication']/following-sibling::div[@class='alert alert-danger']    20
    Element Should Be Visible       //h1[.='Authentication']/following-sibling::div[@class='alert alert-danger']
    Location Should Be              ${HOME_PAGE}?controller=authentication
    Capture Element Screenshot      center_column   Evidences/${TEST NAME}-{index}.png
Input email
    [Arguments]   ${email}
    Input Text    email    ${email}
Input password
    [Arguments]   ${password}
    Input Text    passwd    ${password}
Submit Credential
    Click Button    SubmitLogin