import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/model/chat_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/foundation.dart' as foundation;

class IndividualPage extends StatefulWidget {
  const IndividualPage({Key? key, required this.chatModel}) : super(key: key);
  final ChatModel chatModel;
  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  final TextEditingController _controller = TextEditingController();
  bool emojiShowing = false;

  _onBackspacePressed() {
    _controller
      ..text = _controller.text.characters.toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
  }

  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          emojiShowing = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
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
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          child: Stack(children: [
            ListView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width - 60,
                          child: Card(
                              margin: const EdgeInsets.only(
                                  left: 2, right: 2, bottom: 8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              child: TextFormField(
                                focusNode: focusNode,
                                textAlignVertical: TextAlignVertical.center,
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                minLines: 1,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Type a message',
                                  prefixIcon: IconButton(
                                    icon: const Icon(Icons.emoji_emotions),
                                    onPressed: () {
                                      focusNode.unfocus();
                                      focusNode.canRequestFocus = false;
                                      setState(
                                          () => emojiShowing = !emojiShowing);
                                    },
                                  ),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.attach_file),
                                        onPressed: () => showModalBottomSheet(
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (builder) =>
                                                bottomSheet()),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.camera_alt),
                                        onPressed: () {},
                                      )
                                    ],
                                  ),
                                  contentPadding: const EdgeInsets.all(5),
                                ),
                              ))),
                      Padding(
                        padding:
                            const EdgeInsets.only(bottom: 8, right: 5, left: 2),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: const Color(0xFF128C7E),
                          child: IconButton(
                            icon: const Icon(
                              Icons.mic,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      )
                    ],
                  ),
                  emojiShowing ? emojiSelect() : Container()
                ],
              ),
            )
          ]),
          onWillPop: () {
            if (emojiShowing) {
              setState(() => emojiShowing = false);
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          },
        ),
      ),
    );
  }

  SizedBox emojiSelect() {
    return SizedBox(
      height: 250,
      child: EmojiPicker(
        textEditingController: _controller,
        onEmojiSelected: (category, emoji) {
          _controller.text = _controller.text + emoji.emoji;
        },
        onBackspacePressed: _onBackspacePressed,
        config: Config(
          columns: 7,
          // Issue: https://github.com/flutter/flutter/issues/28894
          emojiSizeMax: 32 *
              (foundation.defaultTargetPlatform == TargetPlatform.iOS
                  ? 1.30
                  : 1.0),
          verticalSpacing: 0,
          horizontalSpacing: 0,
          gridPadding: EdgeInsets.zero,
          initCategory: Category.RECENT,
          bgColor: const Color(0xFFF2F2F2),
          indicatorColor: Colors.blue,
          iconColor: Colors.grey,
          iconColorSelected: Colors.blue,
          backspaceColor: Colors.blue,
          skinToneDialogBgColor: Colors.white,
          skinToneIndicatorColor: Colors.grey,
          enableSkinTones: true,
          recentTabBehavior: RecentTabBehavior.RECENT,
          recentsLimit: 28,
          replaceEmojiOnLimitExceed: false,
          noRecents: const Text(
            'No Recents',
            style: TextStyle(fontSize: 20, color: Colors.black26),
            textAlign: TextAlign.center,
          ),
          loadingIndicator: const SizedBox.shrink(),
          tabIndicatorAnimDuration: kTabScrollDuration,
          categoryIcons: const CategoryIcons(),
          buttonMode: ButtonMode.MATERIAL,
          checkPlatformCompatibility: true,
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return SizedBox(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  iconCreation(
                      Icons.insert_drive_file, Colors.indigo, 'Document'),
                  iconCreation(Icons.camera_alt, Colors.pink, 'Camera'),
                  iconCreation(Icons.insert_photo, Colors.purple, 'Gallery'),
                ],
              ),
              const SizedBox(width: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  iconCreation(Icons.headset, Colors.orange, 'Audio'),
                  iconCreation(Icons.location_pin, Colors.teal, 'Location'),
                  iconCreation(Icons.person, Colors.blue, 'Contact'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(
      IconData insert_drive_file, MaterialColor indigo, String s) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: indigo,
            child: IconButton(
              icon: Icon(
                insert_drive_file,
                color: Colors.white,
                size: 29,
              ),
              onPressed: () {},
            ),
          ),
          const SizedBox(height: 5),
          Text(
            s,
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
