import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sutom/case.dart';
import 'package:sutom/data_store.dart';
import 'package:sutom/keyboard/custom_keyboard.dart';
import 'package:sutom/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [Provider(create: (_) => DataStore())],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const Game(),
        ));
  }
}

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  void initState() {
    Provider.of<DataStore>(context, listen: false).initGame();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        actions: [
          IconButton(onPressed: (){
            Provider.of<DataStore>(context, listen: false).initGame();
            setState(() {});
          }, icon: const Icon(Icons.refresh))
        ],
      ),
      body: Observer(
          // Mobx : Update data when needed
          builder: (BuildContext context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: Provider.of<DataStore>(context, listen: false).col,
                ),
                itemBuilder: _buildGridItems,
                itemCount: Provider.of<DataStore>(context, listen: false).col * Provider.of<DataStore>(context, listen: false).row,
              )),
              Text(Provider.of<DataStore>(context, listen: false).textToDisplay,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              const SizedBox(height : 20),
              CustomKeyboard(
                onTextInput: (letter) {
                  Provider.of<DataStore>(context, listen: false).onLetterPressed(letter);
                  setState(() {});
                },
                onBackspace: () {
                  Provider.of<DataStore>(context, listen: false).onBackspacePressed();
                  setState(() {});
                },
                onSubmit: () {
                  Provider.of<DataStore>(context, listen: false).onSubmitPressed(context);
                  setState(() {});
                },
              )
            ],
          ),
        );
      }),
    );
  }
}

Widget _buildGridItems(BuildContext context, int index) {
  int gridStateLength = Provider.of<DataStore>(context, listen: false).col;
  int x, y = 0;
  x = (index / gridStateLength).floor();
  y = (index % gridStateLength);
  return _buildGridItem(context, x, y);
}

Widget _buildGridItem(BuildContext context, int x, int y) {
  Case currentCase = Provider.of<DataStore>(context, listen: false).gameTable[x][y];
  return Container(
    decoration: BoxDecoration(color: currentCase.state == StateCase.place ? blueColor : currentCase.color, border: Border.all(color: Colors.white)),
    child: Center(child: CircleAvatar(backgroundColor: currentCase.state == StateCase.place ? currentCase.color : Colors.transparent,child: SizedBox.expand(child: FittedBox(child: Text(currentCase.value, style: const TextStyle(fontSize: 70, fontWeight: FontWeight.bold, color: Colors.white)))))),
  );
}
