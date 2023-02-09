*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

*** Variables ***  


*** Keywords ***

Criar um usuario novo
    ${PALAVRA_ALEATORIA}    Generate Random String    length=4    chars=[LETTERS]
    ${PALAVRA_ALEATORIA}    Convert To Lower Case    ${PALAVRA_ALEATORIA}
    Set Test Variable   ${EMAIL_ALEATORIO}    ${PALAVRA_ALEATORIA}@emailteste.com

Cadastrar o usuario criado na ServeRest
    [Arguments]    ${EMAIL}    ${STATUS_CODE}
    # Criando um dicionário para enviar no formulário via post
    ${BODY}    Create Dictionary    
    ...        nome=Coisinha de Tal    
    ...        email=${EMAIL}    
    ...        password=coisinha    
    ...        administrador=true
    
    #Abrindo conexão e inserindo headers
    Criar sessão na ServeRest
    
    #Fazendo POST para envio dos dados
    ${RESPONSE}    POST On Session    
    ...            alias=ServeRest
    ...            url=/usuarios
    ...            json=${BODY}
    ...            expected_status=${STATUS_CODE}

    Set Test Variable    ${ID_USER}    ${RESPONSE.json()["_id"]}
    # Inserindo a resposta do POST em uma variável utilizavel em outras keywords
    Set Test Variable    ${RESPOSTA}    ${RESPONSE.json()}

Criar sessão na ServeRest
    # Criando headers para serem enviados junto com a requisição
    ${HEADERS}    Create Dictionary    accept=application/json    Content-Type=application/json
    # Função para abrir a conexão com a url de requisção desejada
    Create Session    alias=ServeRest    url=https://serverest.dev/    headers=${HEADERS}

Conferir se o usuario foi cadastrado corretamente

    Dictionary Should Contain Item   ${RESPOSTA}      message    Cadastro realizado com sucesso  
    Dictionary Should Contain Key    ${RESPOSTA}    _id

Repetir o cadastro de usuario
    [Arguments]    ${EMAIL}    ${STATUS_CODE}
    ${BODY}    Create Dictionary    
    ...        nome=Coisinha de Tal    
    ...        email=${EMAIL}    
    ...        password=coisinha    
    ...        administrador=true
    
    Criar sessão na ServeRest
    
    ${RESPONSE}    POST On Session    
    ...            alias=ServeRest
    ...            url=/usuarios
    ...            json=${BODY}
    ...            expected_status=${STATUS_CODE} 
    
    Set Test Variable    ${RESPOSTA}    ${RESPONSE.json()}

Verificar se a API não permitiu o cadastro repetido
    Dictionary Should Contain Item   ${RESPOSTA}    message    Este email já está sendo usado

Buscar usuario ja cadastrado
    [Arguments]    ${ID}

    ${RESPONSE}    GET On Session
    ...            alias=ServeRest
    ...            url=/usuarios/${ID}
    
    Set Test Variable    ${RESPOSTA}    ${RESPONSE.json()}

Conferir dados retornados





    Log    ${RESPOSTA}
    Dictionary Should Contain Item    ${RESPOSTA}    nome    Coisinha de Tal
    Dictionary Should Contain Item    ${RESPOSTA}    email    ${EMAIL_ALEATORIO}
    Dictionary Should Contain Item    ${RESPOSTA}    password    coisinha
    Dictionary Should Contain Item    ${RESPOSTA}    administrador    true
    Dictionary Should Contain Item    ${RESPOSTA}    _id    ${ID_USER}

Realizar Login com o usuário
    [Arguments]    ${email}    ${password}    ${STATUS_CODE}

    ${login}   Create Dictionary
    ...        email=${email}
    ...        password=${password}

    ${RESPONSE}    POST On Session    
    ...            alias=ServeRest
    ...            url=/login
    ...            json=${login}
    ...            expected_status=${STATUS_CODE}

    Set Test Variable    ${RESPONSE_LOGIN}    ${RESPONSE.json()}

Conferir se o Login ocorreu com sucesso
    Dictionary Should Contain Item    ${RESPONSE_LOGIN}    message    Login realizado com sucesso
    Dictionary Should Contain Key    ${RESPONSE_LOGIN}    authorization