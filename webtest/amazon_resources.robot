*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}    https://www.amazon.com.br/
${MENU_ELETRONICOS}    //a[contains(.,'Eletrônicos')]
${CHECK_HEADER}    //h1[contains(.,'Eletrônicos e Tecnologia')]
${HREF_CATEGORIA}    //a[@href='/b/ref=s9_acss_bw_cg_CatTile_2a1_w?ie=UTF8&node=16339926011&pf_rd_m=A3RN7G7QC5MWSZ&pf_rd_s=merchandised-search-4&pf_rd_r=32F7VS32BV6PW4G1APYR&pf_rd_t=101&pf_rd_p=16bdb8d5-8685-4a46-bc18-a986204bffc9&pf_rd_i=16209062011']
${INPUT_TEXT}    twotabsearchtextbox
${PESQUISA_BOTAO}    //input[contains(@type,'submit')]
${HOME}    //a[@href='/ref=nav_logo'][contains(.,'.com.br')]



*** Keywords ***
Abrir navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Voltar para a home page do site Amazon.com.br 
    Click Element    locator=${HOME}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=${CHECK_HEADER}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${CATEGORIA}"
    Element Should Be Visible   locator=//a[contains(@aria-label,'${CATEGORIA}')]

Digitar o nome de produto "${PESQUISA}" no campo de pesquisa
    Input Text    locator=${INPUT_TEXT}    text=${PESQUISA}
    Capture Element Screenshot    locator=${INPUT_TEXT}

Clicar no botão de pesquisa
    Click Element    locator=${PESQUISA_BOTAO}

Exibir a tela com o resultado da pesquisa,listando o produto pesquisado.
    Wait Until Element Is Visible    locator=//span[@class='a-size-medium-plus a-color-base a-text-normal'][contains(.,'RESULTADOS')]