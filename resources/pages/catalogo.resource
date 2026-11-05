*** Settings ***
Documentation       Catálogo de produtos.


*** Keywords ***
Aguardar o catálogo
    Deve exibir    products screen

Ordenar por
    [Documentation]    Opções: nameAsc, nameDesc, priceAsc, priceDesc
    [Arguments]    ${opcao}
    Tocar em    sort button
    Deve exibir    sort modal
    Tocar em    ${opcao}
    Wait Until Page Does Not Contain Element    accessibility_id=sort modal

Primeiro produto deve ser
    [Arguments]    ${nome}
    Wait Until Element Is Visible    accessibility_id=store item text
    ${nomes}=    Get Webelements    accessibility_id=store item text
    ${primeiro}=    Get Text    ${nomes}[0]
    Should Be Equal    ${primeiro}    ${nome}

Abrir o produto
    [Arguments]    ${nome}
    Click Text    ${nome}
    Deve exibir    product screen
    Deve exibir o texto    ${nome}

Quantidade de produtos no catálogo deve ser maior que
    [Arguments]    ${minimo}
    ${itens}=    Get Webelements    accessibility_id=store item
    ${total}=    Get Length    ${itens}
    Should Be True    ${total} > ${minimo}
