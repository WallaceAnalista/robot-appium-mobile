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
    Swipe Para Baixo Até Ver    Add To Cart button
    Tocar em    Add To Cart button

Swipe Para Baixo Até Ver
    [Arguments]    ${accessibility_id}
    FOR    ${i}    IN RANGE    5
        ${visivel}=    Run Keyword And Return Status
        ...    Wait Until Element Is Visible    accessibility_id=${accessibility_id}    timeout=2s
        IF    ${visivel}    RETURN
        Swipe By Percent    50    70    50    30    800
    END
