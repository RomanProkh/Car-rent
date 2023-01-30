*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Start TestCase
    [Arguments]  ${url}
    Open Browser  ${url}  headlessfirefox
    #Verifying that page is opened
    Title Should Be  car-rent

Finish TestCase
    Close Browser
