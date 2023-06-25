import 'package:flutter/material.dart';
import 'package:flutter_chat_app/model/chat_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({Key? key, required this.contact}) : super(key: key);
  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 23,
                backgroundColor: Colors.blueGrey[200],
                child: SvgPicture.asset(
                  'assets/person.svg',
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  height: 30,
                  width: 30,
                ),
              ),
              const Positioned(
                bottom: 4,
                right: 5,
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 11,
                  child: Icon(
                    Icons.clear,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 2),
          Text(contact.name)
        ],
      ),
    );
  }
}
