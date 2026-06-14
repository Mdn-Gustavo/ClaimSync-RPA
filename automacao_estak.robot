*** Settings ***
Documentation        Automação de Integração de Sinistros com Loop.
Library              SeleniumLibrary

*** Variables ***
${URL_PORTAL}         https://www.google.com

*** Test Cases ***
Executar Integracao Em Massa
    # Criamos uma lista com 3 números de sinistros fictícios
    @{LISTA_SINISTROS}    Create List    111222333    444555666    777888999

    # O comando FOR vai passar por cada sinistro da lista, um por um
    FOR    ${sinistro}    IN    @{LISTA_SINISTROS}
        Log To Console    \n---------------------------------
        Log To Console    Iniciando processamento do Sinistro: ${sinistro}

        # Passos do robô para cada item
        Abrir Portal Da Seguradora
        Buscar O Sinistro    ${sinistro}
        Preencher E Salvar    ${sinistro}
        Fechar O Navegador
    END

*** Keywords ***
Abrir Portal Da Seguradora
    Open Browser    ${URL_PORTAL}    firefox
    Set Window Size    1200    800

Buscar O Sinistro
    [Arguments]    ${numero}
    Input Text      name=q    ${numero}
    Press Keys      name=q    ENTER
    Sleep           1s

Preencher E Salvar
    [Arguments]    ${numero}
    # Aqui ele tira um print único para cada sinistro usando o número dele no nome do arquivo
    Capture Page Screenshot    evidencia_${numero}.png
    Log To Console    Evidência salva para o sinistro ${numero}

Fechar O Navegador
    Close Browser
