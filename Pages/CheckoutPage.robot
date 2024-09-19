*** Settings ***
Library    Collections
Library    SeleniumLibrary
Library    BuiltIn
*** Variables ***
${name_product_locators}=    //td[@class="col-sm-8 col-md-6"]//h4//a
*** Keywords ***
Verify The Selected Products And quantities
    [Arguments]    @{product_list}
    ${product_name_dic}=    Create Dictionary
    Wait Until Element Is Visible    ${name_product_locators}
    @{name_list}=    Get Webelements    ${name_product_locators}
    FOR    ${element}    IN    @{name_list}
        ${name}=    Set Variable    ${element.text}
        Log    Name: ${name}
        ${xpath}=    Set Variable    //a[text()='${name}']/ancestor::td/following-sibling::td//input[@id='exampleInputEmail1']
        Log    XPath used: ${xpath}
        ${quantity}=    Get Text    xpath=${xpath}
        Log    Quantity: ${quantity}
        Set To Dictionary      ${product_name_dic}    ${name}    1
    END
    Dictionaries Should Be Equal    ${product_name_dic}    @{product_list}