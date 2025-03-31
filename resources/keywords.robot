*** Settings ***
Library           Browser

*** Variables ***
${BROWSER}        chromium
${URL}           https://demoqa.com/

*** Keywords ***
Abrir Browser
    New Browser    ${BROWSER}     headless=false
    New Page       ${URL}         wait_until=domcontentloaded