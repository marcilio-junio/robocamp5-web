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

## Ao adicionar "..." isso informa que continua na proxima linha.
**Keywords***
Dado que eu tenho um novo produto
    [Arguments]    ${json_file}

    ${string_file}=     Get File    ${EXECDIR}/resources/fixtures/${json_file}
    ${product_json}=    Evaluate    json.loads($string_file)    json

    # Disponivel durante todo o TestCase
    Set Test Variable    ${product_json}

    # Disponivel durante toda a suite (outros casos de testes terão acesso a variavel)
    # Set Suite Variable

    # é Global tudo em todas as classes - Se não tiver usando para RPA nunca utilize esse metodo
    # Set Global Variable

Quando eu cadastro este produto 
    Wait Until Element Is Visible   class:product-add   10
    Click Element    class:product-add

    Input Text       css:input[placeholder$="produto?"]    ${product_json['title']}
    
    # Temporario
    Sleep    10