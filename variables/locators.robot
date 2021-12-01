*** Variables ***
${themeMenu}  //i[@class="fa fa-caret-down"]
${latestMatch}  //div[@class="top-border-hide"]/a[1]
${latestTeam1}  //div[@class="rightCol"]/aside/div[@class="top-border-hide"]/a[1]//div[@class="teamrow"][1]//span[@class="team"]
${latestTeam2}  //div[@class="rightCol"]/aside/div[@class="top-border-hide"]/a[1]//div[@class="teamrow"][2]//span[@class="team"]
${matchTeam1}  //div[@class="team1-gradient"]//div[@class="teamName"]
${matchTeam2}  //div[@class="team2-gradient"]//div[@class="teamName"]
${latestTopic}  //div[@class="right2Col"]/aside[1]
${latestTopicTitle}  //div[@class="right2Col"]/aside[1]/div[@class="col-box-con"]//a[1]/span[@title]
${latestTopicLink}  //div[@class="right2Col"]/aside[1]/div[@class="col-box-con"]//a[1]
${sportFilterButton}  //div[@class="right2Col"]/aside[1]
${toggleProMode}  //div[@class="right2Col"]/aside[1]//div[@class="pro-mode-toggle promode-disabled"]
${disableProMode}  //div[@class="right2Col"]/aside[1]//div[@class="pro-mode-toggle promode-enabled"]
${latestMatchSideMenu}  //div[@class="right2Col"]//div[@class="activitylist"]/a[contains(@href, "/matches")][1]/span
${latestMatchSideMenuLink}  //div[@class="right2Col"]//div[@class="activitylist"]/a[contains(@href, "/matches")][1]
${proModeMatches}  //a[contains(text(),"LATEST REPLAYS")]/../..
${proModeLastMatch}  //a[contains(text(),"LATEST REPLAYS")]/../..//a[@class="col-box a-reset"][last()]
${proModeLastMatchTeam1}  //a[contains(text(), "LATEST REPLAYS")]/../..//a[contains(@href, "/matches")][last()]//div[@class="teamrow"][1]//span
${proModeLastMatchTeam2}  //a[contains(text(), "LATEST REPLAYS")]/../..//a[contains(@href, "/matches")][last()]//div[@class="teamrow"][2]//span
${userThemeAutoSelected}  //span[contains(@class, "userTheme-auto selected")]
${userThemeDaySelected}  //span[contains(@class, "userTheme-day selected")]
${userThemeNightSelected}  //span[contains(@class, "userTheme-night selected")]
${userThemeNight}  //*[@id="popupsettings"]/div[2]/span[2]/span[contains(text(), "Night")]
${userThemeDay}  //*[@id="popupsettings"]/div[2]/span[2]/span[contains(text(), "Day")]
${userThemeAuto}  //*[@id="popupsettings"]/div[2]/span[2]/span[contains(text(), "Auto")]