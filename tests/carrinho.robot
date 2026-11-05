*** Settings ***
Documentation       Carrinho de compras.
Resource            ../resources/base.resource
Test Setup          Abrir o app
Test Teardown       Fechar o app
Test Tags           carrinho


*** Variables ***
${PRODUTO}      Sauce Labs Backpack


*** Test Cases ***
Adicionar produto com quantidade ao carrinho
    [Tags]    smoke
    Abrir o produto    ${PRODUTO}
    Aumentar a quantidade para    2
    Adicionar ao carrinho
    Abrir o carrinho
    Carrinho deve conter    ${PRODUTO}    2

Remover produto do carrinho
    Abrir o produto    ${PRODUTO}
    Adicionar ao carrinho
    Abrir o carrinho
    Carrinho deve conter    ${PRODUTO}    1
    Remover o primeiro item
    Carrinho deve estar vazio
