*** Settings ***
Documentation       Navegação específica do Android: menu lateral (drawer) e carrinho no cabeçalho.


*** Keywords ***
Abrir o menu
    Tocar em    open menu

Abrir o carrinho
    Tocar em    cart badge

Esconder o teclado
    Run Keyword And Ignore Error    Hide Keyboard
