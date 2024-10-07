*** Settings ***
Documentation    This testscript verify the function of Login Page
Resource    Pages/LoginPage.robot
Resource    Pages/HomePage.robot
Test Setup    Go To Login Page    chrome
Test Teardown    Close All Browsers
*** Variables ***
${username}    rahulshettyacademy
${password}    learning
** Test Cases **    USERNAME             PASSWORD
Empty Username
    [Template]    User login unsuccessfully with invalid data
    ${EMPTY}    ${password}
Empty Password
    [Template]    User login unsuccessfully with invalid data
    ${username}    ${EMPTY}

Verify users can login successfully with valid username and password
    Fill login form    ${username}    ${password}    admin    Teacher
    Verify Title Of Homepage
Verify users can not login with invalid username and password
    Fill login form    admin123   password123    admin    Teacher
    Verify error message if user input invalid credential on login form
Verify when user click on link displaying on login page they will see email address to get resource
     Click On Free Access link And Get Email Address
     Grab email address on Free Access Page
     Switch To Main Window To Fill The Extracted Email