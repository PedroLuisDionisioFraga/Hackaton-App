import 'package:flutter/material.dart';

class ContainerList extends StatefulWidget {
  const ContainerList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ContainerListState createState() => _ContainerListState();
}

class _ContainerListState extends State<ContainerList> {
  List<bool> itemExpanded = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Número de itens na lista
      itemBuilder: (context, index) {
        return Card(
          child: ExpansionTile(
            backgroundColor: Colors.transparent,
            title: Text('Requisição $index'),
            onExpansionChanged: (expanded) {
              setState(() {
                itemExpanded[index] = expanded;
              });
            },
            initiallyExpanded: itemExpanded[index],
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    //upload, download e protocolo
                    Text('Nome:  $index'),
                    Text('Upload:  $index'),
                    Text('Download:  $index'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
