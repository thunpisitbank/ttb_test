*** Settings ***
Library    RequestsLibrary


*** Keywords ***
Send Request Api
    Create Session    request_login    https://reqres.in
    ${response}=    Get On Session    request_login    /api/users/12   expected_status=200
    RETURN    ${response.json()}

Send Request Api Error
    Create Session    request_login    https://reqres.in
    ${response}=    Get On Session    request_login    /api/users/1234   expected_status=404
    RETURN    ${response.json()}
    


Expect Results Api
    [Arguments]    ${response}
    Should Be Equal    ${response["data"]["id"]}    ${12}
    Should Be Equal    ${response["data"]["email"]}    rachel.howell@reqres.in
    Should Be Equal    ${response["data"]["first_name"]}    Rachel
    Should Be Equal    ${response["data"]["last_name"]}    Howell
    Should Be Equal    ${response["data"]["avatar"]}    https://reqres.in/img/faces/12-image.jpg

Expect Results Api Error
    [Arguments]    ${response}
    Should Be Equal    '${response}'    '{}'
