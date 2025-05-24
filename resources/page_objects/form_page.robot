*** Settings ***
Resource        ../keywords.robot
Library         Dialogs

*** Variables ***
${Forms_Card}    xpath=//div[@class="card mt-4 top-card"]//h5[text()="Forms"]
${Form}          xpath=//li[@id="item-0"]//span[text()="Practice Form"]
${Title}         xpath=//h1[@class="text-center"][text()="Practice Form"]
${First_Name}    id=firstName
${Last_Name}     id=lastName
${Email}         id=userEmail
@{Genders}    id=gender-radio-1    id=gender-radio-2    id=gender-radio-3
${Mobile_Number}    id=userNumber
${Date_Birth}   id=dateOfBirthInput
${Subjects}     xpath=//div[@id="subjectsContainer"]//input
@{Hobbies}      id=hobbies-checkbox-1    id=hobbies-checkbox-2    id=hobbies-checkbox-3
${Picture}      id=uploadPicture
${Address}      id=currentAddress
${State}        id=state
${City}         id=city
${Submit}       id=submit

*** Keywords ***
Abrir Formulario
    Abrir Browser
    Wait For Elements State    ${Forms_Card}   visible
    Click                      ${Forms_Card}
    ${URL}=             Get Url
    Should Be Equal    ${URL}    https://demoqa.com/forms
    Wait For Elements State    ${Form}   visible
    Click                      ${Form}
    ${URL}=             Get Url
    Should Be Equal    ${URL}    https://demoqa.com/automation-practice-form
    Wait For Elements State    ${Title}   visible
    Pause Execution

Preencher Formulario
    Wait For Elements State    ${First_Name}   visible
    Wait For Elements State    ${Last_Name}   visible
    Wait For Elements State    ${Email}   visible
    
    FOR     ${gender}     IN      @{Genders}
        Wait For Elements State    ${gender}  visible
    END
    
    Wait For Elements State    ${Mobile_Number}   visible
    Wait For Elements State    ${Date_Birth}   visible
    Wait For Elements State    ${Subjects}   visible
    
    FOR     ${hobby}     IN     @{Hobbies}
        Wait For Elements State    ${hobby}  visible
    END

    Wait For Elements State    ${Picture}   visible
    Wait For Elements State    ${Address}   visible
    Wait For Elements State    ${State}   visible
    Wait For Elements State    ${City}   visible
    Wait For Elements State    ${Submit}   visible

    Fill Text        ${First_Name}     Teste
    Fill Text        ${Last_Name}      Teste
    Fill Text        ${Email}          test@email.com
    Click            xpath=//label[@for="gender-radio-1"]
    Fill Text    ${Mobile_Number}    1234567890
    Click            ${Date_Birth}
    Select Options By    xpath=//select[contains(@class,"react-datepicker__year-select")]        value        2004
    Select Options By    xpath=//select[contains(@class,"react-datepicker__month-select")]        value        0
    Click    xpath=//div[contains(@class,"react-datepicker__day") and text()="9" and not(contains(@class,"--outside-month"))]
    Fill Text        ${Subjects}         Computer
    Click    xpath=//div[contains(@id,"react-select") and contains(@class,"option") and text()="Computer Science"]   
    Click    xpath=//label[@for="hobbies-checkbox-3"]
    Fill Text    ${Address}    Teste
    Click    ${State}
    Click    xpath=//div[contains(@id,"react-select") and contains(@class,"option") and text()="NCR"]
    Click    ${City}
    Click    xpath=//div[contains(@id,"react-select") and contains(@class,"option") and text()="Delhi"]
    Click    ${Submit}
    Wait For Elements State    xpath=//div[@class="modal-content"]   visible
    Pause Execution