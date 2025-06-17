*** Settings ***
Resource        ../keywords.robot
Library           Dialogs

*** Variables ***
${Login_page}=     css=a[href="https://practicetestautomation.com/practice-test-login/"]
${Username}=       id=username
${Password}=       id=password
${Login_button}=   id=submit
${Title}=          xpath=//h1[contains(text(), "Logged In Successfully")]
${Logout_Button}=  css=a.wp-block-button__link.has-very-dark-gray-background-color
${Username_Error}=  id=error

** Keywords ***
Login
    Abrir Browser
    Wait For Elements State    ${Login_page}    visible
    Click    ${Login_page}
    ${URL_Page_Test}=    Get Url
    Should Be Equal As Strings    ${URL_Page_Test}    https://practicetestautomation.com/practice-test-login/
    Wait For Elements State    ${Username}    visible
    Wait For Elements State    ${Password}    visible
    Wait For Elements State    ${Login_button}    visible
    Fill Text    ${Username}    student
    Fill Text    ${Password}    Password123
    Click    ${Login_button}
    ${URL_Login}=    Get Url
    Should Be Equal As Strings    ${URL_Login}    https://practicetestautomation.com/logged-in-successfully/
    Wait For Elements State    ${Title}    visible
    Wait For Elements State    ${Logout_Button}    visible
    Pause Execution

Username Incorreto
    Abrir Browser
    Wait For Elements State    ${Login_page}    visible
    Click    ${Login_page}
    ${URL_Page_Test}=    Get Url
    Should Be Equal As Strings    ${URL_Page_Test}    https://practicetestautomation.com/practice-test-login/
    Wait For Elements State    ${Username}    visible
    Wait For Elements State    ${Password}    visible
    Wait For Elements State    ${Login_button}    visible
    Fill Text    ${Username}    123
    Fill Text    ${Password}    Password123
    Click    ${Login_button}
    Wait For Elements State    ${Username_Error}    visible
    ${Error_Message}=    Get Text    ${Username_Error}
    Should Be Equal As Strings    ${Error_Message}    Your username is invalid!
    Pause Execution

Password Incorreto
    Abrir Browser
    Wait For Elements State    ${Login_page}    visible
    Click    ${Login_page}
    ${URL_Page_Test}=    Get Url
    Should Be Equal As Strings    ${URL_Page_Test}    https://practicetestautomation.com/practice-test-login/
    Wait For Elements State    ${Username}    visible
    Wait For Elements State    ${Password}    visible
    Wait For Elements State    ${Login_button}    visible
    Fill Text    ${Username}    student
    Fill Text    ${Password}    12345678
    Click    ${Login_button}
    Wait For Elements State    ${Username_Error}    visible
    ${Error_Message}=    Get Text    ${Username_Error}
    Should Be Equal As Strings    ${Error_Message}    Your password is invalid!
    Pause Execution