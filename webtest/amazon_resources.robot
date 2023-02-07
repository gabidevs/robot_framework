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
${PRODUTO}    Console Xbox Series S



*** Keywords ***
Abrir navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    

Voltar para a home page do site Amazon.com.br 
    Click Element    locator=${HOME}

Entrar no menu "Eletrônicos"
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}
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
    Wait Until Page Contains    text=${PRODUTO}

Selecionar produto com o nome ${PRODUTO}
    Wait Until Page Contains Element    locator=//img[contains(@alt,'Console Xbox Series S')]
    Click Element    locator=//img[contains(@alt,'Console Xbox Series S')]


Clicar em adicionar ao carrinho
    Wait Until Element Is Visible    locator=add-to-cart-button
    Click Element    locator=add-to-cart-button


Ver se o produto esta no Carrinho
    Wait Until Element Is Visible    locator=//img[contains(@alt,'Console Xbox Series S, Abre em uma nova aba')]

Clicar no carrinho
    Click Element    locator=nav-cart-text-container


Clique em "Ir para o carrinho"
    Click Element    locator=//a[contains(@data-csa-c-type,'button')]


Clicar em excluir no carrinho
    Click Element    locator=//span[@class='a-dropdown-label'][contains(.,'Qtd:')]
    Click Element    locator=//a[@tabindex='-1'][contains(@id,'0')][contains(.,'0 (Excluir)')]

Ver se o carrinho apresenta a mensagem de vazio
    Wait Until Page Contains    text=Seu carrinho da Amazon está vazio

# Gherkin Steps

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "${TITULO}"
    Verificar se o título da página fica "${TITULO}"

E o texto "${FRASE}" deve ser exibido na página
    Verificar se aparece a frase "${FRASE}"

E a categoria "${CATEGORIA}" deve ser exibida na página
    Verificar se aparece a categoria "${CATEGORIA}"

Quando pesquisar pelo produto "${PESQUISA}"
    Digitar o nome de produto "${PESQUISA}" no campo de pesquisa
    Clicar no botão de pesquisa

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Exibir a tela com o resultado da pesquisa,listando o produto pesquisado.

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Exibir a tela com o resultado da pesquisa,listando o produto pesquisado.
    

Adicionar o produto "Console Xbox Series S" no carrinho
    Selecionar produto com o nome "Console Xbox Series S"
    Clicar em adicionar ao carrinho
    


Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Clique em "Ir para o carrinho"
    Ver se o produto esta no Carrinho


Remover o produto "Console Xbox Series S" do carrinho
    Clicar em excluir no carrinho

Verificar se o carrinho fica vazio
    Clicar no carrinho
    Ver se o carrinho apresenta a mensagem de vazio