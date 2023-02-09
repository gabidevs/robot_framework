*** Settings ***
Resource    ../resources/ApiTest_User_Resource.robot
Library    RequestsLibrary

*** Variables ***

*** Test Cases ***


Cenario 01: Cadastrar um novo usuario com sucesso na ServeRest
    [Tags]    cadastro
    Criar um usuario novo
    Cadastrar o usuario criado na ServeRest    ${EMAIL_ALEATORIO}    201
    Conferir se o usuario foi cadastrado corretamente


Cenario 02: Cadastrar usuario ja existente
    [Tags]    recadastro
    Criar um usuario novo
    Cadastrar o usuario criado na ServeRest    ${EMAIL_ALEATORIO}  201 
    Repetir o cadastro de usuario    ${EMAIL_ALEATORIO}    400
    Verificar se a API não permitiu o cadastro repetido
    
Cenario 03: Buscar usuario já cadastrado
    [Tags]    busca_usuario
    Criar um usuario novo
    Cadastrar o usuario criado na ServeRest    ${EMAIL_ALEATORIO}    201
    Buscar usuario ja cadastrado    ID=${ID_USER}
    Conferir dados retornados
Cenário 04: Logar com o novo usuário criado
    
    [Tags]    login
    Criar um usuario novo
    Cadastrar o usuario criado na ServeRest    ${EMAIL_ALEATORIO}    201
    Realizar Login com o usuário    ${EMAIL_ALEATORIO}    coisinha    200
    Conferir se o Login ocorreu com sucesso
