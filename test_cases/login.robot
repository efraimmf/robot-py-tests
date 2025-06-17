*** Settings ***
Resource    ../resources/page_objects/login_page.robot

*** Test Cases ***
Login com Sucesso
    Login

Login com Erro
    Username Incorreto
    Password Incorreto