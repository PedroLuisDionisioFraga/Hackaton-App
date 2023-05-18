import 'package:flutter/material.dart';

class NoteDate extends StatelessWidget {
  String addingWords({required String word, String wordToBeAdded = " de "}) {
    String newWord = "";
    bool flag = true;

    for (var i = 0; i < word.length; i++) {
      // Primeira letra maiúscula
      if (i == 0) {
        newWord += word[0].toUpperCase();
      }
      // Vírgula após o nome do dia
      else if (word[i] == " " && flag) {
        newWord += ", ";
        newWord += word[i + 1].toUpperCase();
        flag = false;
        i++;
      }
      // " de " no lugar dos próximos espaços em branco entre palavras
      else if (word[i] == " " && !flag) {
        newWord += " de ";
        newWord += word[i + 1].toUpperCase();
        i++;
      }
      // Acrescentando normalmente a palavra sem alterações
      else {
        newWord += word[i];
      }
    }
    return newWord;
  }

  final String dateFormat;

  const NoteDate({
    super.key,
    required this.dateFormat,
  });

  @override
  Widget build(BuildContext context) {
    final String newWord = addingWords(word: dateFormat);
    final List<String> splitDateFormat = newWord.split(",");
    return Column(
      children: [
        Text(
          splitDateFormat[0],
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontSize: 18,
              ),
        ),
        Text(
          splitDateFormat[1],
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontSize: 15,
              ),
        ),
      ],
    );
  }
}
