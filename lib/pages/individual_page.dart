import 'package:flutter/material.dart';
import 'package:flutter_chat_app/model/chat_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({Key? key, required this.chatModel}) : super(key: key);
  final ChatModel chatModel;
  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        titleSpacing: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(Icons.arrow_back),
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blueGrey,
              child: SvgPicture.asset(
                  widget.chatModel.isGroup
                      ? 'assets/groups.svg'
                      : 'assets/person.svg',
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  height: 37,
                  width: 34),
            )
          ]),
        ),
        title: InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.chatModel.name,
                    style: const TextStyle(
                        fontSize: 19, fontWeight: FontWeight.bold)),
                const SizedBox(height: 3),
                const Text('last seen today at 12:05',
                    style: TextStyle(fontSize: 13)),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          PopupMenuButton(
              onSelected: (value) => print(value),
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                      value: 'View Contact', child: Text('View Contact')),
                  const PopupMenuItem(
                      value: 'Media, links, and docs',
                      child: Text('Media, links, and docs')),
                  const PopupMenuItem(
                      value: 'Whatsapp Web', child: Text('Whatsapp Web')),
                  const PopupMenuItem(value: 'Search', child: Text('Search')),
                  const PopupMenuItem(
                      value: 'Mute Notification',
                      child: Text('Mute Notification')),
                ];
              })
        ],
      ),
      body: const Text("dddd"),
    );
  }
}
