import 'package:flutter/material.dart';
import 'package:flutter_chat_app/custom_ui/avatar_card.dart';
import 'package:flutter_chat_app/custom_ui/contact_card.dart';
import 'package:flutter_chat_app/model/chat_model.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({Key? key}) : super(key: key);

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> contacts = [
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

  List<ChatModel> groupMember = [];

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
      body: Stack(
        children: [
          ListView.builder(
              itemCount: contacts.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    height: groupMember.isNotEmpty ? 90 : 0,
                  );
                }
                return InkWell(
                    onTap: () {
                      if (contacts[index-1].select == true) {
                        setState(() {
                          contacts[index-1].select = false;
                          groupMember.remove(contacts[index-1]);
                        });
                      } else {
                        setState(() {
                          contacts[index-1].select = true;
                          groupMember.add(contacts[index-1]);
                        });
                      }
                    },
                    child: ContactCard(contact: contacts[index-1]));
              }),
          groupMember.isNotEmpty
              ? Column(
                  children: [
                    Container(
                      height: 75,
                      color: Colors.white,
                      child: ListView.builder(
                        itemCount: contacts.length,
                        itemBuilder: (context, index) {
                          if (contacts[index].select == true) {
                            return InkWell(
                                onTap: () {
                                  setState(() {
                                    contacts[index].select = false;
                                    groupMember.remove(contacts[index]);
                                  });
                                },
                                child: AvatarCard(contact: contacts[index]));
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    Divider(
                      thickness: 1,
                    ),
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
