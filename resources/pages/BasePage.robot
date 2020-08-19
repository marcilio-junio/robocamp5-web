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

Open Chrome Headless
    Open Browser         about:blank    headlesschrome    options=add_argument('--disable-dev-shm-usage')

## hooks
#  Metodo para abrir o navegador com os tamanhos de tela e tempo necessario para aguardar a apresentação
Open Session 

    # robot -d ./logs -v browser:chrome tests\
    Run Keyword If     "${browser}" == "chrome"
    ...                Open Chrome
    
    # robot -d ./logs -v browser:headless tests\
    Run Keyword If     "${browser}" == "headless"
    ...                Open Chrome Headless
    
    Set Window Size    1440    900
    Set Selenium Implicit Wait  10

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

After Test
    Capture Page Screenshot

