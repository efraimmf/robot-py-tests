*** Settings ***
Library           Browser

*** Variables ***
${BROWSER}        chromium

*** Keywords ***
Abrir Browser
    New Browser    ${BROWSER}     headless=false