***Settings***
Documentation    Cadastro de produtos
...              Sendo um administrator de catálogo
...              Quero cadastrar novos produtos
...              Para que eu possa disponibiliza-los na loja virtual

Resource    ../resources/actions.robot

Suite Setup       Login Session  papito@ninjapixel.com  pwd123
Suite Teardown    Close Session
Test Teardown     After Test

***Test Cases***
Novo produto
    Dado que eu tenho um novo produto    dk.json
    Quando faço o cadastro desse produto
    Então devo ver este item na lista

## Ao adicionar "..." isso informa que continua na proxima linha.

Produto Duplicado
    [Tags]   dup
    Dado que eu tenho um novo produto    master.json
    Mas eu ja cadastrei esse item e não tinha lembrado
    Quando faço o cadastro desse produto
    Então devo ver a mensagem de alerta    Oops - Este produto já foi cadastrado!


