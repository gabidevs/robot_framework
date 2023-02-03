*** Test Cases ***

Case test 01 - Acesso ao menu "Eletrônicos"
    [Documentation]    Teste verifica o menu de elêtronicos da Amazon.com.br e a categoria "Computadores e 
    ...                informática"
    [Tags]    menus
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Eletrônicos"
    Verificar se o título da página fica "Eletrônicos e Tecnologia |Amazon.com.br"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se aparece a categoria "Computadores e Informática"

Case test 02 - Pesquisa de um Produto
    [Documentation]    Teste verifica a busca de um produto dentro do site Amazon.com.br

    [Tags]    busca_produto
    Acessar a home page do site Amazon.com.br 
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa 
    Exibir a tela com o resultado da pesquisa,listando o produto pesquisado.
