*** Settings ***
Library           FakerLibrary

*** Variables ***
${NOME}    gabriel
${SOBRENOME}    oliveira
${STRING}
${PROVEDOR}    @email.com

*** Test Cases ***
Concatenando Strings
    Função de concatenação    ${NOME}    ${SOBRENOME}    ${STRING}    ${PROVEDOR}

*** Keywords ***
Função de concatenação
    [Arguments]    ${NOME}    ${SOBRENOME}    ${STRING}    ${PROVEDOR}
    ${STRING}    FakerLibrary.User Name
    ${EMAIL}    Catenate    SEPARATOR=    ${NOME}    ${SOBRENOME}    ${STRING}    ${PROVEDOR}

    Log To Console    ${EMAIL}

