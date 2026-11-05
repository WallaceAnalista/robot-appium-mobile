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
    Esconder o teclado
    Rolar até ver    Login button
    Tocar em    Login button
