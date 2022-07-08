import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  String id, content, timeStamp, auth;

  Message({
    Key? key,
    required this.id,
    required this.auth,
    required this.content,
    required this.timeStamp,
  }) : super(key: key);

  Widget _renderAvatar() {
    if (auth != '1') {
      return const CircleAvatar(
        maxRadius: 20,
      );
    }
    return const SizedBox(
      width: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        print('Long press');
      },
      child: Row(
        mainAxisAlignment:
            auth == '1' ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          _renderAvatar(),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              margin: const EdgeInsets.only(bottom: 7, left: 5),
              decoration: BoxDecoration(
                color: auth == '1' ? Colors.grey.shade300 : Colors.blue,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    content,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    timeStamp,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
