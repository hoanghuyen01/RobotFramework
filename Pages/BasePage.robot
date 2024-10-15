*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${BASE_URL}=    https://rahulshettyacademy.com
${browser}=    chrome
*** Keywords ***
Go To Page
    [Arguments]    ${link_page}
    Open Browser    ${BASE_URL}/${link_page}   ${browser}
