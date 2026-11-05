*** Settings ***
Documentation       Login no My Demo App (Android e iOS).
Resource            ../resources/base.resource
Test Setup          Abrir o app
Test Teardown       Fechar o app
Test Timeout        6 minutes
Test Tags           login


*** Test Cases ***
Login com usuário válido volta para o catálogo
    [Tags]    smoke
    Fazer login    ${USUARIO_PADRAO}    ${SENHA_VALIDA}
    Aguardar o catálogo

Usuário bloqueado não consegue entrar
    Fazer login    ${USUARIO_BLOQUEADO}    ${SENHA_VALIDA}
    Deve exibir o texto    Sorry, this user has been locked out.

Login inválido exibe mensagem de erro
    [Template]    Validar mensagem de erro do login
    ${USUARIO_PADRAO}       senha_errada       Provided credentials do not match any user in this service.
    ${EMPTY}                ${SENHA_VALIDA}    Username is required
    ${USUARIO_PADRAO}       ${EMPTY}           Password is required


*** Keywords ***
Validar mensagem de erro do login
    [Arguments]    ${usuario}    ${senha}    ${mensagem}
    Fazer login    ${usuario}    ${senha}
    Deve exibir o texto    ${mensagem}
    Fechar o app
    Abrir o app
