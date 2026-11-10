import '../lib/conexao.dart';
import 'dart:io';

main () async{
  final supabase = conexao();

  try{
    print("Digite a ID do produto que deseja: ");
    final id = int.parse(stdin.readLineSync()!);

    //solicita o nome
    print("Digite o novo nome: ");
    final nome = stdin.readLineSync();

    //preco
    print("Digite o preço: ");
    final preco = double.parse(stdin.readLineSync()!);

    print("Digite a quantidade: ");
    final quantidade = int.parse(stdin.readLineSync()!);

    final produto = await supabase 
    .from("produtos")
    .update({
      "nome" : nome,
      "preco" : preco, 
      "quantidade" : quantidade
    })
    //identificador
    .eq("id", id)
    //retornar valores atualizados
    .select()
    .single();

    print(produto);
    print("ATUALIZAÇÃO FEITA COM SUCESSO!");
  }catch(erro){
    print("$erro");
  }finally{
    supabase.dispose();
  }
}