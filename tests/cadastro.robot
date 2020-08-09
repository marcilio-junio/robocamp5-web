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
    Quando faço o cadastro este produto
    Então devo ver este item na lista

## Ao adicionar "..." isso informa que continua na proxima linha.
