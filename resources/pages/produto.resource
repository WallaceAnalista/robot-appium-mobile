*** Settings ***
Documentation       Detalhe do produto.


*** Keywords ***
Aumentar a quantidade para
    [Arguments]    ${quantidade}
    ${cliques}=    Evaluate    int(${quantidade}) - 1
    FOR    ${i}    IN RANGE    ${cliques}
        Tocar em    counter plus button
    END

Adicionar ao carrinho
    Rolar até ver    Add To Cart button
    Tocar em    Add To Cart button
