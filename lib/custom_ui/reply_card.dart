import 'package:flutter/material.dart';

class ReplyCard extends StatelessWidget {
  const ReplyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          // color: const Color(0xffdcf8c6),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            children: [
              const Padding(
                padding:
                    EdgeInsets.only(left: 8, right: 50, top: 5, bottom: 18),
                child: Text(
                  'This is a message',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child:  Text(
                  '2:30 PM',
                  style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
