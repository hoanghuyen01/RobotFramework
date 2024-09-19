*** Settings ***
Library    SeleniumLibrary
Resource    BasePage.robot
*** Variables ***
${username_locator}    id:username
${passwrd_locator}    id:password
${signInBtn}    id:signInBtn
${titleDropdown}    xpath=//select[@class='form-control']
${alertMessage}    xpath=//div[@class="alert alert-danger col-md-12"]
${Login_Page_URL}    loginpagePractise/
*** Keywords ***
Go To Login Page
    [Arguments]    ${browser}
    Go To Page    ${Login_Page_URL}    ${browser}
Fill login form
    [Arguments]    ${username}    ${password}    ${role}    ${title}
    Fill Username    ${username}
    Fill Password    ${password}
    Select Role for User    ${role}
    Select From List By Label    ${titleDropdown}    ${title}
    Click On SignIn Button
Verify error message if user input invalid credential on login form
    Wait Until Element Is Visible    ${alertMessage}
    ${actualMessage}=    Get Text    ${alertMessage}
    Should Be Equal As Strings    ${actualMessage}    Incorrect username/password.
    Log    ${actualMessage}

Fill Username
    [Arguments]    ${username}
    Wait Until Element Is Visible    ${username_locator}    5
    Input Text    ${username_locator}    ${username}
Fill Password
    [Arguments]    ${password}
    Wait Until Element Is Visible    ${passwrd_locator}    5
    Input Password    ${passwrd_locator}    ${password}
Click On SignIn Button
    Wait Until Element Is Enabled    ${signInBtn}
    Click Button    ${signInBtn}
Select Role for User
    [Arguments]    ${role} 
    Click Element    xpath=//input[@value='${role}']/following-sibling::span



