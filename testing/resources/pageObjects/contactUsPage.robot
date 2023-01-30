*** Settings ***
Library  SeleniumLibrary
Variables  ../webelements.py

*** Keywords ***
Submit Contact Form
    Submit Form  ${contactUsContactForm}

Fill Name Field
    Input Text  ${contactUsNameField}  John Doe  True

Fill Message Field
    Input Text  ${contactUsMessageField}  message  True

Fill Incorrect Email Address
    Input Text  ${contactUsEmailField}  notanemail  True

Fill Correct Email Address
    Input Text  ${contactUsEmailField}  example@mail.com  True