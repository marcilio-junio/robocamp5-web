***Settings***
Documentation    Basepage - 
...              Representa a inicialização do selenium e demais cursos como ganchos e helpers


Resource    LoginPage.robot
Resource    Components.robot
Resource    ProductPages.robot

***Variables***
${BASE_URL}    http://pixel-web:3000

***Keywords***
## helpers
Open Chrome
    Open Browser    about:blank       chrome      options=add_experimental_option('excludeSwitches', ['enable-logging'])

## hooks
#  Metodo para abrir o navegador com os tamanhos de tela e tempo necessario para aguardar a apresentação
Open Session 
    Open Chrome
    Set Window Size    1440    900
    Set Selenium Implicit Wait  5

# Metodo para logar no site com login e senha correta.
Login Session
    [Arguments]    ${email}    ${pass}
    Open Session 
    Go To         ${BASE_URL}/login
    Login With    ${email}    ${pass}

Product Add Session
    [Arguments]      ${email}    ${pass}
    Login Session    ${email}    ${pass}
    ProductPages.Go To Add Form

Close Session
    Close Browser   

Clear Local Storage 
    Capture Page Screenshot
    Execute Javascript    localStorage.clear();

After Test
    Capture Page Screenshot

