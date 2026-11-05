*** Settings ***
Documentation       Keywords comuns a todas as telas e às duas plataformas.
...                 Os locators usam accessibility id, que o app expõe da mesma forma
...                 no Android (content-desc) e no iOS (accessibilityIdentifier).
Library             AppiumLibrary    timeout=20s    run_on_failure=Capture Page Screenshot
Resource            platforms/${PLATFORM}.resource
Resource            pages/login.resource
Resource            pages/catalogo.resource
Resource            pages/produto.resource
Resource            pages/carrinho.resource


*** Variables ***
# A primeira sessão no simulador iOS é lenta (inicia o WebDriverAgent); o CI do iOS amplia este limite.
${TEST_TIMEOUT}     6 minutes


*** Keywords ***
Abrir o app
    [Documentation]    Abre uma sessão nova, com o estado do app limpo (noReset=false).
    Open Application    ${REMOTE_URL}    &{CAPABILITIES}
    Aguardar o catálogo

Fechar o app
    Run Keyword And Ignore Error    Close Application

Tocar em
    [Arguments]    ${accessibility_id}
    Wait Until Element Is Visible    accessibility_id=${accessibility_id}
    Click Element    accessibility_id=${accessibility_id}

Preencher
    [Arguments]    ${accessibility_id}    ${texto}
    Wait Until Element Is Visible    accessibility_id=${accessibility_id}
    Clear Text    accessibility_id=${accessibility_id}
    Input Text    accessibility_id=${accessibility_id}    ${texto}

Deve exibir
    [Arguments]    ${accessibility_id}
    Wait Until Element Is Visible    accessibility_id=${accessibility_id}

Deve exibir o texto
    [Arguments]    ${texto}
    Wait Until Page Contains    ${texto}

Rolar até ver
    [Documentation]    Rola a tela para cima até o elemento aparecer (no máximo 5 vezes).
    [Arguments]    ${accessibility_id}
    FOR    ${i}    IN RANGE    5
        ${visivel}=    Run Keyword And Return Status
        ...    Wait Until Element Is Visible    accessibility_id=${accessibility_id}    timeout=2s
        IF    ${visivel}    RETURN
        Swipe By Percent    50    70    50    30    800
    END
