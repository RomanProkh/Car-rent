*** Settings ***
Library  SeleniumLibrary
Resource  ../../resources/commonFunctionality.robot
Resource  ../../resources/pageObjects/contactUsPage.robot
Variables  ../../resources/webelements.py

Test Setup  Start TestCase  ${contactUsPageURL}
Test Teardown  Finish TestCase

*** Test Cases ***

Email with correct data should be sent
    [documentation]  Email with correct data should be successfully sent
    [tags]  Functional

    contactUsPage.Fill Name Field
    contactUsPage.Fill Correct Email Address
    contactUsPage.Fill Message Field
    contactUsPage.Submit Contact Form
    Alert Should Be Present

Email with incorrect address should not be sent
    [documentation]  Contact Us page should not allow to submit form if email address is incorrect
    [tags]  Functional

    contactUsPage.Fill Name Field
    contactUsPage.Fill Incorrect Email Address
    contactUsPage.Fill Message Field
    contactUsPage.Submit Contact Form
    Alert Should Not Be Present

Email with empty name field should not be sent
    [documentation]  Contact Us page should not allow to submit form if name field is empty
    [tags]  Functional

    contactUsPage.Fill Correct Email Address
    contactUsPage.Fill Message Field
    contactUsPage.Submit Contact Form
    Alert Should Not Be Present

Email with empty message field should not be sent
    [documentation]  Contact Us page should not allow to submit form if message field is empty
    [tags]  Functional

    contactUsPage.Fill Name Field
    contactUsPage.Fill Correct Email Address
    contactUsPage.Submit Contact Form
    Alert Should Not Be Present

Email with empty email field should not be sent
    [documentation]  Contact Us page should not allow to submit form if message email is empty
    [tags]  Functional

    contactUsPage.Fill Name Field
    contactUsPage.Fill Message Field
    contactUsPage.Submit Contact Form
    Alert Should Not Be Present
