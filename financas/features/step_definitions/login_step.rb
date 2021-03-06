Dado('que informo login e senha') do
    @massa = carregar_massa(['email'])
    value = @massa['login']
    @json_login = LoginPayload.login_dto(value)
    @access_token = login.post_login(@json_login)
    @token = @access_token.parsed_response['token']    
end
  
Então('o sistema deve efetuar login com sucesso') do
   expect(@access_token.code.to_s).to eql "200"
   expect(@access_token["mensagem"]).to eq "Sucesso"
end
  
Dado('que informo a senha e deixo campo email em branco') do
    @massa = carregar_massa(['email'])
    value = @massa['vazio']
    @json_login = LoginPayload.login_dto(value)
    @retorno = login.post_login(@json_login)
    puts @retorno
end
  
Então('sistema deve retornar msg de obrigatoriedade de email') do
    expect(@retorno["mensagem"]).to eql "Obrigatório o envio: email"
end