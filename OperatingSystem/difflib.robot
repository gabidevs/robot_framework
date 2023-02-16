*** Settings ***
Library    DiffLibrary
Library    OperatingSystem

*** Test Cases ***

TESTE DiffLibrary
    Comparando arquivos


*** Keywords ***
Comparando arquivos
    Diff Files    file1=./OperatingSystem/texto1.txt    file2=./OperatingSystem/texto2.txt    fail=False


    