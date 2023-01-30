*** Settings ***
Library  SeleniumLibrary
Variables  ../webelements.py
*** Keywords ***
Click Contact Us Page
    Click Element  ${headerContactUsPageLink}

Click Home Page
    Click Element  ${headerHomePageLink}

Click Logo
    Click Element  ${headerLogoLink}