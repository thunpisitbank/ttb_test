*** Settings ***
Library    RequestsLibrary
Resource    keyword.robot

*** Test Cases ***
Get user profile success
    ${response}=    Send Request Api
    Expect Results Api    ${response}

Get user profile but user not found
    ${response}=    Send Request Api Error
    Expect Results Api Error    ${response}

