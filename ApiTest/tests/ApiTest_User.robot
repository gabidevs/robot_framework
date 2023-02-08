*** Settings ***
Resource    ../resources/ApiTest_User_Resource.robot
Library    RequestsLibrary

*** Variables ***

*** Test Cases ***


Cenario 01: Cadastrar um novo usuario com sucesso na ServeRest
    Criar um usuario novo
    Cadastrar o usuario criado na ServeRest
    # Conferir se o usuario foi cadastrado corretamente

    