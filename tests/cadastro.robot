***Settings***
Documentation    Cadastro de produtos
...              Sendo um administrator de catálogo
...              Quero cadastrar novos produtos
...              Para que eu possa disponibiliza-los na loja virtual

Library     OperatingSystem
Resource    ../resources/actions.robot

Suite Setup       Login Session  papito@ninjapixel.com  pwd123
Suite Teardown    Close Session
Test Teardown     After Test

***Test Cases***
Novo produto
    Dado que eu tenho um novo produto    dk.json
    Quando eu cadastro este produto
    Então devo ver este item na lista

## Ao adicionar "..." isso informa que continua na proxima linha.
**Keywords***
Dado que eu tenho um novo produto
    [Arguments]    ${json_file}

    ${string_file}=     Get File    ${EXECDIR}/resources/fixtures/${json_file}
    ${product_json}=    Evaluate    json.loads($string_file)    json

    # Back To The Past
    Remove Product By Title   ${product_json['title']}

    # Disponivel durante todo o TestCase
    Set Test Variable    ${product_json}

    # Disponivel durante toda a suite (outros casos de testes terão acesso a variavel)
    # Set Suite Variable

    # é Global tudo em todas as classes - Se não tiver usando para RPA nunca utilize esse metodo
    # Set Global Variable

Quando eu cadastro este produto 
    Wait Until Element Is Visible   class:product-add   10
    Click Element    class:product-add

    Input Text                       css:input[placeholder$="produto?"]    ${product_json['title']}

    # selecione categoria
    click Element                    css:input[placeholder^=Gat]

    # selecione item do menu Categoria
    Wait Until Element Is Visible    xpath://li//span[text()='${product_json['cat']}'] 
    Click Element                    xpath://li//span[text()='${product_json['cat']}']

    # Adicionar o preço
    Input Text                       css:input[name=price]    ${product_json['price']}         

    # CLicar para cadastrar
    Click Element                    id:create-product          
    
    # Temporario
    Sleep    5

Então devo ver este item na lista   
    Table Should Contain             class:table              ${product_json['title']}