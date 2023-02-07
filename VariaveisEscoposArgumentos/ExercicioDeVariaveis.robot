*** Settings ***

Documentation    Exercício de variáveis
    ...     # 1 - Crie um arquivo de teste novo;

            # 2 - Crie uma variável do tipo LISTA na seção de variáveis globais que contenha todos os meses do ano;

            # 3 - Crie um teste que imprima no Console (Log To Console) cada item dessa lista (não use FOR, imprima um a um).

            # 4 - Rode os testes e confira se logou tudo certinho!


*** Test Cases ***

Mostrar meses do ano no Console
    Keyword 01

*** Keywords ***

Keyword 01

    #Setando uma variável global com todos os meses do anos
    Set Global Variable    &{GLOBAL_MESES}    janeiro=janeiro 31    fevereiro=fevereiro 28    março=março 31    abril=abril 30    maio=maio 31    junho=junho 30    julho=julho 31    agosto=agosto 31    setembro=setembro 30    outubro=outubro 31    novembro=novembro 30    dezembro=dezembro 31
    

    Log To Console   ${GLOBAL_MESES.janeiro}
    Log To Console    ${GLOBAL_MESES.fevereiro}
    Log To Console    ${GLOBAL_MESES.março}
    Log To Console    ${GLOBAL_MESES.abril}
    Log To Console    ${GLOBAL_MESES.maio}
    Log To Console    ${GLOBAL_MESES.junho}
    Log To Console    ${GLOBAL_MESES.julho}
    Log To Console    ${GLOBAL_MESES.agosto}
    Log To Console    ${GLOBAL_MESES.setembro}
    Log To Console    ${GLOBAL_MESES.outubro}
    Log To Console    ${GLOBAL_MESES.novembro}
    Log To Console    ${GLOBAL_MESES.dezembro}


