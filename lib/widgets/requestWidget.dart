import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/data/request_collections.dart';

class RequestWidget extends StatefulWidget {
  String name, time, id;

  RequestWidget({
    Key? key,
    required this.name,
    required this.time,
    required this.id,
  }) : super(key: key);

  @override
  State<RequestWidget> createState() => _RequestWidgetState();
}

class _RequestWidgetState extends State<RequestWidget> {
  final RequestsColletionsController _request =
      Get.find<RequestsColletionsController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, left: 5, right: 8),
      margin: const EdgeInsets.all(5),
      child: Row(
        children: [
          CircleAvatar(
            maxRadius: 30,
            backgroundColor: Colors.amber,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(widget.time),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              _request.acceptRequest(widget.id);
            },
            color: Colors.green,
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              _request.declineRequest(widget.id);
            },
            color: Colors.red,
            icon: const Icon(Icons.cancel),
          ),
        ],
      ),
    );
  }
}
