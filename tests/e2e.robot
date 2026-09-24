*** Settings ***
Documentation    test e2e
Library    SeleniumLibrary
Resource    ../resources/keyword.resource
Resource    ../pages/catalogPage.resource
Resource    ../pages/loginPage.resource
Resource    ../pages/wishlistPage.resource
Resource    ../pages/CartPage.resource
Resource    ../pages/CheckoutPage.resource
Resource    ../pages/paimenetFormPage.resource
Library    DataDriver    file=../jdd/jdd.csv    encoding=utf-8    dialect=excel
Test Setup    init
Test Teardown    fermer
Test Template    data driver test
*** Keywords ***
data driver test
    [Arguments]    ${user}    ${pwd}    ${result}
    IF    '${result}'=='OK'
        connexion    ${user}    ${pwd}
        ${textHEader}=    getTextHeader
        Should Contain    ${textHEader}    Tous les produit
        clickSurVetement
        Location Should Contain    category=clothing
        clickSurAddFavory
        ${msgCount}=    getTxtCartCount
        Should Contain    ${msgCount}    1
        clickWitchListCount
        Location Should Contain    wishlist
        clickChoisirTaille
        clickSurM
        clickAjoutPanier
        ${msg}=    getTExtPanier
        Should Contain    ${msg}    1
        ClickPanier
        clickCOmmander
        Location Should Contain    checkout/info
        remplirForm
        Location Should Contain    checkout/review
        clickBtnCOnfirmer
        Location Should Contain    checkout/payment
        remplirFormPaimenet
        ${messageconf}=    getmsgCOnf
        Should Contain    ${messageconf}    Commande confirmée !
        clickBTnRetour
        Location Should Contain    catalog
        clickLogOUt
        Location Should Contain    login
    ELSE
        connexion    ${user}    ${pwd}    
        ${msgerreurget}=    getMEssageError
        Should Contain    ${msgerreurget}    Le nom d'utilisateur et le mot de passe ne correspondent à aucun utilisateur de ce service    
    END
    
    
*** Test Cases ***
e2e





