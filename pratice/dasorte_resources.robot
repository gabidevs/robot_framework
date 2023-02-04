*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SP_DASORTE}    https://sp.dasorte.com/

*** Keywords ***
Abrir navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar navegador
    Capture Page Screenshot
    Close All Browsers

Acessar home page do site Sao Paulo da Sorte
    Go To    url=${SP_DASORTE}

Verificar se o título é "${TITULO}"
    Title Should Be    title=${TITULO}


    