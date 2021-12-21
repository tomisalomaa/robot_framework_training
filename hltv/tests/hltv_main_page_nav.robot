# Robot Framework Base Project
# run: robot -d results -i test1 tests/tests.robot

# Here are test settings
*** Settings ***
Documentation  Playing around with RFWK and HLTV.org
Library  Browser
Library  String
Resource  ../resources/res_hltv_common.robot
<<<<<<< HEAD
Test Setup  Allow Necessary Cookies

*** Variables ***

*** Test Cases ***
Cycle themes between auto, night and day
  Click  xpath=//i[@class="fa fa-caret-down"]
=======
Resource  ../Variables/locators.robot
Test Setup  Allow Necessary Cookies

*** Test Cases ***
Cycle themes between auto, night and day
  Click  xpath=${themeMenu}
>>>>>>> 4d77e865098ae87584f9acceadabb119793c2546
  Take Screenshot
  Change Theme From Auto To Night
  Take Screenshot
  Change Theme From Night To Day
  Take Screenshot
  Change Theme From Day To Auto
  Take Screenshot

View today's latest match
<<<<<<< HEAD
  Take Screenshot  selector=xpath=//div[@class="rightCol"]/aside/div[@class="top-border-hide"]/a[1]
  ${team1}  Get Text  //div[@class="rightCol"]/aside/div[@class="top-border-hide"]/a[1]//div[@class="teamrow"][1]//span[@class="team"]
  ${team2}  Get Text  //div[@class="rightCol"]/aside/div[@class="top-border-hide"]/a[1]//div[@class="teamrow"][2]//span[@class="team"]
  Click  xpath=//div[@class="rightCol"]/aside/div[@class="top-border-hide"]/a[1]
  Get Text  //div[@class="team1-gradient"]//div[@class="teamName"]  ==  ${team1}
  Get Text  //div[@class="team2-gradient"]//div[@class="teamName"]  ==  ${team2}
  Take Screenshot

View latest recent forum activity
  Take Screenshot  selector=xpath=//div[@class="right2Col"]/aside[1]
  ${title}  Get Text  //div[@class="right2Col"]/aside[1]/div[@class="col-box-con"]//a[1]/span[@title]
  Click  xpath=//div[@class="right2Col"]/aside[1]/div[@class="col-box-con"]//a[1]
=======
  Take Screenshot  selector=xpath=${latestMatch}
  ${team1}  Get Text  ${latestTeam1}
  ${team2}  Get Text  ${latestTeam2}
  Click  ${latestMatch}
  Get Text  ${matchTeam1}  ==  ${team1}
  Get Text  ${matchTeam2}  ==  ${team2}
  Take Screenshot

View most recent forum activity
  Take Screenshot  selector=xpath=${latestTopic}
  ${title}  Get Text  ${latestTopicTitle}
  Click  xpath=${latestTopicLink}
>>>>>>> 4d77e865098ae87584f9acceadabb119793c2546
  Get Text  //div[@class="topic"]  ==  ${title}
  Take Screenshot

Filter recent activity to sport and view the top activity
<<<<<<< HEAD
  Take Screenshot  selector=xpath=//div[@class="right2Col"]/aside[1]
  Test That The Sport Filter Is Inactive
  Click  xpath=//div[@class="right2Col"]/aside[1]//div[@class="pro-mode-toggle promode-disabled"]
  Test That The Sport Filter Is Active
  Take Screenshot  selector=xpath=//div[@class="right2Col"]/aside[1]
  ${matchName}  Get Text  //div[@class="right2Col"]//div[@class="activitylist"]/a[contains(@href, "/matches")][1]/span
  ${team1}  Fetch From Left  ${matchName}  ${SPACE}
  ${team2}  Fetch From Right  ${matchName}  ${SPACE}
  Click  xpath=//div[@class="right2Col"]//div[@class="activitylist"]/a[contains(@href, "/matches")][1]
  Get Text  //div[@class="team1-gradient"]//div[@class="teamName"]  ==  ${team1}
  Get Text  //div[@class="team2-gradient"]//div[@class="teamName"]  ==  ${team2}
  Take Screenshot

Choose the final replay among the latest
  Take Screenshot  selector=xpath=//a[contains(text(),"LATEST REPLAYS")]/../..
  Take Screenshot  selector=xpath=//a[contains(text(),"LATEST REPLAYS")]/../..//a[@class="col-box a-reset"][last()]
  ${team1}  Get Text  //a[contains(text(), "LATEST REPLAYS")]/../..//a[contains(@href, "/matches")][last()]//div[@class="teamrow"][1]//span
  ${team2}  Get Text  //a[contains(text(), "LATEST REPLAYS")]/../..//a[contains(@href, "/matches")][last()]//div[@class="teamrow"][2]//span
  Click  //a[contains(text(), "LATEST REPLAYS")]/../..//a[contains(@href, "/matches")][last()]
  Get Text  //div[@class="team1-gradient"]//div[@class="teamName"]  ==  ${team1}
  Get Text  //div[@class="team2-gradient"]//div[@class="teamName"]  ==  ${team2}
=======
  Take Screenshot  selector=xpath=${sportFilterButton}
  Test That The Sport Filter Is Inactive
  Click  xpath=${toggleProMode}
  Test That The Sport Filter Is Active
  Take Screenshot  selector=xpath=${sportFilterButton}
  ${matchName}  Get Text  ${latestMatchSideMenu}
  ${team1}  Fetch From Left  ${matchName}  ${SPACE}vs
  ${team2}  Fetch From Right  ${matchName}  vs${SPACE}
  Click  xpath=${latestMatchSideMenuLink}
  Get Text  ${matchTeam1}  ==  ${team1}
  Get Text  ${matchTeam2}  ==  ${team2}
  Take Screenshot

Choose the final replay among the latest
  Take Screenshot  selector=xpath=${proModeMatches}
  Take Screenshot  selector=xpath=${proModeLastMatch}
  ${team1}  Get Text  ${proModeLastMatchTeam1}
  ${team2}  Get Text  ${proModeLastMatchTeam2}
  Click  ${proModeLastMatch}
  Get Text  ${matchTeam1}  ==  ${team1}
  Get Text  ${matchTeam2}  ==  ${team2}
>>>>>>> 4d77e865098ae87584f9acceadabb119793c2546
  Take Screenshot

*** Keywords ***
Change Theme From Auto To Night
<<<<<<< HEAD
  Get Element State  //span[contains(@class, "userTheme-auto selected")]  attached  ==  True
  Click  xpath=//*[@id="popupsettings"]/div[2]/span[2]/span[contains(text(), "Night")]
  Get Element State  //span[contains(@class, "userTheme-day selected")]  attached  ==  False
  Get Element State  //span[contains(@class, "userTheme-auto selected")]  attached  ==  False
  Get Element State  //span[contains(@class, "userTheme-night selected")]  attached  ==  True

Change Theme From Night To Day
  Get Element State  //span[contains(@class, "userTheme-night selected")]  attached  ==  True
  Click  xpath=//*[@id="popupsettings"]/div[2]/span[2]/span[contains(text(), "Day")]
  Get Element State  //span[contains(@class, "userTheme-night selected")]  attached  ==  False
  Get Element State  //span[contains(@class, "userTheme-auto selected")]  attached  ==  False
  Get Element State  //span[contains(@class, "userTheme-day selected")]  attached  ==  True

Change Theme From Day To Auto
  Get Element State  //span[contains(@class, "userTheme-day selected")]  attached  ==  True
  Click  xpath=//*[@id="popupsettings"]/div[2]/span[2]/span[contains(text(), "Auto")]
  Get Element State  //span[contains(@class, "userTheme-day selected")]  attached  ==  False
  Get Element State  //span[contains(@class, "userTheme-night selected")]  attached  ==  False
  Get Element State  //span[contains(@class, "userTheme-auto selected")]  attached  ==  True

Test That The Sport Filter Is Inactive
  Get Element Count  xpath=//div[@class="right2Col"]/aside[1]//div[@class="pro-mode-toggle promode-disabled"]  ==  1
  Get Element Count  xpath=//div[@class="right2Col"]/aside[1]//div[@class="pro-mode-toggle promode-enabled"]  ==  0
  Take Screenshot  selector=xpath=//div[@class="right2Col"]/aside[1]//div[@class="pro-mode-toggle promode-disabled"]

Test That The Sport Filter Is Active
  Get Element Count  xpath=//div[@class="right2Col"]/aside[1]//div[@class="pro-mode-toggle promode-disabled"]  ==  0
  Get Element Count  xpath=//div[@class="right2Col"]/aside[1]//div[@class="pro-mode-toggle promode-enabled"]  ==  1
  Take Screenshot  selector=xpath=//div[@class="right2Col"]/aside[1]//div[@class="pro-mode-toggle promode-enabled"]
=======
  Wait For Elements State  ${userThemeAutoSelected}  attached  1s
  Click  xpath=${userThemeNight}
  Get Element State  ${userThemeDaySelected}  attached  ==  False
  Get Element State  ${userThemeAutoSelected}  attached  ==  False
  Get Element State  ${userThemeNightSelected}  attached  ==  True

Change Theme From Night To Day
  Wait For Elements State  ${userThemeNightSelected}  attached  1s
  Click  xpath=${userThemeDay}
  Get Element State  ${userThemeNightSelected}  attached  ==  False
  Get Element State  ${userThemeAutoSelected}  attached  ==  False
  Get Element State  ${userThemeDaySelected}  attached  ==  True

Change Theme From Day To Auto
  Wait For Elements State  ${userThemeDaySelected}  attached  1s
  Click  xpath=${userThemeAuto}
  Get Element State  ${userThemeDaySelected}  attached  ==  False
  Get Element State  ${userThemeNightSelected}  attached  ==  False
  Get Element State  ${userThemeAutoSelected}  attached  ==  True

Test That The Sport Filter Is Inactive
  Get Element Count  xpath=${toggleProMode}  ==  1
  Get Element Count  xpath=${disableProMode}  ==  0
  Take Screenshot  selector=xpath=${toggleProMode}

Test That The Sport Filter Is Active
  Get Element Count  xpath=${toggleProMode}  ==  0
  Get Element Count  xpath=${disableProMode}  ==  1
  Take Screenshot  selector=xpath=${disableProMode}
>>>>>>> 4d77e865098ae87584f9acceadabb119793c2546
