*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

*** Variables ***
${EMAIL}    
${RESPOSTA} 

*** Keywords ***

Criar um usuario novo
    ${PALAVRA_ALEATORIA}    Generate Random String    length=4    chars=[LETTERS]
    ${PALAVRA_ALEATORIA}    Convert To Lower Case    ${PALAVRA_ALEATORIA}
    Set Test Variable   ${EMAIL}    ${PALAVRA_ALEATORIA}@emailteste.com

Cadastrar o usuario criado na ServeRest
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
    ...            expected_status=201

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
    ...            expected_status=400 

Verificar se a API não permitiu o cadastro repetido
    Dictionary Should Not Contain Key    ${RESPOSTA}    id

Buscar usuario ja cadastrado
    Criar sessão na ServeRest

    GET On Session    
    ...            alias=ServeRest
    ...            url=/usuarios/JI76NE5YlBuSObg6