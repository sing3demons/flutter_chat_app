import 'package:flutter/material.dart';
import 'package:flutter_chat_app/custom_ui/contact_card.dart';
import 'package:flutter_chat_app/model/chat_model.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
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
  ];

  List<ChatModel> groups = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Group',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text(
              'Add participants',
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
          itemCount: contact.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  if (contact[index].select == true) {
                    setState(() {
                      contact[index].select = false;
                      groups.remove(contact[index]);
                    });
                  } else {
                    setState(() {
                      contact[index].select = true;
                      groups.add(contact[index]);
                    });
                  }
                },
                child: ContactCard(contact: contact[index]));
          }),
    );
  }
}
