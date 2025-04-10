*** Settings ***
Library    SeleniumLibrary
Library    String
Suite Setup     Open Browser    http://the-internet.herokuapp.com/login
Test Teardown   Go To  http://the-internet.herokuapp.com/login
Suite Teardown  Close Browser

*** Test Cases ***
Login success
    # Open Browser    http://the-internet.herokuapp.com/login
    Wait Until Element Is Visible    id=username
    Input Text    id=username    tomsmith
    Input Text    id=password    SuperSecretPassword!
    Click Button    css:button[type='submit']

Login failed -Password incorrect
    # Open Browser    http://the-internet.herokuapp.com/login
    Wait Until Element Is Visible    id=username
    Input Text    id=username    tomsmith
    Input Text    id=password    Password!
    Click Button    css:button[type='submit']
    Wait Until Element Is Visible    xpath=//*[@id="flash"]
    ${alert_text}=    Get Text    xpath=//*[@id="flash"]
    ${fact_word}=    Split String    ${alert_text}    \n
    Log   ${fact_word}[0]
    Should Be Equal    ${fact_word}[0]    Your password is invalid!    

Login failed -Username not found
    # Open Browser    http://the-internet.herokuapp.com/login
    Wait Until Element Is Visible    id=username
    Input Text    id=username    tomholland
    Input Text    id=password    Password!
    Click Button    css:button[type='submit']
    Wait Until Element Is Visible    xpath=//*[@id="flash"]
    ${alert_text}=    Get Text    xpath=//*[@id="flash"]
    ${fact_word}=    Split String    ${alert_text}    \n
    Log   ${fact_word}[0]
    Should Be Equal    ${fact_word}[0]    Your username is invalid!    
    
