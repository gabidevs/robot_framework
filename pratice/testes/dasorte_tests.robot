*** Settings ***
Documentation    Suite de testes do site São Paulo dá Sorte   
Resource    ../resource/dasorte_resources.robot
Suite Setup    Abrir navegador    https://sp.dasorte.com/
Suite Teardown    Fechar navegador


*** Test Cases ***

Case 01: Testar pagina inicial
    [Documentation]    Caso de teste da página inicial
    
    [Tags]    atalhos
    Verificar cookies e pop-ups da página
    # Acessar as imagens de anuncio de compra
    Testar os atalhos na header da pagina
    Verificar os elementos da sessão de resultados
    # Verificar os elementos a sessão de vídeos
    # Checar as irformações no rodapé


# Testar campos da pagina de resultado
#     [Tags]    resultado
    

# Testar campos da pagina de Resgate Que Sorte
#     [Tags]    que_sorte

# Testar campos da pagina Seja um revendedor
#     [Tags]    revendedor

# Testar menu Sobre
#     [Tags]    menu_sobre

# Testar campos da pagina Ajuda
#     [Tags]    ajuda

# Testar campos da pagina Contato
#     [Tags]    contato

# *** Keywords ***