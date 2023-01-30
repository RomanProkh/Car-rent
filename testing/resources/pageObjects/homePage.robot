*** Settings ***
Library  SeleniumLibrary
Library 	Collections
Variables  ../webelements.py

*** Keywords ***
Select Car Type By Index
    [arguments]  ${index}
    Select From List By Index  ${homePageCarTypeSelector}  ${index}

Select Order Start Date
    [arguments]   ${date}
    Input Text    ${homePageOrderStartDate}    ${date}

Select Order Start Time
    [arguments]  ${index}
    Select From List By Index    ${homePageOrderStartTime}    ${index}

Select Order End Date
    [arguments]  ${date}
    Input Text    ${homePageOrderEndDate}    ${date}

Select Order End Time
    [arguments]  ${index}
    Select From List By Index    ${homePageOrderEndTime}    ${index}

Submit Search
    Click Element  ${homePageSubmitBtn}
