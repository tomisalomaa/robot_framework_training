*** Settings ***
Documentation  Login to demo webshop
Library  Browser
Resource  ../../resources/common-variables/user_info.robot
Resource  ../../resources/common-keywords/common_keywords.robot
Test Teardown  Close Webshop

*** Test Cases ***
Login To Webshop
    New Page  ${webshop_url}
    Click  //a[@class="ico-login"]
    Fill Text  id=Email  ${email}
    Fill Text  id=Password  ${password}
    Click  //input[@value="Log in"]
    Get Property  //div[@class="header-links"]//a[@class="account"]
    ...  innerText  ==  ${email}