import '../lib/conexao.dart';
import 'dart:io';

Future<void> delete() async{
  final supabase = conexao();

  try{
    print("Digite a ID do produto a ser excluído.");
    final id = int.parse(stdin.readLineSync()!);

    print("Desejo mesmo excluir o veiculo de id $id? (s/n)");
    String? u = stdin.readLineSync();

    if(u == 's'){

      final veiculo = await supabase 
      .from("Veiculo")
      .delete()
      .eq("id", id)
      .select()
      .single();

      print("Veiculo excluído: \n");
      print(veiculo);

    }//if

  }catch(erro){
  
    print("Erro: $erro");
  
  }finally{
  
    await supabase.dispose();
  
  }//try
  
}//delete