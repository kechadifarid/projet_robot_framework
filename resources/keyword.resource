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
    Open Browser    ${url}    ${browser}    remote_url=${remote_url}    options=${options}
    Set Selenium Implicit Wait    5s

fermer
    Close Browser