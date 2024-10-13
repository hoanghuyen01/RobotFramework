*** Settings ***
Library    Helper/Common.py
Resource    Pages/RegisterPage.robot
*** Test Cases ***
Verify That User Can Register Successfully
    Go To Register Page    chrome
    Register New User With Sample Data    Customer 1
    Verify Success Messages Display After User Sign In    Success! The Form has been submitted successfully!.
