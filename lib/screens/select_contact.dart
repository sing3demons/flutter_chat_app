import 'package:flutter/material.dart';
import 'package:flutter_chat_app/custom_ui/button_card.dart';
import 'package:flutter_chat_app/custom_ui/contact_card.dart';
import 'package:flutter_chat_app/model/chat_model.dart';

class SelectContact extends StatefulWidget {
  SelectContact({Key? key}) : super(key: key);

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  List<ChatModel> contact = [
    ChatModel(name: 'Dev stack', status: 'A full stack developer'),
    ChatModel(name: 'Qa stack', status: 'Hi dev'),
    ChatModel(name: 'SA stack', status: 'Hi dev, qa'),
    ChatModel(name: 'Dev stack', status: 'A full stack developer'),
    ChatModel(name: 'Qa stack', status: 'Hi dev'),
    ChatModel(name: 'SA stack', status: 'Hi dev, qa'),
    ChatModel(name: 'Dev stack', status: 'A full stack developer'),
    ChatModel(name: 'Qa stack', status: 'Hi dev'),
    ChatModel(name: 'SA stack', status: 'Hi dev, qa'),
    ChatModel(name: 'Dev stack', status: 'A full stack developer'),
    ChatModel(name: 'Qa stack', status: 'Hi dev'),
    ChatModel(name: 'SA stack', status: 'Hi dev, qa'),
    ChatModel(name: 'Dev stack', status: 'A full stack developer'),
    ChatModel(name: 'Qa stack', status: 'Hi dev'),
    ChatModel(name: 'SA stack', status: 'Hi dev, qa'),
    ChatModel(name: 'Dev stack', status: 'A full stack developer'),
    ChatModel(name: 'Qa stack', status: 'Hi dev'),
    ChatModel(name: 'SA stack', status: 'Hi dev, qa'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Contsct',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text(
              '256 contscta',
              style: TextStyle(fontSize: 13),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 26,
            ),
          ),
          PopupMenuButton(
              onSelected: (value) => print(value),
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                      value: 'Invite a friend', child: Text('Invite a friend')),
                  const PopupMenuItem(value: 'Contact', child: Text('Contact')),
                  const PopupMenuItem(value: 'Refresh', child: Text('Refresh')),
                  const PopupMenuItem(value: 'Search', child: Text('Search')),
                  const PopupMenuItem(value: 'Help', child: Text('Help')),
                ];
              })
        ],
      ),
      body: ListView.builder(
          itemCount: contact.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const ButtonCard(
                icon: Icons.group,
                name: "New group",
              );
            } else if (index == 1) {
              return const ButtonCard(
                icon: Icons.person_add,
                name: "New contact",
              );
            } else {
              return ContactCard(contact: contact[index - 2]);
            }
          }),
    );
  }
}
