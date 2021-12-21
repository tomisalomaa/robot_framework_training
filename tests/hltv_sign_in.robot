# Robot Framework Base Project
# run: robot -d results -i test1 tests/tests.robot

# Here are test settings
*** Settings ***
Documentation  Playing around with RFWK and HLTV.org
Library  Browser
Library  String
Resource  ../resources/res_hltv_common.robot
<<<<<<< HEAD
=======
Resource  ../Variables/locators.robot
>>>>>>> 4d77e865098ae87584f9acceadabb119793c2546
Test Setup  Allow Necessary Cookies

*** Variables ***
${USER}  testUser
${PASS}  password1234!
<<<<<<< HEAD
${usernameField}  xpath=//div[@id="loginpopup"]//input[@name="username"]
${passwordField}  xpath=//div[@id="loginpopup"]//input[@name="password"]

*** Test Cases ***
Check For Username And Password Input Fields
  
  Open Sign In Popup
  Get Element State  ${usernameField}  visible  ==  True
  Get Element State  ${passwordField}  visible  ==  True
=======
${usernameField}  xpath=${userNameTextField}
${passwordField}  xpath=${passTextField}

*** Test Cases ***
Check For Username And Password Input Fields
  Open Sign In Popup
  Wait For Elements State  ${usernameField}  visible  1s
  Wait For Elements State  ${passwordField}  visible  1s
>>>>>>> 4d77e865098ae87584f9acceadabb119793c2546
  Get Attribute  ${passwordField}  type  ==  password
  Click  ${usernameField}
  Get Element State  ${usernameField}  focused  ==  True
  Fill Text  ${usernameField}  ${USER}
  Click  ${passwordField}
  Get Element State  ${passwordField}  focused  ==  True
  Fill Text  ${passwordField}  ${PASS}
<<<<<<< HEAD
  Take Screenshot  selector=xpath=//*[@id="loginpopup"]/form

*** Keywords ***
Open Sign In Popup
  Click  xpath=//div[@class="navsignin"]
=======
  Take Screenshot  selector=xpath=${loginPopup}

*** Keywords ***
Open Sign In Popup
  Click  xpath=${signInPopup}
>>>>>>> 4d77e865098ae87584f9acceadabb119793c2546
