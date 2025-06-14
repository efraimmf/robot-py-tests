*** Settings ***
Resource       ../keywords.robot
Library        Dialogs

*** Variables ***
${Book_Store_Card}    xpath=//div[@class="card mt-4 top-card"]//h5[text()="Book Store Application"]
${Search_Book}    id=searchBox
${Book}    id=see-book-Understanding ECMAScript 6

*** Keywords ***
Abrir Book Store Testes
    Abrir Browser
    Wait For Elements State    ${Book_Store_Card}   visible
    Click                      ${Book_Store_Card}
    ${URL}=             Get Url
    Should Be Equal    ${URL}    https://demoqa.com/books
    Pause Execution

Book Store
    Abrir Book Store Testes
    Wait For Elements State    ${Search_Book}   visible
    Fill Text    ${Search_Book}    Understanding ECMAScript 6
    Wait For Elements State    ${Book}   visible
    Click    ${Book}
    ${Book_URL}=    Get Url
    Should Be Equal    ${Book_URL}    https://demoqa.com/books?book=9781593277574
    Pause Execution