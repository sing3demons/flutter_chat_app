import 'package:flutter/material.dart';
import 'package:flutter_chat_app/CustomUI/CustomCard.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.chat)),
      body: ListView(children: const [
        CustomCard(),
        CustomCard(),
        CustomCard(),
      ]),
    );
  }
}
