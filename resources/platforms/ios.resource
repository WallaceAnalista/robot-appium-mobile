*** Settings ***
Documentation       Navegação específica do iOS: barra de abas inferior.


*** Keywords ***
Abrir o menu
    Tocar em    tab bar option menu

Abrir o carrinho
    Tocar em    tab bar option cart

Esconder o teclado
    [Documentation]    No iOS o teclado do React Native não tem botão de fechar:
    ...                tocar em "return" tira o foco do campo e fecha o teclado.
    Run Keyword And Ignore Error    Hide Keyboard    key_name=return
