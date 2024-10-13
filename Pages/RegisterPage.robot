*** Settings ***
Library    Helper/Common.py
Library    BuiltIn
Library    Collections
Library    SeleniumLibrary
Library    String
Resource    BasePage.robot

*** Variables ***
${username_locator}    xpath=//div[@class='form-group']//input[@name='name']
${password_locator}    css:input#exampleInputPassword1
${email_locator}     css:input[name='email']
${customer_json_path}    Test/Resource/Customer.json
${gender_selection_locator}    css:select#exampleFormControlSelect1
${employment_radio_locator}    css:input[name='inlineRadioOptions']
${date_locator}    css:input[name='bday']
${submit_btn}    css:input[value='Submit']
${msg_success_locator}    css:div.alert-success
${Register_Page_URL}    angularpractice/

*** Keywords ***
Go To Register Page    
    [Arguments]    ${browser}
    Go To Page    ${Register_Page_URL}    ${browser}
    
Input Username On Register Form
    [Arguments]    ${username}
    Wait Until Element Is Visible    ${username_locator}
    Input Text    ${username_locator}    ${username}
Input Password On Register Form
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${password_locator} 
    Input Text    ${password_locator}     ${password}
Input Email On Register Form
    [Arguments]    ${email}
    Wait Until Element Is Visible    ${email_locator} 
    Input Text    ${email_locator}     ${email}
Select Gender
    [Arguments]    ${gender}
    Wait Until Element Is Visible    ${gender_selection_locator}
    Select From List By Label    ${gender_selection_locator}    ${gender}
Set Date Of Birth
    [Arguments]    ${date}
    Input Text    ${date_locator}   ${date}
Click Submit Button
    Wait Until Element Is Enabled    ${submit_btn}
    Click Button    ${submit_btn}
Select Employment Status
    [Arguments]    ${status}
    Page Should Contain Radio Button    ${employment_radio_locator}
    Select Radio Button    inlineRadioOptions    ${status}
    Radio Button Should Be Set To    inlineRadioOptions    ${status}
Register New User With Sample Data
    [Arguments]    {customer_data}
    ${data}=    Get Data From Json File    ${customer_json_path}
    ${cust}=    Get From Dictionary    ${data}    {customer_data}
    ${username}=    Get From Dictionary    ${cust}    name
    ${email}=    Get From Dictionary    ${cust}    email
    ${password}=    Get From Dictionary    ${cust}    password
    ${gender}=    Get From Dictionary    ${cust}    gender
    ${emp_status}=    Get From Dictionary    ${cust}    employee
    ${date}=    Get From Dictionary    ${cust}    DOB
    Input Username On Register Form    ${username}
    Input Email On Register Form    ${email}
    Input Password On Register Form    ${password}
    Select Gender    ${gender}
    Select Employment Status    ${emp_status}
    Set Date Of Birth    ${date}
    Click Submit Button
Verify Success Messages Display After User Sign In
    [Arguments]    ${expected_msg}
    Wait Until Element Is Visible    ${msg_success_locator}
    ${success_msg}=    Get Text    ${msg_success_locator}
    ${ignore_first}=    Remove String Using Regexp    ${success_msg}    ^[\s\W×]+
    ${actual_message}=    Strip String    ${ignore_first}
    ${expected_message}=    Strip String    ${expected_msg}
    Should Be Equal    ${actual_message}    ${expected_message}
    
    

    