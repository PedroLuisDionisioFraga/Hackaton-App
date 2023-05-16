import 'dart:async';
import 'dart:convert';
import 'dart:io';

/// Na versão 3.10 do Dart, a palavra-chave sealed foi introduzida
/// para fornecer suporte a classes "sealed" ou "hermeticamente fechadas".
/// Uma classe selada é uma classe que restringe explicitamente a herança,
/// permitindo que apenas suas classes filhas declaradas dentro
/// do mesmo arquivo sejam subclasses válidas.
/// Ao marcar uma classe com o modificador sealed, você está indicando que
/// a classe só pode ser estendida por outras classes definidas
/// no mesmo arquivo. Isso ajuda a evitar a herança não intencional
/// por classes de outros arquivos, fornecendo uma maior segurança
/// e controle sobre a estrutura da classe.
sealed class Traffic {
  final String total;
  final String download;
  final String upload;

  // Constructors
  Traffic({
    required this.total,
    required this.download,
    required this.upload,
  });

  // Methods
  void getAllInformation() {
    print("Total gasto: $total");
    print("Download: $download");
    print("Upload: $upload");
  }
}

// Contém informações sobre o tráfego HTTPS.
class Https extends Traffic {
  static int _id = 0;
  late final int _idReading;

  // Constructors
  Https({
    required String total,
    required String download,
    required String upload,
  }) : super(total: total, download: download, upload: upload) {
    _id++;
    _idReading = _id;
  }

  // Methods
  @override
  void getAllInformation() {
    super.getAllInformation();
  }

  // Getters
  int get getIdReading => _idReading;
}

// Contém informações sobre o tráfego de domínio.
class Domain extends Traffic {
  static int _id = 0;
  late final int _idReading;

  // Constructors
  Domain({
    required String total,
    required String download,
    required String upload,
  }) : super(total: total, download: download, upload: upload) {
    _id++;
    _idReading = _id;
  }

  // Methods
  @override
  void getAllInformation() {
    super.getAllInformation();
  }

  // Getters
  int get getIdReading => _idReading;
}

// Contém informações sobre o tráfego de domínio.
class SSDP extends Traffic {
  static int _id = 0;
  late final int _idReading;

  // Constructors
  SSDP({
    required String total,
    required String download,
    required String upload,
  }) : super(total: total, download: download, upload: upload) {
    _id++;
    _idReading = _id;
  }

  // Methods
  @override
  void getAllInformation() {
    super.getAllInformation();
  }

  // Getters
  int get getIdReading => _idReading;
}

// Contém informações sobre o tráfego de domínio.
class BootPC extends Traffic {
  static int _id = 0;
  late final int _idReading;

  // Constructors
  BootPC({
    required String total,
    required String download,
    required String upload,
  }) : super(total: total, download: download, upload: upload) {
    _id++;
    _idReading = _id;
  }

  // Methods
  @override
  void getAllInformation() {
    super.getAllInformation();
  }

  // Getters
  int get getIdReading => _idReading;
}

// Contém informações sobre o tráfego de outros arquivos.
class Others extends Traffic {
  static int _id = 0;
  late final int _idReading;

  // Constructors
  Others({
    required String total,
    required String download,
    required String upload,
  }) : super(total: total, download: download, upload: upload) {
    _id++;
    _idReading = _id;
  }

  // Methods
  @override
  void getAllInformation() {
    super.getAllInformation();
  }

  // Getters
  int get getIdReading => _idReading;
}

class Process {
  static int _id = 0;
  late final String name;
  late final String createTime;
  late final String lastTimeUpdated;
  late final String upload;
  late final String download;
  late final String uploadSpeed;
  late final String downloadSpeed;

  Process() {
    _id++;
  }

  // Methods
  void getAllInformation() {
    print(" Nome: $name");
    print(" createTime: ${this.createTime}");
    print(" lastTimeUpdated: $lastTimeUpdated");
    print(" upload: $upload");
    print(" download: $download");
    print(" uploadSpeed: $uploadSpeed");
    print(" downloadSpeed: $downloadSpeed");
  }
}

// Listas de cada tipo de tráfico
List<Https> listHttps = [];
List<Domain> listDomain = [];
List<SSDP> listSSDP = [];
List<SSDP> listBootPC = [];
List<Others> listOthers = [];
List<Process> listProcess = [];
// Retorno dos valores das chaves
String total = "";
String download = "";
String upload = "";

void main() async {
  try {
    // Para utilizar esse exemplo com o traffic_analyzer_v2.py, remova as linhas 8-9
    List<Future<dynamic>> futures = <Future>[];
    // Recebe os dados de rede por aplicativo/processo.
    futures.add(handleSocketConnection(50000));
    // Recebe os dados de rede por protocolos.
    futures.add(handleSocketConnection(50001));
    // Recebe os dados de rede por ip dos hosts.
    //futures.add(handleSocketConnection(50002));
    await Future.wait(futures);
  } catch (e) {
    print('Error: $e');
  }
}

Future<void> handleSocketConnection(int port) async {
  String socketMessage;
  Map<String, dynamic> map;
  // Leituras do número de recebimentos do tráfego
  int i = 0;
  try {
    // Estabelecendo a conexão do socket com o localhost e a porta especificada
    final Socket socket = await Socket.connect("localhost", port);
    print('Connected to port $port.');

    // Recebendo os dados do socket
    // Permite aguardar os eventos que ocorrem em um objeto assíncrono.
    await for (var data in socket) {
      if (i >= 6) {
        break;
      }
      i++;

      // // Convertendo os dados recebidos para uma string e imprimindo-os
      // Recebendo a mensagem na porta escolhida
      socketMessage = String.fromCharCodes(data);
      // Transformando em "Map"
      map = convertStringInMap(socketMessage);
      if (port == 50001) {
        print("Porta 50 001");
        splittingJsonFromPort50001(map);
      } else {
        print("Porta 50 000");
        splittingJsonFromPort50000(map);
      }
    }
  } catch (e) {
    print('Error in connection to port $port: $e');
  }
  printAllDatasInPort50001();
  printAllDatasInPort50000();
}

void splittingJsonFromPort50001(Map<String, dynamic> map) {
  map.forEach((key, value) {
    (value as Map<String, dynamic>).forEach((k, v) {
      switch (k) {
        case "total":
          total = v;
          break;
        case "download":
          download = v;
          break;
        case "upload":
          upload = v;
          break;
        default:
      }
    });
    addInRespectiveProtocol(key);
  });
}

void splittingJsonFromPort50000(Map<String, dynamic> map) {
  Process process;
  map.forEach((key, value) {
    process = Process();
    (value as Map<String, dynamic>).forEach((k, v) {
      switch (k) {
        case "name":
          process.name = v;
          break;
        case "create_Time":
          process.createTime = v;
          break;
        case "last_time_updated":
          process.lastTimeUpdated = v;
          break;
        case "download":
          process.download = v;
          break;
        case "upload":
          process.upload = v;
          break;
        case "upload_speed":
          process.uploadSpeed = v;
          break;
        case "download_speed":
          process.downloadSpeed = v;
          break;
        default:
      }
    });
    listProcess.add(process);
  });
}

Map<String, dynamic> convertStringInMap(String map) {
  // Remover o prefixo "b'"
  map = map.substring(2, map.length - 1);
  // Removendo o final "'"
  map = map.substring(0, map.length - 2);
  return json.decode(map);
}

void addInRespectiveProtocol(String protocol) {
  if (protocol == "https") {
    listHttps.add(Https(total: total, download: download, upload: upload));
  } else if (protocol == "domain") {
    listDomain.add(Domain(total: total, download: download, upload: upload));
  } else if (protocol == "ssdp") {
    listSSDP.add(SSDP(total: total, download: download, upload: upload));
  } else if (protocol == "bootpc") {
    listBootPC.add(SSDP(total: total, download: download, upload: upload));
  } else {
    listOthers.add(Others(total: total, download: download, upload: upload));
  }
}

void printAllDatasInPort50001() {
  print("\n----------------------------------------\n");
  print("Lista com 'https':");
  for (var element in listHttps) {
    element.getAllInformation();
    print("-----");
  }
  print("\n-----------------");
  print("Lista com 'domain':");
  for (var element in listDomain) {
    element.getAllInformation();
    print("-----");
  }
  print("\n-----------------");
  print("Lista com 'ssdp':");
  for (var element in listSSDP) {
    element.getAllInformation();
    print("-----");
  }
  print("\n-----------------");
  print("Lista com 'bootpc':");
  for (var element in listBootPC) {
    element.getAllInformation();
    print("-----");
  }
  print("\n-----------------");
  print("Lista com 'others':");
  for (var element in listOthers) {
    element.getAllInformation();
    print("-----");
  }
  print("\n----------------------------------------\n");
}

void printAllDatasInPort50000() {
  print("\n----------------------------------------\n");
  for (int i = 0; i < listProcess.length; i++) {
    listProcess[i].getAllInformation();
    print("-------------");
  }
  print("\n----------------------------------------\n");
}

// Outro método de rescrever o "await for"
Future<void> listenSocket(Socket socket, int port) async {
  //final Socket socket = await Socket.connect("localhost", port);
  StreamSubscription<List<int>> subscription = socket.listen((data) {
    print('Received from port $port: ${String.fromCharCodes(data)}');
    print("Conteúdo");
  });
  // Aguarda até que a conexão do socket seja fechada
  await subscription.asFuture();
}
