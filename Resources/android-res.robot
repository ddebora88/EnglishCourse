*** Settings ***
Library     AppiumLibrary

*** Variables ***
#*** Test Variables  ***
&{USER1-DETAILS}        email=ut.lela3@gmail.com   password=Password!7
&{USER2-DETAILS}        email=ut.lela3@gmail.com   password=1234


#*** Home ***
${HOME-DETAIL1}         //android.widget.HorizontalScrollView[@resource-id="com.englishscore:id/tab_layout"]/android.widget.LinearLayout/android.widget.LinearLayout[1]
${HOME-DETAIL2}         //android.widget.HorizontalScrollView[@resource-id="com.englishscore:id/tab_layout"]/android.widget.LinearLayout/android.widget.LinearLayout[2]
${HOME-DETAIL3}         //android.widget.HorizontalScrollView[@resource-id="com.englishscore:id/tab_layout"]/android.widget.LinearLayout/android.widget.LinearLayout[3]
${HOME-DETAIL4}         //android.widget.HorizontalScrollView[@resource-id="com.englishscore:id/tab_layout"]/android.widget.LinearLayout/android.widget.LinearLayout[4]
${HOME-DETAIL5}         //android.widget.HorizontalScrollView[@resource-id="com.englishscore:id/tab_layout"]/android.widget.LinearLayout/android.widget.LinearLayout[5]
${HOME-SIGNIN-EMAIL}    com.englishscore:id/btn_auth_email
${HOME-NEXT}            //android.widget.ImageView[@resource-id="com.englishscore:id/btn_next"]
${BUTTON-SIGNIN}        com.englishscore:id/btn_sign_in

#*** Sign In page ***
${LOGIN-TITLE}              com.englishscore:id/tv_title
${LOGIN-EMAIL-FIELD}        //android.widget.EditText[@resource-id="com.englishscore:id/boxed_text_input" and @text="enter your email address"]
${LOGIN-PASSWORD-FIELD}     //android.widget.EditText[@resource-id="com.englishscore:id/boxed_text_input" and @text="enter a password (8+ characters)"]
${ERROR-MESSAGE}            com.englishscore:id/error_text

#*** Main page ***
${HAMBURGER-MENU}   com.englishscore:id/btn_menu


#*** Logout ***
${LOGOUT-MENU}      com.englishscore:id/tv_logout
${LOGOUT-OK}        android:id/button1
${LOGOUT-CANCEL}    android:id/button2

*** Keywords ***

Open English Course Application
    Open Application  http://127.0.0.1:4723/wd/hub    platformName=Android    deviceName=emulator-5554    appPackage=com.englishscore    appActivity=com.englishscore.MainActivity    automationName=UiAutomator2

Intro Page
    Click element    ${HOME-DETAIL2}
    Click element    ${HOME-DETAIL3}
    Click element    ${HOME-DETAIL4}
    Click element    ${HOME-DETAIL5}
    Click element    ${BUTTON-SIGNIN}
    Wait until page contains element    ${HOME-SIGNIN-EMAIL}
    Click element    ${HOME-SIGNIN-EMAIL}

Signin with user
    [Arguments]   ${EMAIL}  ${PASSWORD}
    Input user email    ${EMAIL}
    Input user password    ${PASSWORD}
    Submit Login
    Verify Login Is Successful

Input user email
    [Arguments]    ${EMAIL}
    Wait until page contains element    ${LOGIN-EMAIL-FIELD}
    Input text    ${LOGIN-EMAIL-FIELD}  ${EMAIL}
Input user password
    [Arguments]    ${PASSWORD}
    Input text    ${LOGIN-PASSWORD-FIELD}   ${PASSWORD}

Submit Login
    Click element    ${BUTTON-SIGNIN}

Verify Login Is Successful
    Wait until page contains element    ${HAMBURGER-MENU}


Logout with user (CANCEL)
    Go to Main Menu
    Click the Logout and cancel
    Verify Logout is not successful

Go to Main Menu
    Click element    ${HAMBURGER-MENU}
    Wait until page contains element    ${LOGOUT-MENU}

Click the Logout and cancel
    Click element    ${LOGOUT-MENU}
    Click element   ${LOGOUT-CANCEL}

Verify Logout is not successful
    Wait until page contains element    ${HAMBURGER-MENU}


Logout with user (OK)
    Go to Hamburger Menu
    Click the Logout button
    Verify Logout is successful

Go to Hamburger Menu
    Click element    ${HAMBURGER-MENU}
    Wait until page contains element    ${LOGOUT-MENU}

Click the Logout button
    Click element    ${LOGOUT-MENU}
    Click element   ${LOGOUT-OK}

Verify Logout is successful
    Wait until page contains element    ${HOME-DETAIL1}





