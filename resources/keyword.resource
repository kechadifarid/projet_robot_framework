*** Settings ***
Documentation    fichier keyword
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${url}          https://ssid-testing-agency.github.io/Lab.qa/#/login
${browser}      chrome
${remote_url}   http://chrome:4444/wd/hub

*** Keywords ***
init
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Open Browser    ${url}    ${browser}    remote_url=${remote_url}    options=${options}
    Maximize Browser Window
    Set Selenium Implicit Wait    5s

fermer
    Close Browser