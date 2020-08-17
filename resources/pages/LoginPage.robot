***Settings***
Documentation    LoginPage - 
...              Representa a página login com todos os seus elementos 
...              E também suas funcionalidades

***Keywords***
Login With
    [Arguments]    ${email}    ${pass}

    Input Text      id:emailId    ${email}    
    Input Text      id:passId     ${pass} 
    Click Element   xpath://button[text()='Entrar']   