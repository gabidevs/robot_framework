*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    Telnet

*** Variables ***


*** Keywords ***
Abrir navegador 
    [Arguments]    ${URL}   
    Open Browser    ${URL}    chrome

Fechar navegador
    Close Browser

Checar Título
    Set Timeout    
    Title Should Be    São Paulo Dá Sorte
        

Dado que estou na home page do São Paulo da Sorte
    Checar Título