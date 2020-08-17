***Settings***
Documentation    Exclusão de produtos
...              Sendo um administrator de catálogo que possui produtos indesejados
...              Quero deletar esses produtos
...              Para que eu possa manter meu catálogo organizado

Resource         ../../resources/actions.robot

Suite Setup       Login Session  papito@ninjapixel.com  pwd123
Suite Teardown    Close Session
Test Teardown     After Test

***Test Cases***
Apagar produto 
    [Tags]    delete_product

    Dado "mario.json" no é um produto indesejado 
    Quando eu solicito a Exclusão
    E confirmo a solicitação
    Então não devo ver esse item no catálogo

Desistir da remoção
    [Tags]    no_delete_product

    Dado "zelda.json" no é um produto indesejado 
    Quando eu solicito a Exclusão  
    Mas cancelo a solicitação
    Então devo ver esse item na lista