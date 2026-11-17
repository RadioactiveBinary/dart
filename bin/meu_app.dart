import './create.dart';
import './delete.dart';
import './update.dart';
import './read.dart';

import 'dart:io';
void main() async{

  escolha();

}

Future<void> escolha() async{
  int user = 0;
  while(true){
    
    print("Por favor, selecione uma opção: ");
    print("1 - Create\n2 - Update\n3 - Read\n4 - Delete\n5 - Sair");
    
    try{
      user = int.parse(stdin.readLineSync()!);
    }catch(e){
      print("Erro: $e. \n Por favor, insira um número.");
      continue;
    }//try 
    
    if(user == 5) break;

    switch(user){
      case 1: await create(); break;
      case 2: await update(); break;
      case 3: await read(); break;
      case 4: await delete(); break;
      default: print("Numero inválido.");
    }

  }//while
}