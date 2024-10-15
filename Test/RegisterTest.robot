*** Settings ***
Library    ../Helper/Common.py
Resource    ../Pages/RegisterPage.robot
Test Teardown    Close All Browsers
*** Test Cases ***
Verify That User Can Register Successfully
    [Tags]    REGRESSION    SMOKE
    Go To Register Page
    Register New User With Sample Data    Customer 1
    Verify Success Messages Display After User Sign In    Success! The Form has been submitted successfully!.
