*** Settings ***
Library    AppiumLibrary
Resource   ../Resources/android-res.robot


*** Test Cases ***
Authentication

    Open English Course Application
    Wait until page contains element    ${HOME-DETAIL1}
    Wait until page contains element    ${HOME-DETAIL2}
    Wait until page contains element    ${HOME-DETAIL3}
    Wait until page contains element    ${HOME-DETAIL4}
    Wait until page contains element    ${HOME-DETAIL5}
    Wait until page contains element    ${HOME-NEXT}
    Intro Page
    Wait until page contains element    ${LOGIN-EMAIL-FIELD}
    Signin with user    ${USER1-DETAILS}[email]     ${USER1-DETAILS}[password]
    Logout with user (CANCEL)
    Logout with user (OK)