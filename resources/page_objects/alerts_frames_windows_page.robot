*** Settings ***
Resource       ../keywords.robot
Library        Dialogs

*** Variables ***
${Alerts_Card}    xpath=//div[@class="card mt-4 top-card"]//h5[text()="Alerts, Frame & Windows"]
${Browser_Windows}    xpath=//li[@id="item-0"]//span[text()="Browser Windows"]
${New_Tab_Button}        id=tabButton
${New_Window_Button}      id=windowButton
${New_Message_Window_Button}    id=messageWindowButton

*** Keywords ***
Abrir Browser Windows Testes
    Abrir Browser
    Wait For Elements State    ${Alerts_Card}   visible
    Click                      ${Alerts_Card}
    ${URL}=             Get Url
    Should Be Equal    ${URL}    https://demoqa.com/alertsWindows
    Wait For Elements State    ${Browser_Windows}   visible
    Click                      ${Browser_Windows}
    Pause Execution

Nova Aba
    Abrir Browser Windows Testes
    Wait For Elements State    ${New_Tab_Button}   visible
    ${Old_Pages_Ids}=    Get Page Ids
    Click    ${New_Tab_Button}
    Sleep    1s
    ${New_Pages_Ids}=    Get Page Ids
    
    FOR     ${page}     IN     @{New_Pages_Ids}
        Run Keyword If  '${page}' not in @{Old_Pages_Ids}    Set Test Variable     ${New_Tab}    ${page}
    END
    
    Switch Page      ${New_Tab}
    ${New_Tab_URL}=    Get Url
    Should Be Equal    ${New_Tab_URL}    https://demoqa.com/sample
    Wait For Elements State    id=sampleHeading       visible
    Pause Execution

Nova Janela
    Abrir Browser Windows Testes
    Wait For Elements State    ${New_Window_Button}   visible
    ${Old_Pages_Ids}=   Get Page Ids
    Click   ${New_Window_Button}
    Sleep   1s
    ${New_Pages_Ids}=   Get Page Ids

    FOR     ${page}     IN     @{New_Pages_Ids}
        Run Keyword If  '${page}' not in @{Old_Pages_Ids}    Set Test Variable     ${New_Window}    ${page}
    END

    Switch Page      ${New_Window}
    ${New_Window_URL}=    Get Url
    Should Be Equal    ${New_Window_URL}    https://demoqa.com/sample
    Wait For Elements State    id=sampleHeading       visible
    Pause Execution

Nova Janela de Mensagem
    Abrir Browser Windows Testes
    Wait For Elements State    ${New_Message_Window_Button}   visible
    ${Old_Pages_Ids}=   Get Page Ids
    Click    ${New_Message_Window_Button}
    Sleep    1s
    ${New_Pages_Ids}=   Get Page Ids

    FOR     ${page}     IN     @{New_Pages_Ids}
        Run Keyword If  '${page}' not in @{Old_Pages_Ids}    Set Test Variable     ${New_Message_Window}    ${page}
    END

    Switch Page      ${New_Message_Window}
    ${New_Message_Window_URL}=    Get Url
    Should Be Equal    ${New_Message_Window_URL}    about:blank
    ${texto}=    Get Text    css=body
    Should Contain    ${texto}    Knowledge increases by sharing but not by saving. Please share this website with your friends and in your organization.
    Pause Execution