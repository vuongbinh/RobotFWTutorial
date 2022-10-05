*** Settings ***
Resource        resource.robot

*** Variables ***

${charname}        Tyrion Lannister

*** Test Cases ***
# Verify status code and response body of a GET request
#     [Tags]  Smoke Test
#     Create Session    mySession    https://restool-sample-app.herokuapp.com    verify=True
#     ${response}=    GET On Session    mySession     /api/character     params=search=${charname}
#     Status Should Be    200    ${response}

#     #Check ${charame} should be return in response body
#     ${name}=    Get Value From Json    ${response.json()}   name
#     ${nameFromList}=    Get From List    ${name}    0
#     Should Be Equal    ${nameFromList}    ${charname}