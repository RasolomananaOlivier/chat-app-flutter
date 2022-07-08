import 'package:flutter/material.dart';
import 'package:test2/models/Message.dart';
import 'package:test2/pages/chatInfo.dart';
import 'package:test2/data/messages_collections.dart';
import 'package:get/get.dart';
import 'package:test2/widgets/message.dart';
import 'dart:math';

class ChatDetailPage extends StatefulWidget {
  ChatDetailPage({
    Key? key,
    required this.name,
    required this.id,
  }) : super(key: key);
  String name, id;
  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final MessagesCollectionsController _localMessage =
      Get.put(MessagesCollectionsController());

  final textFieldController = TextEditingController();
  @override
  void dispose() {
    textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        flexibleSpace: SafeArea(
          child: Container(
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                const CircleAvatar(
                  maxRadius: 20,
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Online',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      )
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.to(() => ChatInfo(
                          name: widget.name,
                          id: widget.id,
                        ));
                  },
                  icon: const Icon(
                    Icons.info,
                    color: Colors.purpleAccent,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                itemCount: _localMessage.currentMessage(widget.id).items.length,
                itemBuilder: (BuildContext context, index) {
                  return Message(
                    id: _localMessage.currentMessage(widget.id).items[index].id,
                    auth: _localMessage
                        .currentMessage(widget.id)
                        .items[index]
                        .auth,
                    content: _localMessage
                        .currentMessage(widget.id)
                        .items[index]
                        .content,
                    timeStamp: _localMessage
                        .currentMessage(widget.id)
                        .items[index]
                        .timeStamp,
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              // color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textFieldController,
                      decoration: const InputDecoration(
                        hintText: 'Write message...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    heroTag: 'btn1',
                    onPressed: () {},
                    elevation: 0,
                    child: const Icon(
                      Icons.image,
                      size: 20,
                    ),
                  ),
                  FloatingActionButton(
                    heroTag: 'btn2',
                    onPressed: () {
                      MessageModel newMessage = MessageModel(
                        auth: '1',
                        content: textFieldController.text,
                        timeStamp: 'date',
                        type: 'text',
                        id: Random().nextDouble().toStringAsPrecision(5),
                      );
                      _localMessage.addNewMessage(
                          _localMessage.currentMessage(widget.id).id,
                          newMessage);
                    },
                    elevation: 0,
                    child: const Icon(
                      Icons.send,
                      size: 20,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
