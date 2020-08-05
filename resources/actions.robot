***Settings***

Documentation     Aqui teremos todas as palavras de ação dos testes automatizados

Library        SeleniumLibrary

Resource    pages/BasePage.robot
Resource    pages/LoginPage.robot
Resource    pages/SideBar.robot

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