# Robot Framework Base Project
# run: robot -d results -i test1 tests/tests.robot

# Here are test settings
*** Settings ***
Documentation  Playing around with RFWK and HLTV.org
Library  Browser
Library  String
Resource  ../resources/res_hltv_common.robot
Resource  ../Variables/locators.robot
Test Setup  Allow Necessary Cookies

*** Test Cases ***
Cycle themes between auto, night and day
  Click  xpath=${themeMenu}
  Take Screenshot
  Change Theme From Auto To Night
  Take Screenshot
  Change Theme From Night To Day
  Take Screenshot
  Change Theme From Day To Auto
  Take Screenshot

View today's latest match
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
  Get Text  //div[@class="topic"]  ==  ${title}
  Take Screenshot

Filter recent activity to sport and view the top activity
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
  Take Screenshot

*** Keywords ***
Change Theme From Auto To Night
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
