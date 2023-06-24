import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.pushNamed(context, '/chat');
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                radius: 30,
                child: SvgPicture.asset('assets/person.svg',
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    height: 37,
                    width: 34)),
            trailing: const Text('18:00'),
            title: const Text("Dev Stack",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            subtitle: const Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(width: 3),
                Text('Hi Dev stack', style: TextStyle(fontSize: 13)),
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
