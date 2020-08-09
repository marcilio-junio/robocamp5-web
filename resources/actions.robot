***Settings***

Documentation     Aqui teremos todas as palavras de ação dos testes automatizados

Library        SeleniumLibrary
Library        OperatingSystem

Library        libs/database.py

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

Dado que eu tenho um novo produto
    [Arguments]    ${json_file}

    ${string_file}=     Get File    ${EXECDIR}/resources/fixtures/${json_file}
    ${product_json}=    Evaluate    json.loads($string_file)    json

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
    Table Should Contain             class:table              ${product_json['title']} 

Então devo ver a mensagem de alerta
    [Arguments]    ${expert_alert}  
    Wait Until Element Contains      ${ALERT_DANGER}      ${expert_alert}