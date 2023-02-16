import requests


def Busca_Logadouro(cep):
    url = f'https://viacep.com.br/ws/{cep}/json/'
    response = requests.get(url)
    if response.status_code == 200:
        data = response.json()
        logradouro = data['logradouro']
        
        print(logradouro)
        return logradouro
    else:
        return 'CEP não encontrado'




def Busca_CEP(UF,City,Rua):
    url = f'https://viacep.com.br/ws/{UF}/{City}/{Rua}/json/' #O espaços devem ser alterados por +
    response = requests.get(url)
    if response.status_code == 200:
        data = response.json()
        cep = data['cep']
        
        print(cep)
        return cep
    else:
        return 'CEP não encontrado'




