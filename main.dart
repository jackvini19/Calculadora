import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Item {
  String title;
  String subtitle;
  IconData? iconData;

  Item(
      {required this.title, required this.subtitle, this.iconData = Icons.add});
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<Item> itemList = [];
  String newTitle = '';
  String newSubtitle = '';
  IconData? selectedIcon;

  final List<IconData> iconList = [
    Icons.favorite,
    Icons.star,
    Icons.check_circle_outline,
    Icons.accessibility,
    Icons.emoji_emotions,
    Icons.verified_user,
    Icons.camera_alt,
    Icons.flight_takeoff,
    Icons.music_note,
  ];

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
                    leading: Icon(itemList[index].iconData),
                    title: Text(itemList[index].title),
                    subtitle: Text(itemList[index].subtitle),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit_rounded),
                          onPressed: () {
                            showInformationDialog(context, index);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete_rounded),
                          onPressed: () {
                            setState(() {
                              itemList.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                    onTap: () {
                      // Coloque aqui o código que você quer executar quando o usuário tocar no item
                    },
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
                  onPressed: () async {
                    showInformationDialog(context,
                        -1); // -1 indica que é um novo item a ser adicionado
                  },
                  child: Icon(Icons.add),
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
              accountEmail: Text("jackvini@exemplo.com"),
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

  Future<void> showInformationDialog(BuildContext context, int index) async {
    TextEditingController titleController = TextEditingController();
    TextEditingController subtitleController = TextEditingController();
    IconData? selectedIcon = Icons.help;

    if (index >= 0) {
      // Se index >= 0, estamos editando um item existente, então carregamos os dados desse item nos campos do formulário
      Item item = itemList[index];
      titleController.text = item.title;
      subtitleController.text = item.subtitle;
      selectedIcon = item.iconData;
    }

    return await showDialog(
      context: context,
      builder: (context) {
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
                  onChanged: (value) {
                    setState(() {
                      newTitle = value;
                    });
                  },
                ),
                TextFormField(
                  controller: subtitleController,
                  decoration: InputDecoration(
                    hintText: "Subtítulo",
                  ),
                  onChanged: (value) {
                    setState(() {
                      newSubtitle = value;
                    });
                  },
                ),
                DropdownButton<IconData>(
                  value: selectedIcon,
                  onChanged: (value) {
                    setState(() {
                      selectedIcon = value!;
                    });
                  },
                  items: [
                    DropdownMenuItem(
                      child: Icon(Icons.home),
                      value: Icons.help,
                    ),
                    DropdownMenuItem(
                      child: Icon(Icons.person),
                      value: Icons.person,
                    ),
                    DropdownMenuItem(
                      child: Icon(Icons.star),
                      value: Icons.star,
                    ),
                    DropdownMenuItem(
                      child: Icon(Icons.shopping_cart),
                      value: Icons.shopping_cart,
                    ),
                    DropdownMenuItem(
                      child: Icon(Icons.car_repair),
                      value: Icons.car_repair,
                    ),
                    // Adicione outros ícones aqui
                  ],
                ),
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
                  title: newTitle,
                  subtitle: newSubtitle,
                  iconData: selectedIcon,
                );
                setState(() {
                  itemList.add(newItem);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
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
