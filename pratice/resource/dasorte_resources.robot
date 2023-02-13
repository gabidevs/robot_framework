*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    Telnet
Library    XML

*** Variables ***
${LUCK_ELEMENT}    //a[contains(.,'Agora não')]
${COOKIE_BUTTON}    //button[@class='accept-button'][contains(.,'OK')]
${COOKIE_ID}    cookieConsent


*** Keywords ***
Abrir navegador 
    [Arguments]    ${URL}   
    Open Browser    ${URL}    chrome

Fechar navegador
    Close Browser

Cookies
    Wait Until Element Is Visible    locator=${COOKIE_ID}
    Click Button    locator=${COOKIE_BUTTON}

Pop-up Luck
    Wait Until Element Is Visible    locator=${LUCK_ELEMENT}
    Click Element    locator=${LUCK_ELEMENT}

Anúncio SP dá Sorte
    Wait Until Element Is Visible    locator=//section[@class='galeria']
    Click Element    locator=//div[@class='cont_inside'][contains(.,'05dias 13hrs 26min 43segSorteio todos os domingos')]


Anúncio SP Flash


Header resultados
    Wait Until Element Is Visible    locator=//a[contains(.,'Resultados')]
    Click Element    locator=//a[contains(.,'Resultados')]
    Wait Until Element Is Visible    locator=//h1[@class='rp-title'][contains(.,'Resultados')]

Header Resgate Que Sorte
    Wait Until Element Is Visible    locator=//a[contains(.,'Resgate Que Sorte')]
    Click Element    locator=//a[contains(.,'Resgate Que Sorte')]
    Wait Until Element Is Visible    locator=//h1[@class='rp-title show-title'][contains(.,'Resgate de cupom')]

Header Seja um revendedor
    Wait Until Element Is Visible    locator=//a[contains(.,'Seja um revendedor')]
    Click Element    locator=//a[contains(.,'Seja um revendedor')]
    Wait Until Element Is Visible    locator=//h1[@class='rp-title show-title'][contains(.,'Seja um revendedor')]

Header Sobre
    Wait Until Element Is Visible    locator=//a[contains(@class,'mat-menu-trigger rp-pointer')]
    Click Element    locator=//a[contains(@class,'mat-menu-trigger rp-pointer')]
    Click Element    locator=//button[contains(.,'Quem somos')]
    Wait Until Element Is Visible    locator=//h1[@class='rp-title show-title'][contains(.,'Quem somos')]
    Click Element    locator=//a[contains(@class,'mat-menu-trigger rp-pointer')]
    Click Button    locator=//button[contains(.,'Normas')]
    Wait Until Element Is Visible    locator=//h1[@class='rp-title show-title'][contains(.,'Normas')]

Header Ajuda
    Wait Until Element Is Visible    locator=//a[contains(.,'Ajuda')]
    Click Element    locator=//a[contains(.,'Ajuda')]
    Wait Until Element Is Visible    locator=//h1[contains(.,'Ajuda')]

Header Contato
    Wait Until Element Is Visible    locator=//a[contains(.,'Contato')]
    Click Element    locator=//a[contains(.,'Contato')]
    Wait Until Element Is Visible    locator=//h1[contains(.,'Contato')]


# BDD

Verificar cookies e pop-ups da página
    Pop-up Luck
    Cookies
    
Acessar as imagens de anuncio de compra
    Anúncio SP dá Sorte
    Anúncio SP Flash
            
Testar os atalhos na header da pagina
    Header resultados
    Header Resgate Que Sorte
    Header Seja um revendedor
    Header Sobre
    Header Ajuda
    Header Contato

Verificar os elementos da sessão de resultados