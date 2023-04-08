import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Item {
  String title;
  String subtitle;
  IconData iconData;

  Item({required this.title, required this.subtitle, required this.iconData});
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<Item> itemList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Categorias",
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 20.0,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 0, 0, 0)),
      body: itemList.isEmpty
          ? Center(child: Text("Sem Itens adicionados."))
          : ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                Item item = itemList[index];
                return Card(
                  child: ListTile(
                    leading: Icon(item.iconData),
                    title: Text(item.title),
                    subtitle: Text(item.subtitle),
                  ),
                );
              },
            ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 20.0,
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.black,
                  child: itemList.isEmpty
                      ? Icon(Icons.add)
                      : Icon(itemList.last.iconData),
                  onPressed: () async {
                    await showInformationDialog(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Jack vinicius"),
              accountEmail: Text("jackvini@example.com"),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person),
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(
                    255, 29, 28, 28), // define a cor de fundo como branco
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Configurações"),
              onTap: () {
                // Implement your settings logic here
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("ajuda"),
              onTap: () {
                // Implement your help logic here
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showInformationDialog(BuildContext context) async {
    TextEditingController titleController = TextEditingController();
    TextEditingController subtitleController = TextEditingController();
    IconData? selectedIcon;

    return await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            content: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(
                      hintText: "Título",
                    ),
                  ),
                  TextFormField(
                    controller: subtitleController,
                    decoration: InputDecoration(
                      hintText: "Subtítulo",
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add_a_photo),
                    onPressed: () {
                      // seu código aqui
                    },
                  )
                ],
              ),
            ),
            title: Text('Adiciona novo item'),
            actions: <Widget>[
              InkWell(
                child: Text('CANCELAR'),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              InkWell(
                child: Text('ADD'),
                onTap: () {
                  Item newItem = Item(
                    title: titleController.text,
                    subtitle: subtitleController.text,
                    iconData: selectedIcon ?? Icons.help,
                  );
                  setState(() {
                    itemList.add(newItem);
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
      },
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyWidget(),
    );
  }
}
