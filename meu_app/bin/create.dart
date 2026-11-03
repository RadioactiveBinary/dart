import '../lib/conexao.dart';

//Registrar informações no banco de dados
main() async{
  //Conexao 
  final supabase = conexao();


  try{
    final produto = await supabase
    //seelciona a tabela
    .from("produtos")
    //inserir dados na tabela
    .insert({
      'nome' : 'Computador',
      'preco' : 150.00,
      'quantidade' : 10
    })
    //retorno
    .select()
    //registro único
    .single();
    print(produto);
  }catch(erro){
    print("Erro: $erro");
  }finally{
    //encerra a conexao 
    await supabase.dispose();
  }

}