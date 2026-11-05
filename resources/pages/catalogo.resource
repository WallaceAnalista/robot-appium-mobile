*** Settings ***
Documentation       Catálogo de produtos.


*** Keywords ***
Aguardar o catálogo
    Deve exibir    products screen

Ordenar por
    [Documentation]    Opções exibidas no app: Name - Ascending, Name - Descending,
    ...                Price - Ascending, Price - Descending
    [Arguments]    ${opcao}
    Tocar em    sort button
    Wait Until Page Contains    ${opcao}
    Click Text    ${opcao}
    Wait Until Element Is Visible    accessibility_id=sort button

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
