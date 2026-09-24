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
Test Setup    init
Test Teardown    fermer
*** Test Cases ***
e2e
    connexion
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




