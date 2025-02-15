*** Settings ***
Resource    ../resources/resources.robot
Suite Setup    Open app
Suite Teardown    Close Application

*** Test Cases ***
Register with all fields filled in
    # Go to register page
    Go to register
    Verify Register page
    # Fill in info
    Fill in info to register    ${USER1}[name]    ${USER1}[phone]    ${USER1}[email]    ${USER1}[password]
    # Info should appear at field
    Check info at field to register    ${USER1}[name]    ${USER1}[phone]    ${USER1}[email]    ••••••
    # Verify success 
    Submit to register 
    Wait Until Page Contains    Registration Successful 
    Page Should Contain Text    Registration Successful
    Go to login at register

Register with only name filled in
    # Go to register page
    Go to register
    Verify Register page
    # Fill in info
    Fill in info to register    ${USER2}[name]    ${EMPTY}    ${EMPTY}    ${EMPTY}
    # Info should appear at field
    Check info at field to register    ${USER2}[name]    Phone number    Gmail    Password 
    # Verify message 
    Submit to register 
    Wait Until Page Contains    Please fill all the details 
    Page Should Contain Text    Please fill all the details
    Go to login at register

Register with only phone filled in
    # Go to register page
    Go to register
    Verify Register page
    # Fill in info
    Fill in info to register    ${EMPTY}    ${USER2}[phone]    ${EMPTY}    ${EMPTY}
    # Info should appear at field
    Check info at field to register    Name    ${USER2}[phone]    Gmail    Password 
    # Verify message
    Submit to register 
    Wait Until Page Contains    Please fill all the details 
    Page Should Contain Text    Please fill all the details
    Go to login at register

Register with only email filled in
    # Go to register page
    Go to register
    Verify Register page
    # Fill in info
    Fill in info to register    ${EMPTY}    ${EMPTY}    ${USER2}[email]    ${EMPTY}
    # Info should appear at field
    Check info at field to register    Name    Phone number    ${USER2}[email]    Password 
    # Verify message 
    Submit to register 
    Wait Until Page Contains    Please fill all the details 
    Page Should Contain Text    Please fill all the details
    Go to login at register

Register with only password filled in
    # Go to register page
    Go to register
    Verify Register page
    # Fill in info
    Fill in info to register    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${USER2}[password]
    # Info should appear at field
    Check info at field to register    Name    Phone number    Gmail    •••••••
    # Verify message
    Submit to register 
    Wait Until Page Contains    Please fill all the details 
    Page Should Contain Text    Please fill all the details
    Go to login at register

Register withou name filled in
    # Go to register page
    Go to register
    Verify Register page
    # Fill in info
    Fill in info to register    ${EMPTY}    ${USER2}[phone]    ${USER2}[email]    ${USER2}[password]
    # Info should appear at field
    Check info at field to register    Name    ${USER2}[phone]    ${USER2}[email]    •••••••
    # Verify message
    Submit to register 
    Wait Until Page Contains    Please fill all the details 
    Page Should Contain Text    Please fill all the details
    Go to login at register

Register without phone filled in
    # Go to register page
    Go to register
    Verify Register page
    # Fill in info
    Fill in info to register    ${USER2}[name]    ${EMPTY}    ${USER2}[email]    ${USER2}[password]
    # Info should appear at field
    Check info at field to register    ${USER2}[name]    Phone number    ${USER2}[email]    •••••••
    # Verify message
    Submit to register 
    Wait Until Page Contains    Please fill all the details 
    Page Should Contain Text    Please fill all the details
    Go to login at register

Register without email filled in
    # Go to register page
    Go to register
    Verify Register page
    # Fill in info
    Fill in info to register    ${USER2}[name]    ${USER2}[phone]    ${EMPTY}    ${USER2}[password]
    # Info should appear at field
    Check info at field to register    ${USER2}[name]    ${USER2}[phone]    Gmail    •••••••
    # Verify message
    Submit to register 
    Wait Until Page Contains    Please fill all the details 
    Page Should Contain Text    Please fill all the details
    Go to login at register

Register without password filled in
    # Go to register page
    Go to register
    Verify Register page
    # Fill in info
    Fill in info to register    ${USER2}[name]    ${USER2}[phone]    ${USER2}[email]    ${EMPTY}
    # Info should appear at field
    Check info at field to register    ${USER2}[name]    ${USER2}[phone]    ${USER2}[email]    Password 
    # Verify message
    Submit to register 
    Wait Until Page Contains    Please fill all the details 
    Page Should Contain Text    Please fill all the details
    Go to login at register

Register with only name and phone filled in
    # Go to register page
    Go to register
    Verify Register page
    # Fill in info
    Fill in info to register    ${USER2}[name]    ${USER2}[phone]    ${EMPTY}    ${EMPTY}
    # Info should appear at field
    Check info at field to register    ${USER2}[name]    ${USER2}[phone]    Gmail    Password 
    # Verify message
    Submit to register 
    Wait Until Page Contains    Please fill all the details 
    Page Should Contain Text    Please fill all the details
    Go to login at register

Register with only phone and email filled in
    # Go to register page
    Go to register
    Verify Register page
    # Fill in info
    Fill in info to register    ${EMPTY}    ${USER2}[phone]    ${USER2}[email]    ${EMPTY}
    # Info should appear at field
    Check info at field to register    Name    ${USER2}[phone]    ${USER2}[email]    Password 
    # Verify message 
    Submit to register 
    Wait Until Page Contains    Please fill all the details 
    Page Should Contain Text    Please fill all the details
    Go to login at register

Register with only email and password filled in
    # Go to register page
    Go to register
    Verify Register page
    # Fill in info
    Fill in info to register    ${EMPTY}    ${EMPTY}    ${USER2}[email]    ${USER2}[password]
    # Info should appear at field
    Check info at field to register    Name    Phone number   ${USER2}[email]    ••••••• 
    # Verify message 
    Submit to register 
    Wait Until Page Contains    Please fill all the details 
    Page Should Contain Text    Please fill all the details
    Go to login at register

Register with only name and password filled in
    # Go to register page
    Go to register
    Verify Register page
    # Fill in info
    Fill in info to register    ${USER2}[name]    ${EMPTY}    ${EMPTY}    ${USER2}[password]
    # Info should appear at field
    Check info at field to register    ${USER2}[name]    Phone number   Gmail    ••••••• 
    # Verify message
    Submit to register 
    Wait Until Page Contains    Please fill all the details 
    Page Should Contain Text    Please fill all the details
    Go to login at register

Register with only name and email filled in
    # Go to register page
    Go to register
    Verify Register page
    # Fill in info
    Fill in info to register    ${USER2}[name]    ${EMPTY}    ${USER2}[email]    ${EMPTY}
    # Info should appear at field
    Check info at field to register    ${USER2}[name]    Phone number    ${USER2}[email]    Password 
    # Verify message 
    Submit to register 
    Wait Until Page Contains    Please fill all the details 
    Page Should Contain Text    Please fill all the details
    Go to login at register

Register with only phone and password filled in
    # Go to register page
    Go to register
    Verify Register page
    # Fill in info
    Fill in info to register    ${EMPTY}    ${USER2}[phone]    ${EMPTY}    ${USER2}[password]
    # Info should appear at field
    Check info at field to register    Name    ${USER2}[phone]   Gmail    ••••••• 
    # Verify message
    Submit to register 
    Wait Until Page Contains    Please fill all the details 
    Page Should Contain Text    Please fill all the details
    Go to login at register

Register when at Landscape
    # Go to register page
    Go to register
    # Change to Landscape
    Landscape
    Sleep    2
    Register valid account
    # Verify success 
    Submit to register at Landscape
    Wait Until Page Contains    Registration Successful 
    Page Should Contain Text    Registration Successful
    Portrait
    Sleep    2
    Go to login at register
    

Register when at Airplane mode
    # Turn on airplane mode
    Set Network Connection Status    1
    # Go to register page
    Go to register
    Sleep    2
    Register valid account
    # Verify success 
    Submit to register at Landscape
    Wait Until Page Contains    Registration Successful 
    Page Should Contain Text    Registration Successful
    Sleep    2
    Go to login at register
    Set Network Connection Status    0


Register with all fields are empty
    # Go to register page
    Go to register
    Verify Register page
    # Verify message
    Submit to register 
    Wait Until Page Contains    Please fill all the details 
    Page Should Contain Text    Please fill all the details
    Go to login at register

Register with name containing special characters
    # Go to register page
    Go to register
    Verify Register page
    # Fill in info
    Fill in info to register    !@#$%^&*    ${USER2}[phone]    ${USER2}[email]    ${USER2}[password]
    # Info should appear at field
    Check info at field to register    !@#$%^&*    ${USER2}[phone]    ${USER2}[email]    •••••••
    # Verify success 
    Submit to register 
    Wait Until Page Contains    Registration Successful 
    Page Should Contain Text    Registration Successful
    Go to login at register
    Fail    Name is containing special characters. Register should not working when name contains special characters.

Register with duplicate email
    # Go to register page
    Go to register
    Verify Register page
    # Fill in info
    Fill in info to register    ${USER1}[name]    ${USER1}[phone]    ${USER1}[email]    ${USER1}[password]
    # Info should appear at field
    Check info at field to register    ${USER1}[name]    ${USER1}[phone]    ${USER1}[email]    ••••••
    # Verify success 
    Submit to register 
    Wait Until Page Contains    Registration Successful 
    Page Should Contain Text    Registration Successful
    Go to login at register
    # Go to register page
    Go to register
    Verify Register page
    # Fill in info
    Fill in info to register    ${USER2}[name]    ${USER2}[phone]    ${USER1}[email]    ${USER2}[password]
    # Info should appear at field
    Check info at field to register    ${USER2}[name]    ${USER2}[phone]    ${USER1}[email]    •••••••
    # Verify success 
    Submit to register 
    Wait Until Page Contains    Registration Successful 
    Page Should Contain Text    Registration Successful
    Go to login at register
    Fail    Email is duplicated (already registered). Register should not working when email is already registered.

Register with invalid email
    # Go to register page
    Go to register
    Verify Register page
    # Fill in info
    Fill in info to register    ${USER2}[name]    ${USER2}[phone]    abc123abc    ${USER2}[password]
    # Info should appear at field
    Check info at field to register    ${USER2}[name]    ${USER2}[phone]    abc123abc    •••••••
    # Verify success 
    Submit to register 
    Wait Until Page Contains    Registration Successful 
    Page Should Contain Text    Registration Successful
    Go to login at register
    Fail    Email is invalid (not contain @). Register should not working when email is invalid.

Register with invalid phone
    # Go to register page
    Go to register
    Verify Register page
    # Fill in info 
    Fill in info to register    ${USER2}[name]    aaaaaaaaa    ${USER2}[email]    ${USER2}[password]
    # Info should appear at field, phone field should not contain any inputs are letter
    Check info at field to register    ${USER2}[name]    aaaaaaaaa    ${USER2}[email]    •••••••
    # Verify success 
    Submit to register 
    Wait Until Page Contains    Registration Successful 
    Page Should Contain Text    Registration Successful
    Go to login at register
    Fail    Phone number is invalid (contain letters). Register should not working when phone number is invalid.

#################################### Security Test ####################################
Register with SQL Injection
    # Go to register page
    Go to register
    Verify Register page
    # Fill in info
    Fill in info to register    ' OR 1=1; --    ${USER2}[phone]    ${USER2}[email]    ${USER2}[password]
    # Info should appear at field
    Check info at field to register    ' OR 1=1; --    ${USER2}[phone]    ${USER2}[email]    •••••••
    # Verify success 
    Submit to register 
    Wait Until Page Contains    Registration Successful 
    Page Should Contain Text    Registration Successful
    Go to login at register
    Fail    SQL Injection is possible. Register should not working when SQL Injection is detected.

Register with Cross Site Scripting
    # Go to register page
    Go to register
    Verify Register page
    # Fill in info
    Fill in info to register    <script>alert('XSS')</script>    ${USER2}[phone]    ${USER2}[email]    ${USER2}[password]
    # Info should appear at field
    Check info at field to register    <script>alert('XSS')</script>    ${USER2}[phone]    ${USER2}[email]    •••••••
    # Verify success 
    Submit to register 
    Wait Until Page Contains    Registration Successful 
    Page Should Contain Text    Registration Successful
    Go to login at register
    Fail    Cross Site Scripting is possible. Register should not working when Cross Site Scripting is detected.

Register with Remote Code Execution
    # Go to register page
    Go to register
    Verify Register page
    # Fill in info
    Fill in info to register    `ls`    ${USER2}[phone]    ${USER2}[email]    ${USER2}[password]
    # Info should appear at field
    Check info at field to register    `ls`    ${USER2}[phone]    ${USER2}[email]    •••••••
    # Verify success 
    Submit to register 
    Wait Until Page Contains    Registration Successful 
    Page Should Contain Text    Registration Successful
    Go to login at register
    Fail    Remote Code Execution is possible. Register should not working when Remote Code Execution is detected.



