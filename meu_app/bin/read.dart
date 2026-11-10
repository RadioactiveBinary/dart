import '../lib/conexao.dart';

main () async{
  final supabase = conexao();
  
  try{
    final produtos = await supabase
    //Definir a tabela que iremos consultar
    .from("produtos")
    //consultar
    .select("id, nome, preco, quantidade")
    //ordenação
    .order('id');

    if(produtos.isEmpty){
      
      return;
    }else{
      for(final produto in produtos){
      
        print("ID: $produto['id']");
     
        print("nome: R\$ $produto['nome']");

        print("Preço: $produto['preco']");
        final valorTotal = produto['preco'];
        print("Valor total: $valorTotal");
      }
    }

  }catch (Erro){
      print("Erro: $Erro");
      return;
  }finally{
    await supabase.dispose();
  }
}