*** Settings ***
Documentation       Catálogo e ordenação de produtos.
Resource            ../resources/base.resource
Test Setup          Abrir o app
Test Teardown       Fechar o app
Test Tags           catalogo


*** Test Cases ***
Catálogo exibe os produtos ordenados por nome
    [Tags]    smoke
    Quantidade de produtos no catálogo deve ser maior que    1
    Primeiro produto deve ser    Sauce Labs Backpack

Ordenação dos produtos
    [Template]    Ordenar e validar o primeiro produto
    Name - Descending     Test.allTheThings() T-Shirt
    Price - Ascending     Sauce Labs Onesie
    Price - Descending    Sauce Labs Fleece Jacket

Abrir o detalhe de um produto
    Abrir o produto    Sauce Labs Backpack
    Deve exibir o texto    29.99


*** Keywords ***
Ordenar e validar o primeiro produto
    [Arguments]    ${opcao}    ${primeiro}
    Ordenar por    ${opcao}
    Primeiro produto deve ser    ${primeiro}
