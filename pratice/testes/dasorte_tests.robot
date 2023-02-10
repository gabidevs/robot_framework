*** Settings ***
Documentation    Suite de testes do site São Paulo dá Sorte   
Resource    ../resource/dasorte_resources.robot
Suite Setup    Abrir navegador    https://sp.dasorte.com/
Suite Teardown    Fechar navegador


*** Test Cases ***

Case 01: Testar pagina inicial
    # Caso de teste da página inicial
    [Tags]    atalhos
    Dado que estou na home page do São Paulo da Sorte
    # Irei verificar os avisos e pop-ups da página
    # Irei acessar as imagens de anuncio de compra
    # Irei testar os atalhos na header da pagina
    # Irei verificar os elementos da sessão de resultados
    # Irei os elementos a sessão de vídeos
    # Irei checar as irformações no rodapé


Testar campos da pagina de resultado
    [Tags]    resultado
    

Testar campos da pagina de Resgate Que Sorte
    [Tags]    que_sorte

Testar campos da pagina Seja um revendedor
    [Tags]    revendedor

Testar menu Sobre
    [Tags]    menu_sobre

Testar campos da pagina Ajuda
    [Tags]    ajuda

Testar campos da pagina Contato
    [Tags]    contato

*** Keywords ***