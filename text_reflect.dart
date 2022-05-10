
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Demo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InfoPage(),
    );
  }

}

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

String name = "abc";
class _InfoPageState extends State<InfoPage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("$name"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
               // controller: textEditingController,
                onChanged: (text) {
                  setState(() {
                    name = text;
                  });
                },
                decoration: InputDecoration(
                  hintText: "type something",
                  hintStyle: TextStyle(fontSize: 10.0),
                  labelText: "type",
                  labelStyle: TextStyle(color: Colors.deepOrange),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  suffixIcon: Icon(Icons.abc_outlined),
                ),
                autofocus: true,
                keyboardType: TextInputType.name,
                maxLength: 20,
                // toolbarOptions: ToolbarOptions(
                //     copy: true, cut: true, paste: true, selectAll: true),
                //textCapitalization: TextCapitalization.words,
                //enableIMEPersonalizedLearning: [bool],
                //enableInteractiveSelection: [bool],
                //enableSuggestions: [bool],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
