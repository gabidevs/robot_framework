*** Settings ***
Library    RequestsLibrary
Library    String

*** Variables ***

*** Keywords ***

Criar um usuario novo
    ${PALAVRA_ALEATORIA}    Generate Random String    length=4    chars=[LETTERS]
    ${PALAVRA_ALEATORIA}    Convert To Lower Case    ${PALAVRA_ALEATORIA}
    Set Test Variable    ${EMAIL}    ${PALAVRA_ALEATORIA}@emailteste.com

Cadastrar o usuario criado na ServeRest
    ${BODY}    Create Dictionary    
    ...        nome=Coisinha de Tal    
    ...        email=coisinha@teste.com.br    
    ...        password=coisinha    
    ...        administrador=true
    Log    ${BODY}

    Criar sessão na ServeRest

    ${RESPONSE}    POST On Session    
    ...            alias=ServeRest
    ...            url=/usuarios
    ...            json=${BODY}  

    Log    ${RESPONSE.json()}

Criar sessão na ServeRest
    ${HEADERS}    Create Dictionary    accept=application/json    Content-Type=application/json
    Create Session    alias=ServeRest    url=https://serverest.dev/    headers=${HEADERS}
    