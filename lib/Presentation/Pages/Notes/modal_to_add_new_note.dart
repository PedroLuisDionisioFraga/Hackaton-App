import 'package:flutter/material.dart';
import 'package:flutter_application_1/Shared/Widgets/text_form_field.dart';
import 'package:intl/intl.dart';

import 'modal.dart';

class ShowBarModalBottom extends StatefulWidget {
  final void Function(String, String, DateTime) addTransaction;

  const ShowBarModalBottom({
    super.key,
    required this.addTransaction,
  });

  @override
  State<ShowBarModalBottom> createState() => _ShowBarModalBottomState();
}

class _ShowBarModalBottomState extends State<ShowBarModalBottom> {
  final _title = TextEditingController();
  final _body = TextEditingController();
  DateTime _selectedDay = DateTime.now();

  // TextFormField base
  MyTextFormField basicInput = const MyTextFormField.empty();

  // FocusNames
  final FocusNode focusNoteTitle = FocusNode();
  final FocusNode focusNoteBody = FocusNode();

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Data previamente selecionada
      firstDate: DateTime(2022), // Qual o ano mais novo que ficará disponível pro usuário
      lastDate: DateTime.now(), // Até quando o usuário pode selecionar a data
    ).then((pikedDate) {
      // É chamada quando é clicado em "ok" ou "cancelar"
      pikedDate == null
          ? null
          : setState(() {
              _selectedDay = pikedDate;
            });
    });
  }

  _submitNewNote() {
    if (_title.text.isEmpty) {
      return;
    }
    widget.addTransaction(_title.text, _body.text, _selectedDay);
  }

  @override
  Widget build(BuildContext context) {
    final Widget noteTitle = basicInput
      .copyWith(
        controller: _title,
        focusName: focusNoteTitle,
        label: "Título",
        startIcon: Icons.shopping_bag,
        inputType: TextInputType.name,
        inputAction: TextInputAction.next,
        capitalization: TextCapitalization.sentences,
      )
      .inputField();

  final Widget noteBody = basicInput
      .copyWith(
        controller: _body,
        focusName: focusNoteBody,
        label: "Corpo da nota",
        startIcon: Icons.shopping_bag,
        inputType: TextInputType.name,
        inputAction: TextInputAction.done,
        capitalization: TextCapitalization.sentences,
        onFieldSubmitted: (String _) => _submitNewNote(),
      )
      .inputField();
    return MyModalStyle(
      modalBody: [
        noteTitle,
        const SizedBox(height: 15),
        noteBody,
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: Text(
                "Data Selecionada: ${DateFormat("dd/MM/y").format(_selectedDay)}",
                style: const TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
              onPressed: _showDatePicker,
              child: Text(
                "Mudar a Data!",
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: 14.3,
                    ),
              ),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: _submitNewNote,
          child: Text(
            "Adicionar Anotação",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
