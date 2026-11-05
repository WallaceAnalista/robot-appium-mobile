*** Settings ***
Documentation       Navegação específica do Android: menu lateral (drawer) e carrinho no cabeçalho.
Library             AppiumLibrary


*** Keywords ***
Abrir o menu
    Tocar em    open menu

Abrir o carrinho
    Tocar em    cart badge
