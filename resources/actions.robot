***Settings***

Documentation     Aqui teremos todas as palavras de ação dos testes automatizados

Library        SeleniumLibrary
Library        OperatingSystem

Library        libs/database.py

Resource    helpers.robot
Resource    pages/BasePage.robot
Resource    pages/LoginPage.robot
Resource    pages/SideBar.robot
Resource    pages/ProductPages.robot

***Keywords***
## steps
Dado que acesso a página login
    Go To    ${BASE_URL}/login

Quando submeto minhas credenciais "${email}" e "${pass}"
    LoginPage.Login With    ${email}    ${pass}

Então devo ser autenticado
    Wait Until Element Is Visible   ${LOGGED_USER} 
    Wait Until Element Contains     ${LOGGED_USER}    Papito     

Então devo ver a mensagem de alerta "${expert_alert}"
    Wait Until Element Is Visible   ${DIV_ALERT}
    Element Text Should Be          ${DIV_ALERT}  ${expert_alert}

# Produtos
Dado que eu tenho um novo produto
    [Arguments]    ${json_file}

    ${product_json}=    Get Json Product    ${json_file}
     
    # Back To The Past
    Remove Product By Title   ${product_json['title']}

    # Disponivel durante todo o TestCase
    Set Test Variable    ${product_json}

Mas eu ja cadastrei esse item e não tinha lembrado 
    ProductPages.Go To Add Form
    ProductPages.Create New Product    ${product_json}  

Quando faço o cadastro desse produto
    ProductPages.Go To Add Form
    ProductPages.Create New Product    ${product_json}

Então devo ver este item na lista   
    Table Should Contain             class:table          ${product_json['title']} 

Então devo ver a mensagem de alerta
    [Arguments]    ${expert_alert}  
    Wait Until Element Contains      ${ALERT_DANGER}      ${expert_alert}

# Exclusão
Dado "${json_file}" no é um produto indesejado 
    # Implementando com o conceito de Shared Steps
    # Dado que eu tenho um novo produto    ${json_file}
    # Quando faço o cadastro desse produto

    # Implementando chamando as Keywords
    ${product_json}=    Get Json Product    ${json_file}

    # Back To The Past
    Remove Product By Title   ${product_json['title']}

    ProductPages.Go To Add Form
    ProductPages.Create New Product      ${product_json}  

    Set Test Variable    ${product_json}    
    
Quando eu solicito a Exclusão
    ProductPages.Request Removel    ${product_json['title']}

E confirmo a solicitação
    ProductPages.Confirm Removal    

Então não devo ver esse item no catálogo
    Wait Until Element Does Not Contain    class:table      ${product_json['title']} 

Mas cancelo a solicitação
    ProductPages.No Confirm Removal

Então devo ver esse item na lista     
    Wait Until Element Contains    class:table      ${product_json['title']} 