*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SP_DASORTE}    https://sp.dasorte.com/
${TITLE}    //title[contains(.,'São Paulo Dá Sorte')]
${BOTAO_COMPRA}    //button[@class='rp-btn-cta ng-star-inserted'][contains(.,'Compre agora  arrow_forward')]
${BROWSER}    chrome

*** Keywords ***
Abrir navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar navegador
    Capture Page Screenshot
    Close All Browsers

Acessar home page do site Sao Paulo da Sorte
    Go To    url=${SP_DASORTE}

Verificar se o título é "${TITULO}"
    Wait Until Element Is Visible    locator=//a[contains(.,'Agora não')]
    Click Element    locator=//a[contains(.,'Agora não')]
    Wait Until Element Is Visible    locator=//button[@class='accept-button'][contains(.,'OK')]
    Click Element    locator=//button[@class='accept-button'][contains(.,'OK')]
    Wait Until Page Contains    text=${TITULO}

Clicar no botão "Compre agora"
    Wait Until Element Is Visible    locator=//span[@class='material-icons-outlined'][contains(.,'arrow_forward')]
    Click Element    locator=//span[@class='material-icons-outlined'][contains(.,'arrow_forward')]

Verificar se a header mostra "${HEADER}"
        Wait Until Element Is Visible    locator=//h1[@class='rp-title show-title'][contains(.,'${HEADER}')]
    