*** Settings ***
Documentation    page de login
Library    SeleniumLibrary
*** Variables ***
${prenom}    id:first-name
${nom}    id:last-name
${email}    id:email
${postal-code}    id:postal-code
${btnContinue}    css:[data-testid="checkout-continue"]
${btnCOnfirm}    css:[data-testid="checkout-finish"]

*** Keywords ***
remplirForm
    Input Text    ${prenom}    farid
    Input Text    ${nom}    kechadi
    Input Text    ${email}    farid@gmail.com
    Input Text    ${postal-code}    77150
    Click Button    ${btnContinue}
clickBtnCOnfirmer
    Click Button    ${btnCOnfirm}   
    