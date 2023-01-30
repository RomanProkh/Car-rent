# general
homePageURL = "http://localhost:8080/"
contactUsPageURL = "http://localhost:8080/contactUs"
# header locators
headerLogoLink = "css:#logo > a:nth-child(1) > img:nth-child(1)"
headerHomePageLink = "css:#pageMenu > a:nth-child(1)"
headerContactUsPageLink = "css:#pageMenu > a:nth-child(2)"
# Contac Us page locators
contactUsContactForm = "css:.container > form:nth-child(2)"
contactUsNameField = "css:.container > form:nth-child(2) > input:nth-child(2)"
contactUsEmailField = "css:.container > form:nth-child(2) > input:nth-child(4)"
contactUsMessageField = "css:html body div#app div.container form textarea"
# Home page locators
homePageSearchForm = "id:searchFormContainer"
homePageCarTypeSelector = "name:vehicleType"
homePageOrderStartDate = "id:orderStartDate"
homePageOrderStartTime = "name:orderStartTime"
homePageOrderEndDate = "id:orderEndDate"
homePageOrderEndTime = "name:orderEndTime"
homePageSubmitBtn = "id:submitBtn"
homePageFormErrDiv = "class:formErrorContainer"
homePageInsertStartDateErr = "css:html body div#app div div#searchFormContainer form div div.formRow div.formColumn " \
                             "div.formErrorContainer"
homePageInsertStartTimeErr = "css:html body div#app div div#searchFormContainer form div div.formRow " \
                             "div.formColumn div.formErrorContainer"
homePageInsertEndDateErr = "css:html body div#app div div#searchFormContainer form div div.formRow div.formColumn " \
                           "div.formErrorContainer"
homePageInsertEndTimeErr = "css:html body div#app div div#searchFormContainer form div div.formRow div.formColumn " \
                           "div.formErrorContainer"
# Result page locators
resultPageCarListDiv = "id:carList"

