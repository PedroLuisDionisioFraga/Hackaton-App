class Note {
  final int id;
  final String title;
  final String body;
  final DateTime date;

  Note({
    required this.title,
    required this.body,
    required this.date,
    required this.id,
  });

  get idNote => id;
}
