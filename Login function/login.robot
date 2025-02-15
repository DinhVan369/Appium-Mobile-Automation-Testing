*** Settings ***
Resource    ../resources/resources.robot
Suite Setup    Open app
Suite Teardown    Close Application
*** Variables ***
&{USER1_UPPERCASE}    email=DINHVAN@GMAIL.COM    password=VAN123
&{USER1_LOWERCASE}    email=dinhvan@gmail.com    password=van123
&{USER1_SC}    email=Dinhv#n@gmail.com    password=V#n123

*** Test Cases ***
Login with valid username and password
    # Go to register to register a valid account (user1)
    Go to register
    # Register a valid account for later usage
    Register valid account
    Submit to register
    # Back to login page
    Go to login at register
    Verify Login page
    # Login with valid username and password
    Fill in info to login    ${USER1}[email]    ${USER1}[password]
    Check info at field to login    ${USER1}[email]    ••••••
    Submit to login
    # Verify message
    Wait Until Page Contains    Login sucess
    Page Should Contain Text    Login sucess
    # verify login complete
    Verify login complete page
    Go Back
    Clear login input

Login with not filled anything
    # Login with not filled anything
    Check info at field to login    Email    Password
    Submit to login
    # Verify message
    Wait Until Page Contains    ${LOGIN_INPUT_MESSAGE}
    Page Should Contain Text    ${LOGIN_INPUT_MESSAGE}

Login with not filled password
    # Login with not filled password
    Fill in info to login    ${USER1}[email]    ${EMPTY}
    Check info at field to login    ${USER1}[email]    Password
    Submit to login
    # Verify message
    Wait Until Page Contains    ${LOGIN_INPUT_MESSAGE}
    Page Should Contain Text    ${LOGIN_INPUT_MESSAGE}

Login with not filled email
    # Login with not filled email
    Fill in info to login    ${EMPTY}    ${USER1}[password]
    Check info at field to login    Email    ••••••
    Submit to login
    # Verify message
    Wait Until Page Contains    ${LOGIN_INPUT_MESSAGE}
    Page Should Contain Text    ${LOGIN_INPUT_MESSAGE}

Login with valid email but wrong password
    # Login with valid username but wrong password
    Fill in info to login    ${USER1}[email]    ${USER2}[password]
    Check info at field to login    ${USER1}[email]    •••••••
    Submit to login
    # Verify message
    Wait Until Page Contains    ${LOGIN_ERROR}
    Page Should Contain Text    ${LOGIN_ERROR}

Login with invalid email but correct password
    # Login with invalid username but correct password
    Fill in info to login    ${USER2}[email]    ${USER1}[password]
    Check info at field to login    ${USER2}[email]    ••••••
    Submit to login
    # Verify message
    Wait Until Page Contains    ${LOGIN_ERROR}
    Page Should Contain Text    ${LOGIN_ERROR}

Login with invalid email and password
    # Login with invalid username and password
    Fill in info to login    ${USER2}[email]    ${USER2}[password]
    Check info at field to login    ${USER2}[email]    •••••••
    Submit to login
    # Verify message
    Wait Until Page Contains    ${LOGIN_ERROR} 
    Page Should Contain Text    ${LOGIN_ERROR}

Login with uppercase email
    # Login with uppercase email
    Fill in info to login    ${USER1_UPPERCASE}[email]    ${USER1}[password]
    Check info at field to login    ${USER1_UPPERCASE}[email]    ••••••
    Submit to login
    # Verify message
    Wait Until Page Contains    ${LOGIN_ERROR}
    Page Should Contain Text    ${LOGIN_ERROR}

Login with upercase password
    # Login with uppercase password
    Fill in info to login    ${USER1}[email]    ${USER1_UPPERCASE}[password]
    Check info at field to login    ${USER1}[email]    ••••••
    Submit to login
    # Verify message
    Wait Until Page Contains    ${LOGIN_ERROR}
    Page Should Contain Text    ${LOGIN_ERROR}

Login with lowercase email
    # Login with lowercase email
    Fill in info to login    ${USER1_LOWERCASE}[email]    ${USER1}[password]
    Check info at field to login    ${USER1_LOWERCASE}[email]    ••••••
    Submit to login
    # Verify message
    Wait Until Page Contains    ${LOGIN_ERROR}
    Page Should Contain Text    ${LOGIN_ERROR}

Login with lowercase password
    # Login with lowercase password
    Fill in info to login    ${USER1}[email]    ${USER1_LOWERCASE}[password]
    Check info at field to login    ${USER1}[email]    ••••••
    Submit to login
    # Verify message
    Wait Until Page Contains    ${LOGIN_ERROR}
    Page Should Contain Text    ${LOGIN_ERROR}


Login when at Landscape
    # Login when at Landscape
    Landscape
    Fill in info to login    ${USER1}[email]    ${USER1}[password]
    Check info at field to login    ${USER1}[email]    ••••••
    Submit to login
    # Verify message
    Wait Until Page Contains    Login sucess
    Page Should Contain Text    Login sucess
    # verify login complete
    Verify login complete page at Landscape
    Portrait
    Go Back
    Clear login input

Login when at Airplane mode
    # Login when at Airplane mode
    Set Network Connection Status    1
    Sleep    2
    Fill in info to login    ${USER1}[email]    ${USER1}[password]
    Check info at field to login    ${USER1}[email]    ••••••
    Submit to login
    # Verify message
    Wait Until Page Contains    Login sucess
    Page Should Contain Text    Login sucess
    # verify login complete
    Verify login complete page
    Go Back
    Clear login input
    Set Network Connection Status    0

########################################## Security Test ##########################################
Login with SQL Injection
    # Login with SQL Injection
    Fill in info to login    ' OR 1=1; --    ' OR 1=1; --
    Check info at field to login    ' OR 1=1; --    ••••••••••••
    Submit to login
    # Verify message
    Wait Until Page Contains    ${LOGIN_ERROR}
    Page Should Contain Text    ${LOGIN_ERROR}

Login with Cross Site Scripting
    # Login with XSS
    Fill in info to login    <script>alert('XSS')</script>    <script>alert('XSS')</script>
    Check info at field to login    <script>alert('XSS')</script>    •••••••••••••••••••••••••••••
    Submit to login
    # Verify message
    Wait Until Page Contains    ${LOGIN_ERROR}
    Page Should Contain Text    ${LOGIN_ERROR}

Login with Remote Code Execution
    # Login with RCE
    Fill in info to login    `ls`    `ls`
    Check info at field to login    `ls`    ••••
    Submit to login
    # Verify message
    Wait Until Page Contains    ${LOGIN_ERROR}
    Page Should Contain Text    ${LOGIN_ERROR}
