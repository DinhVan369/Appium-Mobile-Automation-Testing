*** Settings ***
Library    AppiumLibrary

*** Variables ***
&{USER1}    email=Dinhvan@gmail.com    password=Van123    name=Truong Dinh Van    phone=0171728446
&{USER2}    email=quangdang@gmail.com    password=dang123    name= Tran Quang Dang    phone=017171728409
${APP_URL}    http://192.168.1.15:4723
${REGISTER}    com.example.vamsi.login:id/tvRegister
${LOGIN_EMAIL}    com.example.vamsi.login:id/etLogGmail
${LOGIN_PASSWORD}    com.example.vamsi.login:id/etLoginPassword
${LOGIN_BUTTON}    com.example.vamsi.login:id/btnLogin
${REGISTER_LINK}    com.example.vamsi.login:id/tvRegister
${REGISTER_NAME}    com.example.vamsi.login:id/etRegName
${REGISTER_PHONE}    com.example.vamsi.login:id/etRegPhone
${REGISTER_GMAIL}    com.example.vamsi.login:id/etRegGmail
${REGISTER_PASSWORD}    com.example.vamsi.login:id/etRegPassword
${REGISTER_BUTTON}    com.example.vamsi.login:id/btnRegLogin
${REGISTER_LOGIN}    com.example.vamsi.login:id/btnGotoLogin
${MESSAGE}    android.widget.Toast
${LOGIN_INPUT_MESSAGE}    Enter your Email and Password to login
${LOGIN_ERROR}    Login error
*** Keywords ***
Open app
    Open Application    ${APP_URL}    platformName=android    platformVersion=14    deviceName=emulator-5554    
    ...    appPackage=com.example.vamsi.login    appActivity=com.example.vamsi.login.MainActivity    automationName=UiAutomator2

Verify Login page
    Wait Until Element Is Visible    //android.widget.TextView[@text="Login"]
    # Verify title 
    Page Should Contain Element    //android.widget.TextView[@text="Login"]
    Element Text Should Be    //android.widget.TextView[@text="Login"]    Login
    # Verify email and password field
    Page Should Contain Element    ${LOGIN_EMAIL}
    Element Text Should Be    ${LOGIN_EMAIL}    Email
    Page Should Contain Element    ${LOGIN_PASSWORD}
    Element Text Should Be    ${LOGIN_PASSWORD}    Password
    # Verify login button
    Page Should Contain Element    ${LOGIN_BUTTON}
    Element Text Should Be    ${LOGIN_BUTTON}    Login
    # Verify register link
    Page Should Contain Element    ${REGISTER_LINK}
    Element Text Should Be    ${REGISTER_LINK}    New User? Register

Verify Register page
    Wait Until Element Is Visible    //android.widget.TextView[@text="Registration"]    
    # Verify title 
    Page Should Contain Element    //android.widget.TextView[@text="Registration"]
    Element Text Should Be    //android.widget.TextView[@text="Registration"]    Registration
    # Verify name, phone, email, password fields
    Page Should Contain Element    ${REGISTER_NAME}
    Element Text Should Be    ${REGISTER_NAME}    Name
    Page Should Contain Element    ${REGISTER_PHONE}
    Element Text Should Be    ${REGISTER_PHONE}    Phone number
    Page Should Contain Element    ${REGISTER_GMAIL}
    Element Text Should Be    ${REGISTER_GMAIL}    Gmail
    Page Should Contain Element    ${REGISTER_PASSWORD}
    Element Text Should Be    ${REGISTER_PASSWORD}    Password
    # Verify register button, login button
    Page Should Contain Element    ${REGISTER_BUTTON}
    Element Text Should Be    ${REGISTER_BUTTON}    Register
    Page Should Contain Element    ${REGISTER_LOGIN}
    Element Text Should Be    ${REGISTER_LOGIN}    Login
    
Fill in info to register
    [Arguments]    ${name}    ${phone}    ${email}    ${password}
    Wait Until Element Is Visible    ${REGISTER_NAME}
    Input Text    ${REGISTER_NAME}    ${name}
    Input Text    ${REGISTER_PHONE}    ${phone}
    Input Text    ${REGISTER_GMAIL}    ${email}
    Input Text    ${REGISTER_PASSWORD}    ${password}

Check info at field to register
    [Arguments]    ${name}    ${phone}    ${email}    ${password}
    Wait Until Element Is Visible    ${REGISTER_NAME}
    Element Text Should Be    ${REGISTER_NAME}    ${name}
    Element Text Should Be    ${REGISTER_PHONE}    ${phone}
    Element Text Should Be    ${REGISTER_GMAIL}    ${email}
    Element Attribute Should Match    ${REGISTER_PASSWORD}    password    true
    Element Text Should Be    ${REGISTER_PASSWORD}    ${password}

Go to register
    Wait Until Element Is Visible    ${REGISTER}
    Click Element    ${REGISTER}
    Sleep    2
    
Go to login at register
    Wait Until Element Is Visible    ${REGISTER_LOGIN}
    Click Element    ${REGISTER_LOGIN}
    Sleep    2

Submit to login
    Wait Until Element Is Visible    ${LOGIN_BUTTON}
    Click Element    ${LOGIN_BUTTON}
    Sleep    2

Submit to register
    Wait Until Element Is Visible    ${REGISTER_BUTTON}
    Click Element    ${REGISTER_BUTTON}
    Sleep    2

Register valid account
    Sleep    2
    Fill in info to register    ${USER1}[name]    ${USER1}[phone]    ${USER1}[email]    ${USER1}[password]

Submit to register at Landscape
    Swipe    1000    900    1000    300  
    Wait Until Element Is Visible    ${REGISTER_BUTTON}
    Click Element    ${REGISTER_BUTTON}
    Sleep    2

Go to login at register at Landscape
    Swipe    1000    900    1000    300 
    Wait Until Element Is Visible    ${REGISTER_LOGIN}
    Click Element    ${REGISTER_LOGIN}
    Sleep    2

Fill in info to login
    [Arguments]    ${email}    ${password}
    Wait Until Element Is Visible    ${LOGIN_EMAIL}
    Wait Until Element Is Visible    ${LOGIN_PASSWORD}
    Input Text    ${LOGIN_EMAIL}    ${email}
    Input Text    ${LOGIN_PASSWORD}    ${password}

Check info at field to login
    [Arguments]    ${email}    ${password}
    Wait Until Element Is Visible    ${LOGIN_EMAIL}
    Wait Until Element Is Visible    ${LOGIN_PASSWORD}
    Element Attribute Should Match    ${LOGIN_PASSWORD}    password    true
    Element Text Should Be    ${LOGIN_EMAIL}    ${email}
    Element Text Should Be    ${LOGIN_PASSWORD}    ${password}

Verify login complete page
    Wait Until Element Is Visible    //android.widget.TextView[@text="Login"]
    # Verify title 
    Page Should Contain Element    //android.widget.TextView[@text="Login"]
    Element Text Should Be    //android.widget.TextView[@text="Login"]    Login
    # Verify message
    Page Should Contain Element    //android.widget.TextView[@text="You are now logged in"]
    Element Text Should Be    //android.widget.TextView[@text="You are now logged in"]    You are now logged in

Verify login complete page at Landscape
    Wait Until Element Is Visible    //android.widget.TextView[@text="Login"]
    # Verify title 
    Page Should Contain Element    //android.widget.TextView[@text="Login"]
    Element Text Should Be    //android.widget.TextView[@text="Login"]    Login
    Swipe    1000    900    1000    300 
    # Verify message
    Page Should Contain Element    //android.widget.TextView[@text="You are now logged in"]
    Element Text Should Be    //android.widget.TextView[@text="You are now logged in"]    You are now logged in

Clear login input
    Wait Until Element Is Visible    ${LOGIN_EMAIL}
    Wait Until Element Is Visible    ${LOGIN_PASSWORD}
    Clear Text    ${LOGIN_EMAIL}
    Clear Text    ${LOGIN_PASSWORD}