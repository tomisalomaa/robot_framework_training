*** Settings ***
Library  Browser

*** Keyword ***
Close Webshop
    Go To  http://demowebshop.tricentis.com/
    ${logged_in}  Get Element State  //a[@class="ico-logout"]  visible
    Run Keyword If  ${logged_in}
    ...  Click  //a[@class="ico-logout"]
    Delete All Cookies
    Close Browser