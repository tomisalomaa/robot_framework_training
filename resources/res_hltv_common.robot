*** Settings ***
Library  Browser

*** Variables ***

*** Keywords ***
Allow Necessary Cookies
  New Page  ${URL}
  Wait For Elements State  //div[@id="CybotCookiebotDialog"]
  Click  xpath=//a[@id="CybotCookiebotDialogBodyLevelButtonLevelOptinAllowallSelection"]