import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/pages/chatDetailPage.dart';
import 'package:test2/data/messages_collections.dart';

class ConversationList extends StatefulWidget {
  String name, id, imageURL;
  bool isMessageRead;

  ConversationList({
    Key? key,
    required this.name,
    required this.imageURL,
    required this.isMessageRead,
    required this.id,
  }) : super(key: key);

  @override
  State<ConversationList> createState() => _ConversationListState();
}

class _ConversationListState extends State<ConversationList> {
  final MessagesCollectionsController _messages =
      Get.put(MessagesCollectionsController());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ChatDetailPage(
            name: widget.name,
            id: widget.id,
          );
        }));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        // backgroundImage: NetworkImage(widget.imageURL),
                        maxRadius: 30,
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          height: 16,
                          width: 16,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                            border: Border.all(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                width: 3),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.name),
                      const SizedBox(height: 16),
                      Obx(
                        () => (Text(
                          _messages.lastMessage(widget.id),
                          style: TextStyle(
                            fontWeight: widget.isMessageRead
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        )),
                      )
                    ],
                  ))
                ],
              ),
            ),
            /* Text(
              widget.time,
              style: TextStyle(
                fontWeight:
                    widget.isMessageRead ? FontWeight.bold : FontWeight.normal,
              ),
            ) */
          ],
        ),
      ),
    );
  }
}
