*** Settings ***
Resource       ../keywords.robot
Library        Dialogs

*** Variables ***
${Alerts_Card}    xpath=//div[@class="card mt-4 top-card"]//h5[text()="Alerts, Frame & Windows"]
${Browser_Windows}    xpath=//li[@id="item-0"]//span[text()="Browser Windows"]
${New_Tab_Button}        id=tabButton

*** Keywords ***
Nova Aba
    Abrir Browser
    Wait For Elements State    ${Alerts_Card}   visible
    Click                      ${Alerts_Card}
    ${URL}=             Get Url
    Should Be Equal    ${URL}    https://demoqa.com/alertsWindows
    Wait For Elements State    ${Browser_Windows}   visible
    Click                      ${Browser_Windows}
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