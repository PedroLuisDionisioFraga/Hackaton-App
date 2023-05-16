import 'dart:convert';

void main() {
  String jsonString = 'b\'{"https":{"total":"52.18KB","download":"47.98KB","upload":"4.19KB"}}\'';
  print(jsonString);
  jsonString = jsonString.substring(2, jsonString.length - 1);
  print(jsonString);
  Map<String, dynamic> data = json.decode(jsonString);

  //print("map: $map");
  // Varrendo o "map" e pegando os dados essenciais
  // map.forEach((key, value) {
  //   print("Chave: $key");
  //   // Tratando os dados de "value"
  //   print("Valores:");
  //   print(value);
  //   // String auxConvert = value.toString();
  //   // valuesReturnedBySocket = json.decode(auxConvert);
  //   // print("valuesReturnedBySocket: ${valuesReturnedBySocket.runtimeType}");
  // });
  // Eu juro q n sei como o "forEach" da linha 25 funciona kkkk
  // Só sei q tenho q fazer um "cast" da variável "value" pra informar
  // ao compilador que ela é um "Map<String, dynamic>"
  data.forEach((key, value) {
    print('valor: $key');
    print('chaves:');
    print(value.runtimeType);
    (value as Map<String, dynamic>).forEach((k, v) {
      print('    $k: $v');
    });
    print('');
  });
}
