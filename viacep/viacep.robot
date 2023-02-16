*** Settings ***
Library    ./libraries/viacep.py

*** Variables ***
${CEP}    50050050
${LOGRADOURO}    Rua+do+Hospicio
${UF}    PE
${CITY}    Recife


*** Test Cases ***

Buscar logradouro pelo CEP
    Buscar rua    50050050
    
Buscar CEP pelo logradouro,
    Busca cep    ${UF}    ${CITY}    ${LOGRADOURO}

*** Keywords ***
Buscar rua
    [Arguments]    ${CEP}
    ${LOGRADOURO}    Busca Logadouro    cep=${CEP}
    Log    ${LOGRADOURO}

Busca cep
    [Arguments]    ${UF}     ${City}    ${Rua}
    ${CEP}    Busca cep    UF=${UF}    City=${City}    Rua=${Rua}
    Log    ${CEP}