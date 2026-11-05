*** Settings ***
Documentation       Carrinho de compras.


*** Keywords ***
Carrinho deve conter
    [Arguments]    ${produto}    ${quantidade}
    Deve exibir    cart screen
    Deve exibir o texto    ${produto}
    Element Should Contain Text    accessibility_id=total number    ${quantidade}

Remover o primeiro item
    Tocar em    remove item

Carrinho deve estar vazio
    Deve exibir o texto    No Items
    Deve exibir    Go Shopping button
