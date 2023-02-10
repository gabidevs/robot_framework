*** Settings ***
Resource    ../resource/dasorte_resources.robot

*** Test Cases ***

Testar atalhos da pagina principal
    [Tags]    atalhos
    

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