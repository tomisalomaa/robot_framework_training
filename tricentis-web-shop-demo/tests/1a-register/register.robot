*** Settings ***
Documentation  Registering a test user to demo platform
Library  Browser
Resource  ../../resources/common-keywords/common_keywords.robot
Resource  ../../resources/common-variables/user_info.robot
Test Teardown  Close Webshop

*** Variables ***

*** Test Cases ***
Register new user
    New Page    ${webshop_url}
    Click   //a[@class = "ico-register"]
    Check Checkbox  id=gender-${gender}
    Fill Text   id=FirstName  ${first_name}
    Fill Text   id=LastName  ${last_name}
    Fill Text   id=Email  ${email}
    Fill Text   id=Password  ${password}
    Fill Text   id=ConfirmPassword  ${password}
    Take Screenshot
    Click  id=register-button
    ${reg_result}  Get Element State  //*[contains(text(), "The specified email already exists")]  visible
    ${post_reg_url}  Get Url
    Run Keyword If  '${post_reg_url}'=='http://demowebshop.tricentis.com/registerresult/1'
    ...  Click  //input[contains(@class, "register-continue-button")]
    ...  ELSE IF  ${reg_result}  Log  User already exists
    ...  ELSE  Log  Something went wrong with the registration process, no success and no error message.
    Take Screenshot