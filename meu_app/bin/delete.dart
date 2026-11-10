import '../lib/conexao.dart';
import 'dart:io';

main() async{
  final supabase = conexao();
  try{
    print("Digite a ID do produto a ser excluído.");
    final id = int.parse(stdin.readLineSync()!);

    final produto = await supabase 
    .from("produtos")
    .delete()
    .eq("id", id)
    .select()
    .single();

    print("Produto excluído: \n");
    print(produto);

  }catch(erro){
    print("Erro: ");
  }finally{
    await supabase.dispose();
  }
  
}