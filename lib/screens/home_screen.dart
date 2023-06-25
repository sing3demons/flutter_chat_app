import 'package:flutter/material.dart';
import 'package:flutter_chat_app/pages/camera_page.dart';
import 'package:flutter_chat_app/pages/chat_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  final List<String> menuItems = [
    'New group',
    'New broadcast',
    'WhatsApp Web',
    'Starred messages',
    'Settings',
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF128C7E),
          title: const Text('chat app', style: TextStyle(color: Colors.white)),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            PopupMenuButton(
                onSelected: (value) {
                  print(value);
                },
                itemBuilder: (context) => menuPopup().toList())
          ]),
      bottomNavigationBar: TabBar(controller: _controller, tabs: const [
        Tab(icon: Icon(Icons.camera_alt)),
        Tab(text: 'CHATS'),
        Tab(text: 'STATUS'),
        Tab(text: 'CALLS'),
      ]),
      body: TabBarView(controller: _controller, children: const [
        CameraPage(),
        ChatPage(),
        Text('Status'),
        Text('Calls'),
      ]),
    );
  }

  // List<PopupMenuEntry<String>> menuPopup(BuildContext context) {
  //   return [
  //     const PopupMenuItem(value: 'New group', child: Text('New group')),
  //     const PopupMenuItem(value: 'New broadcast', child: Text('New broadcast')),
  //     const PopupMenuItem(value: 'Whatsapp Web', child: Text('Whatsapp Web')),
  //     const PopupMenuItem(
  //         value: 'Starred messages', child: Text('Starred messages')),
  //     const PopupMenuItem(value: 'Settings', child: Text('Settings')),
  //   ];
  // }
  Iterable<PopupMenuItem<String>> menuPopup() {
    return menuItems
        .map((item) => PopupMenuItem(value: item, child: Text(item)));
  }
}
