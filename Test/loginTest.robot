*** Settings ***
Library    DataDriver    file=Resource\\user.csv    encoding=utf_8    dialect=excel
Test Setup    Go To Login Page
Test Teardown    Close All Browsers
Resource    ../Pages/LoginPage.robot
*** Test Cases ***
Login with multiple users
    [Template]    User login unsuccessfully with invalid data

*** Keywords ***
User login unsuccessfully with invalid data
    [Arguments]    ${username}    ${password}    ${role}    ${title}    ${expected_message}
    Compare Messages Displayed After User Login    ${username}    ${password}    ${role}    ${title}    ${expected_message}
