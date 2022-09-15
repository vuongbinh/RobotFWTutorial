*** Settings ***
Documentation  Test cases basic funtion on The Internet Herokuapp
Library  SeleniumLibraty

*** Variables ***
${BASE_URL}  https://the-internet.herokuapp.com
${PATH}  /login
${BROWSER}  firefox

*** Test Cases ***
Verify users are able to login to the system



*** Keywords ***
