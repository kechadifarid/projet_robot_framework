*** Settings ***
Documentation    page de login
Library    SeleniumLibrary
*** Variables ***
${user}    id:username
${pwd}    id:password
${btn}    css:[data-testid="login-submit"]
${msgerror}    css:[data-testid="login-error"]
*** Keywords ***
connexion
    [Arguments]    ${username}    ${password}
    Input Text    ${user}    ${username}
    Input Text    ${pwd}    ${password}
    Click Button    ${btn}
getMEssageError
    ${msg}=    Get Text    ${msgerror}
    RETURN    ${msg}