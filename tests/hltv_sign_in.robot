# Robot Framework Base Project
# run: robot -d results -i test1 tests/tests.robot

# Here are test settings
*** Settings ***
Documentation  Playing around with RFWK and HLTV.org
Library  Browser
Library  String
Resource  ../resources/res_hltv_common.robot
Test Setup  Allow Necessary Cookies

*** Variables ***
${USER}  testUser
${PASS}  password1234!
${usernameField}  xpath=//div[@id="loginpopup"]//input[@name="username"]
${passwordField}  xpath=//div[@id="loginpopup"]//input[@name="password"]

*** Test Cases ***
Check For Username And Password Input Fields
  
  Open Sign In Popup
  Get Element State  ${usernameField}  visible  ==  True
  Get Element State  ${passwordField}  visible  ==  True
  Get Attribute  ${passwordField}  type  ==  password
  Click  ${usernameField}
  Get Element State  ${usernameField}  focused  ==  True
  Fill Text  ${usernameField}  ${USER}
  Click  ${passwordField}
  Get Element State  ${passwordField}  focused  ==  True
  Fill Text  ${passwordField}  ${PASS}
  Take Screenshot  selector=xpath=//*[@id="loginpopup"]/form

*** Keywords ***
Open Sign In Popup
  Click  xpath=//div[@class="navsignin"]