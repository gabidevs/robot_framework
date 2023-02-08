*** Variables ***
@{NUMEROS}    1    2    3    4    5    6    7    8    9    10


*** Test Case ***

Execução de LOOPS
    Iterando pelo numero de uma lista

*** Keywords ***
Iterando pelo numero de uma lista
    Log To Console    ${\n}
    FOR  ${NUMERO}  IN  @{NUMEROS}
        IF  ${NUMERO} == 5
            Log To Console    Eu sou o número ${NUMERO}
            ELSE IF  ${NUMERO} == 10
                Log To Console    Eu sou o número ${NUMERO}
            ELSE
                Log To Console    Eu não sou o número 5 nem o 10
        END
    END    

