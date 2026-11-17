import '../lib/conexao.dart';

Future<void> read() async{
  final supabase = conexao();
  
  try{
    final veiculos = await supabase
    //Definir a tabela que iremos consultar
    .from("Veiculo")
    //consultar
    .select("id, marca, modelo, ano, valor, quilometragem")
    //ordenação
    .order('id');

    if(veiculos.isEmpty){
      print("A tabela está vazia."); 
      return;
    }else{
      for(final veiculo in veiculos){
        int id = veiculo['id'], ano = veiculo['ano'], quilometragem = veiculo['quilometragem'];
        String marca = veiculo['marca'], modelo = veiculo['modelo'];
        double valor = veiculo['valor'];

        print("ID: $id\n");
     
        print("marca: $marca\n");

        print("modelo: $modelo\n");

        print("ano: $ano\n");

        print("Valor: \$$valor\n");

        print("Quilometragem: $quilometragem\n");

      }
    }

  }catch (Erro){
      print("Erro: $Erro");
      return;
  }finally{
    await supabase.dispose();
  }//try
}