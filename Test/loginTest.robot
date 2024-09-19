*** Settings ***
Documentation    This testscript verify the function of Login Page
Resource    Pages/LoginPage.robot
Resource    Pages/HomePage.robot
Test Setup    Go To Login Page    chrome
Test Teardown    Close All Browsers
*** Variables ***
${username}    rahulshettyacademy
${password}    learning
*** Test Cases ***
Verify users can login successfully with valid username and password
    Fill login form    ${username}    ${password}    admin    Teacher
    Verify Title Of Homepage
Verify users can not login with invalid username and password
    Fill login form    admin123   password123    admin    Teacher
    Verify error message if user input invalid credential on login form
