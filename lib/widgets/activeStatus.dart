import 'package:flutter/material.dart';

class ActiveStatus extends StatefulWidget {
  String name;

  ActiveStatus({Key? key, required this.name}) : super(key: key);

  @override
  State<ActiveStatus> createState() => _ActiveStatusState();
}

class _ActiveStatusState extends State<ActiveStatus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, left: 5, right: 8),
      child: Column(
        children: [
          const CircleAvatar(
            maxRadius: 30,
            backgroundColor: Colors.amber,
          ),
          const SizedBox(
            height: 5,
          ),
          Center(
            child: Text(widget.name),
          )
        ],
      ),
    );
  }
}
