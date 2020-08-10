***Settings***

Documentation     Aqui teremos todas as palavras chaves de ajuda

***Keywords***
Get Json Product
    [Arguments]    ${json_file}

    ${string_file}=     Get File    ${EXECDIR}/resources/fixtures/${json_file}
    ${json_object}=    Evaluate    json.loads($string_file)    json
    [return]            ${json_object}