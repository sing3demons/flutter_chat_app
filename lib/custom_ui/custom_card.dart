import 'package:flutter/material.dart';
import 'package:flutter_chat_app/model/chat_model.dart';
import 'package:flutter_chat_app/pages/individual_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  final ChatModel chatModel;
  const CustomCard({Key? key, required this.chatModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(context, '/chat');
        Navigator.push(context, MaterialPageRoute(builder: (context)=>IndividualPage()));
      },
      child: Column(
        children: [
          ListTile(
            title: Text(chatModel.name,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            leading: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                radius: 30,
                child: SvgPicture.asset(
                    chatModel.isGroup
                        ? 'assets/groups.svg'
                        : 'assets/person.svg',
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    height: 37,
                    width: 34)),
            trailing: Text(chatModel.time),
            subtitle: Row(
              children: [
                const Icon(Icons.done_all),
                const SizedBox(width: 3),
                Text(chatModel.currentMessage,
                    style: const TextStyle(fontSize: 13)),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Divider(thickness: 1),
          )
        ],
      ),
    );
  }
}
