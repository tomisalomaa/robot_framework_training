*** Settings ***
Library  Browser

*** Keyword ***
Log In
    New Page  ${webshop_url}
    Click  //a[@class="ico-login"]
    Fill Text  id=Email  ${email}
    Fill Text  id=Password  ${password}
    Click  //input[@value="Log in"]
    Get Property  //div[@class="header-links"]//a[@class="account"]
    ...  innerText  ==  ${email}

Close Webshop
    Go To  http://demowebshop.tricentis.com/
    ${logged_in}  Get Element State  //a[@class="ico-logout"]  visible
    Run Keyword If  ${logged_in}
    ...  Click  //a[@class="ico-logout"]
    Delete All Cookies
    Close Browser