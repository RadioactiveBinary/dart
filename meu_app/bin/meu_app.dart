
import 'package:http/http.dart';

void main() {
  requestData();
  requestDataAsync();
}

requestData(){
  String url =  "https://gist.githubusercontent.com/RadioactiveBinary/72eba66f2989751ca69d60f83efb109d/raw/9e3ad8bab94198fd8aa5072bf88e22b5338b92e9/Filmes.json";

  Future<Response> filmes = get(Uri.parse(url));
  print(filmes);

  filmes.then((Response response){
    print(response.body);
  });
  print("Último código.");
}

requestDataAsync() async{
  
  String url =  "https://gist.githubusercontent.com/RadioactiveBinary/72eba66f2989751ca69d60f83efb109d/raw/9e3ad8bab94198fd8aa5072bf88e22b5338b92e9/Filmes.json";

  Response response = await get(Uri.parse(url));

  print(response.body);

  print("Últim código");


}