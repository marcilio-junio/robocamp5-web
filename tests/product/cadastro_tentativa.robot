***Settings***
Documentation     Tentativa de Cadastro de produtos
...               Estes cenários enriquecem a história da suite cadastro.robot

Resource          ../ ../resources/actions.robot

Suite Setup       Login Session    papito@ninjapixel.com  pwd123
Suite Teardown    Close Session
Test Teardown     After Test
Test Template     Tentar cadastrar produtos

***Keywords***
    [Arguments]   ${json.file}    ${expect_message}

    Dado que eu tenho um novo produto    ${json.file}
    Quando faço o cadastro desse produto
    Então devo ver a mensagem de alerta  ${expect_message}

***Test Cases***
Nome não informado              contra.json          Opps. Informe o nome do produto!
Categoria não selecionada       streetf2.json        Opps. Selecione uma categoria!
Preço não informado             golden-axe.json      Opps. Informe o preço também!  