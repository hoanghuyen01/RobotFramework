*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${BASE_URL}=    https://rahulshettyacademy.com
*** Keywords ***
Go To Page
    [Arguments]    ${link_page}    ${browser}
    Open Browser    ${BASE_URL}/${link_page}   ${browser}
