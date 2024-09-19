*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    Collections
Library    String
*** Variables ***
${brand_locator}    //app-shop//a[@class='navbar-brand']
${title_homepage}    ProtoCommerce
${product_list}    css:h4.card-title
${cart_link}    //a[@class='nav-link btn btn-primary']
*** Keywords ***
Verify Title Of Homepage
    Wait Until Element Is Visible    ${brand_locator}
    ${actualTitle}=    Get Title
    Log    ${actualTitle}
    Should Be Equal    ${actualTitle}    ${title_homepage}
Verify title of product display on Shop Page
    @{expected_list_products}=    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    Wait Until Element Is Visible    ${product_list}
    @{list_elements}=    Get Webelements    ${product_list}
    @{actual_product_title}=    Create List
    FOR    ${product}    IN    @{list_elements}
        Log    ${product.text}
        Append To List    ${actual_product_title}    ${product.text}
    END
    Lists Should Be Equal    ${expected_list_products}      ${actual_product_title}
Select Product
    [Arguments]    ${product_name}
         Click Button    xpath://a[text()="${product_name}"]/ancestor::div[@class='card-body']/following-sibling::div//button
         
Verify the number products on Cart 
    [Arguments]    ${number_product}
    ${actual_number_product}=    Get Text    ${cart_link}  
    ${actual_number}=    Get Regexp Matches    ${actual_number_product}    [1-9]
    Log    ${actual_number}
    List Should Contain Value    ${actual_number}    ${number_product}

Click On Cart Icon
    Click Element    ${cart_link}

            
