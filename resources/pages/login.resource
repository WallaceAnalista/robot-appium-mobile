*** Settings ***
Documentation       Tela de login.


*** Variables ***
${USUARIO_PADRAO}       bob@example.com
${USUARIO_BLOQUEADO}    alice@example.com
${SENHA_VALIDA}         10203040


*** Keywords ***
Ir para o login
    Abrir o menu
    Tocar em    menu item log in
    Deve exibir    login screen

Fazer login
    [Arguments]    ${usuario}    ${senha}
    Ir para o login
    IF    $usuario    Preencher    Username input field    ${usuario}
    IF    $senha    Preencher    Password input field    ${senha}
    Hide Keyboard If Visible
    Tocar em    Login button

Hide Keyboard If Visible
    Run Keyword And Ignore Error    Hide Keyboard
