*** Settings ***
Library  SeleniumLibrary
Resource  ../../resources/commonFunctionality.robot
Resource  ../../resources/pageObjects/headerPage.robot
Variables  ../../resources/webelements.py

Test Setup  Start TestCase  ${homePageURL}
Test Teardown  Finish TestCase

*** Test Cases ***
Verifying headers contact us page link
    [documentation]  Verifying headers contact us page link by searching element from it
    [tags]  Functional

    headerPage.Click Contact Us Page
    Page Should Contain Element  ${contactUsContactForm}

Verifying headers main page link
    [documentation]  Verifying headers main page link by searching element from it
    [tags]  Functional

    Go To    ${contactUsPageURL}
    headerPage.Click Home Page
    Page Should Contain Element  ${homePageSearchForm}

Verifying headers logo link
    [documentation]  Verifying headers logo link by searching element from it
    [tags]  Functional

    Go To    ${contactUsPageURL}
    headerPage.Click Logo
    Page Should Contain Element  ${homePageSearchForm}

