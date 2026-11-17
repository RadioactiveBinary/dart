import 'package:meu_app/conexao.dart';
import 'dart:io';

//Registrar informações no banco de dados
Future<void> create() async{
  //Conexao 
  final supabase = conexao();
  String? marca, modelo;
  int? ano, quilometragem;
  double valor;

  while(true){
    try{
      print("Por favor, insira a marca: ");
      marca = stdin.readLineSync();

      print("Por favor, insira o modelo: ");
      modelo = stdin.readLineSync();


      if(marca == "" || modelo == ""){ 
       print("Não pode inserir marca nem modelo vazio.");
        continue;
      }

      print("Por favor, insira o ano: ");
      ano = int.parse(stdin.readLineSync()!);
      
      print("Por favor, insira a quilometragem: ");
      quilometragem = int.parse(stdin.readLineSync()!);
    
      print("Por favor, insira o valor: ");
      valor = double.parse(stdin.readLineSync()!);

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
  }//while

  try{
    final veiculo = await supabase
    //seelciona a tabela
    .from("Veiculo")
    //inserir dados na tabela
    .insert({
      'ano' : ano,
      'marca' : marca,
      'modelo' : modelo,
      'valor' : valor,
      'quilometragem' : quilometragem
    })
    //retorno
    .select()
    //registro único
    .single();
    print(veiculo);
  }catch(erro){
    print("Erro: $erro");
  }finally{
    //encerra a conexao 
    print("teste");
    await supabase.dispose();
  }

}

