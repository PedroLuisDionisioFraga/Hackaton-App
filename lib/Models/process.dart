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
