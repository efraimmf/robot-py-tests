*** Settings ***
Library           Browser

*** Variables ***
${BROWSER}        chromium
${URL}            https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

*** Keywords ***
Abrir Browser
    New Browser    ${BROWSER}     headless=false
    New Page       ${URL}         wait_until=domcontentloaded