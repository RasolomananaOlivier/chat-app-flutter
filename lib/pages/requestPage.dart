import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test2/data/request_collections.dart';
import 'package:test2/widgets/requestWidget.dart';

class RequestPage extends StatefulWidget {
  RequestPage({Key? key}) : super(key: key);

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  final RequestsColletionsController _requests =
      Get.put(RequestsColletionsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Request',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Obx(
            () => Expanded(
              child: _requests.collections.isEmpty
                  ? const Center(
                      child: Text('No request'),
                    )
                  : Obx(
                      () => ListView.builder(
                        itemCount: _requests.collections.length,
                        itemBuilder: (BuildContext context, int i) {
                          return RequestWidget(
                            name: _requests.collections[i].user.name,
                            time: _requests.collections[i].time,
                            id: _requests.collections[i].id,
                          );
                        },
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
