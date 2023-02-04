*** Settings ***
Documentation    Suíte de teste, sites Grupo dá Sorte
...
Resource    dasorte_resources.robot
Suite Setup    Abrir navegador
Suite Teardown    Fechar navegador

*** Test Cases ***
Case test 01 - Acesso a página de compras
    [Documentation]    Teste para verificar se o atalho da home page envia para a tela de compras

    [Tags]    atalhos
    Acessar home page do site Sao Paulo da Sorte
    Verificar se o título é "São Paulo Dá Sorte"
    # Clicar no botão "Compre agora"
    # Verificar se a header mostra "Compra de título"

