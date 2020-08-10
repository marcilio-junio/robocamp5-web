***Settings***
Documentation    ProductPage - 
...              Representa a página cadastro de produtos com todos os seus elementos 
...              E também suas funcionalidades


***Variables***
${PRODUCT_ADD}     class:product-add 
${ALERT_DANGER}    class:alert-danger

***Keywords***
Go To Add Form
   Wait Until Element Is Visible   ${PRODUCT_ADD} 
   Click Element                   ${PRODUCT_ADD}

Select Category  
   [Arguments]    ${cat}      

   Click Element    css:input[placeholder^=Gat]
       
   # selecione item do menu Categoria
   Wait Until Element Is Visible    xpath://li//span[text()='${cat}']
   Click Element                    xpath://li//span[text()='${cat}']

Request Removel
   [Arguments]    ${title}

   Click Element    xpath://tr[td//text()[contains(.,'${product_json['title']}')]]//button

Confirm Removal
   Click Element    class=swal2-confirm

Create New Product
   [Arguments]    ${product_json}     

   Input Text                       css:input[placeholder$="produto?"]    ${product_json['title']}

   Select Category                  ${product_json['cat']}   

   # Adicionar o preço
   Input Text                       css:input[name=price]    ${product_json['price']}         

   # CLicar para cadastrar
   Click Element                    id:create-product 