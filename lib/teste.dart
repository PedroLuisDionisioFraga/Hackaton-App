import 'dart:convert';

void main() {
  String jsonString = '{"others":{"total":"121.00B","download":"66.00B","upload":"55.00B"},"https":{"total":"121.00B","download":"66.00B","upload":"55.00B"}}';

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

  data.forEach((key, value) {
    print('valor: $key');
    print('chaves:');
    print(value);
    value.forEach((k, v) {
      print('    $k: $v');
    });
    print('');
  });
}
