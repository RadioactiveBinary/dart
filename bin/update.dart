import '../lib/conexao.dart';
import 'dart:io';

Future<void> update() async{
  final supabase = conexao();

  int id, ano, quilometragem;
  String? marca, modelo;
  double valor;
  while(true){    
    try{

      print("Digite a ID do veiculo que deseja: ");
      id = int.parse(stdin.readLineSync()!);

      print("Digite a nova marca: ");
      marca = stdin.readLineSync();

      print("Digite o novo modelo: ");
      modelo = stdin.readLineSync();

      print("Digite o novo ano: ");
      ano = int.parse(stdin.readLineSync()!);

      print("Digite o novo valor: ");
      valor = double.parse(stdin.readLineSync()!);
      
      print("Digite o nova quilometragem: ");
      quilometragem = int.parse(stdin.readLineSync()!);

      if(id < 0){
        print("Erro, id precisa ser > 0.");
        continue;
      }

      if(valor <= 0){
        print("Inválido. Valor precisa ser > 0");
        continue;
      }

      if(ano < 1900 || ano > DateTime.now().year){
        print("Erro, ano menor que 1900 ou maior que o atual.");
        continue;
      }

      if(quilometragem <= 0){
        print("Erro, quilometragem precisa ser maior que 0.");
        continue;
      }

      break;
    }catch(erro){
        print("Erro: $erro");
        continue;
    }
  }//try

  try{
    
    final veiculo = await supabase 
    .from("veiculo")
    .update({
      'ano' : ano,
      'marca' : marca,
      'modelo' : modelo,
      'valor' : valor,
      'quilometragem' : quilometragem
    })
    //identificador
    .eq("id", id)
    //retornar valores atualizados
    .select()
    .single();

    print(veiculo);
    print("ATUALIZAÇÃO FEITA COM SUCESSO!");
  }catch(erro){
    print("Erro: $erro");
  }finally{
    supabase.dispose();
  }
}//update