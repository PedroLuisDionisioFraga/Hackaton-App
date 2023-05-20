import 'package:flutter/material.dart';

class NoteDelete extends StatelessWidget {
  final void Function(int) removeNote;
  final int idNote;

  const NoteDelete({
    super.key,
    required this.removeNote,
    required this.idNote,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      splashRadius: 25,
      color: Theme.of(context).colorScheme.error,
      onPressed: () => removeNote(idNote),
    );
  }
}
