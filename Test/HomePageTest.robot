*** Settings ***
Documentation    This testscript verify the function of Home Page
Resource    Pages/LoginPage.robot
Resource    Pages/HomePage.robot
Resource    Pages/CheckoutPage.robot
Library    Collections
Test Teardown    Close All Browsers
*** Variables ***
${username}    rahulshettyacademy
${password}    learning
*** Test Cases ***
Verify that products display correct in the shopping page
    ${selected_product_1}=    Set Variable    Samsung Note 8
    ${quantity}=    Set Variable    1
    Go To Login Page    chrome
    Fill Login Form    ${username}    ${password}    admin    Teacher
    Verify title of product display on Shop Page
    Select Product    ${selected_product_1}
    Verify the number products on Cart    ${quantity}
    Click On Cart Icon
    ${list}=    Create Dictionary    ${selected_product_1}=${quantity}
    Verify The Selected Products And quantities    ${list}


