import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'pessoa.dart';
void main() => runApp(MyWidget());

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: Implementar a construção da interface do usuário
    return Container();
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  late final Future<Database> _database;
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _sobrenomeController = TextEditingController();
  final _idadeController = TextEditingController();
  bool _editing = false;
  int _editingId = 0;
  List<Pessoa> pessoas = [];

@override
Widget build(BuildContext context) {
  // TODO: Implementar a construção da interface do usuário
  return Container();
}
_MyHomePageState();
@override
void initState() {
  super.initState();
  _database = _openDatabase();
}

Future<Database> _openDatabase() async {
  try {
    final db = await openDatabase (
      join(await getDatabasesPath(), "EssaCoisa"),
      onCreate: (db, version) {
        return db.execute("CREATE TABLE pessoa(" +
            " id INTEGER PRIMARY KEY, " +
            "nome TEXT, sobrenome TEXT," +
            "idade INTEGER )");
      },
      version: 1,
    );
    return db;
  } catch (e) {
    print(e.toString());
    rethrow;
  }
}

  @override
  void dispose() {
    _nomeController.dispose();
    _sobrenomeController.dispose();
    _idadeController.dispose();
    super.dispose();
  }

  Future<List<Pessoa>> listar() async {
    final db = await _database;
    final List<Map<String, dynamic>> resultado = await db.query("pessoa");
    return List.generate(
      resultado.length,
      (index) {
        return Pessoa(
            id: resultado[index]["id"],
            nome: resultado[index]["nome"],
            sobrenome: resultado[index]["sobrenome"],
            idade: resultado[index]["idade"]);
      },
    );
  }

  Future<void> inserir(Pessoa p) async {
    final db = await _database;
    await db.insert("pessoa", p.criarMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  Future<void> atualizar(Pessoa p) async {
    final db = await _database;
    await db.update(
      "pessoa",
      p.criarMap(),
      where: "id = ?",
      whereArgs: [p.id],
    );
  }

  Future<void> deletar(int id) async {
    final db = await _database;
    await db.delete(
      "pessoa",
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<void> recriarTabela() async {
    final db = await _database;
    db.execute("DROP TABLE IF EXISTS pessoa");
    db.execute("CREATE TABLE pessoa(" +
        " id INTEGER PRIMARYA KEY, " +
        "nome TEXT, sobrenome TEXT," +
        "idade INTEGER )");
  }

  void _limparCampos() {
    _nomeController.text = "";
    _sobrenomeController.text = "";
    _idadeController.text = "";
    _editing = false;
    _editingId = 0;
  }

void _exibirDialogoDeletar(BuildContext context, int id) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: Text("Deletar pessoa"),
        content: Text("Tem certeza que deseja deletar esta pessoa?"),
        actions: <Widget>[
          TextButton(
            child: Text("Cancelar"),
            onPressed: () {
              Navigator.of(dialogContext).pop();
            },
          ),
          TextButton(
            child: Text("Deletar"),
            onPressed: () async {
              await deletar(id);
              setState(() {
                pessoas.removeWhere((pessoa) => pessoa.id == id);
              });
              _limparCampos();
              Navigator.of(dialogContext).pop();
            },
          ),
        ],
      );
    },
  );
}
}