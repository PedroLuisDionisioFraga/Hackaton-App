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

abstract class Traffic {
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
