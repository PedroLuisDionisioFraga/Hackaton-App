// Contém informações sobre o tráfego de outros arquivos.
import 'Abstract/traffic.dart';

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