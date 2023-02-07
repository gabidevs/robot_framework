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
Dado que estou na home page da Amazon.com.br
    