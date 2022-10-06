*** Settings ***
Resource        resource.robot

*** Variables ***

${base_URL}        https://restool-sample-app.herokuapp.com
${charname}        Jon Snow
${Content_Type}    application/json; charset=utf-8

*** Test Cases ***
Verify status code and response body of a GET request
    [Tags]  Smoke Test
    Create Session    getCharacter    ${base_URL}    verify=true
    ${response}=    GET On Session    getCharacter      /api/character     #params=search=${charname}
    Status Should Be    200    ${response}
    ${body}=    Convert To String    ${response.content}
    Should Contain    ${body}    id
    Should Contain    ${body}    thumbnail
    Should Contain    ${body}    name
    Should Contain    ${body}    realName
    Should Contain    ${body}    location
    Should Contain    ${body}    isAlive
Verify status code, response body of a POST request
    [Tags]    Smoke Test
    Create Session    createCharacter    ${base_URL}     verify=true
    &{body}    Create Dictionary    "name": "Aya Stark"    "reason": "Dead by Old"
    ${response}    POST On Session    createCharacter    /api/dead
    Status Should Be    200    ${response}

    ${res_contentType}=    Get From Dictionary    ${response.headers}    content-Type
    Should Be Equal    ${res_contentType}    ${Content_Type}
    