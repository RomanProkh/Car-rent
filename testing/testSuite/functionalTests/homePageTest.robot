*** Settings ***
Library  SeleniumLibrary
Resource  ../../resources/commonFunctionality.robot
Resource  ../../resources/pageObjects/homePage.robot
Variables  ../../resources/webelements.py

Test Setup  Start TestCase  ${homePageURL}
Test Teardown  Finish TestCase

*** Test Cases ***
Select Past Start Date
    [documentation]  Page should not allow to do search if date has passed
    [tags]  Functional
    Select Date    1.1.2020   5    1.1.2024    5
    homePage.Submit Search
    Page Should Contain Element    ${homePageSearchForm}

Select Past End Date
    [documentation]  Page should not allow to do search if date has passed
    [tags]  Functional

    Select Date    1.1.2024   5    1.1.2020    5
    homePage.Submit Search
    Page Should Contain Element    ${homePageSearchForm}

No Date Selected
    [documentation]  Page should inform that full date required
    [tags]  Functional

    homePage.Submit Search
    Page Should Contain Element    ${homePageInsertStartDateErr}
    Page Should Contain Element    ${homePageInsertStartTimeErr}
    Page Should Contain Element    ${homePageInsertEndDateErr}
    Page Should Contain Element    ${homePageInsertEndTimeErr}

Correct Date Selected
    [documentation]  Page should do the search of available cars
    [tags]  Functional

    Select Date    2023-06-01    5    2023-06-02    5
    homePage.Submit Search
    Page Should Contain Element    ${resultPageCarListDiv}

*** Keywords ***
Select Date
    [arguments]   ${StartDate}  ${StartTime}  ${EndDate}  ${EndTime}
    homePage.Select Order Start Date    ${StartDate}
    homePage.Select Order Start Time    ${StartTime}
    homePage.Select Order End Date      ${EndDate}
    homePage.Select Order End Time      ${EndTime}


