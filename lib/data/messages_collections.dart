import 'package:get/get.dart';
import 'package:test2/models/user.dart';
import 'package:test2/models/Message.dart';

class MessagesCollectionsController extends GetxController {
  final RxList<MessageCollection> _collections = [
    MessageCollection(
      id: 'message 2',
      access: ['1', '2'],
      items: [
        MessageModel(
          auth: '2',
          content: 'content',
          timeStamp: 'timeStamp',
          type: 'text',
          id: '1',
        ),
        MessageModel(
          auth: '1',
          content: 'content 2',
          timeStamp: 'timeStamp',
          type: 'text',
          id: '2',
        ),
      ],
      loadAll: false,
      more: 5,
      read: false,
    ),
    MessageCollection(
      id: 'message 3',
      access: ['1', '3'],
      items: [
        MessageModel(
          auth: '1',
          content: 'content',
          timeStamp: 'timeStamp',
          type: 'text',
          id: '1',
        ),
      ],
      loadAll: false,
      more: 5,
      read: false,
    ),
    MessageCollection(
      id: 'message 4',
      access: ['1', '4'],
      items: [
        MessageModel(
          auth: '1',
          content: 'content',
          timeStamp: 'timeStamp',
          type: 'text',
          id: '1',
        ),
      ],
      loadAll: false,
      more: 5,
      read: false,
    )
  ].obs;

  MessageCollection currentMessage(String id) {
    MessageCollection find = MessageCollection(
      id: 'message 1',
      access: ['1', '1'],
      items: [
        MessageModel(
          auth: '1',
          content: 'content',
          timeStamp: 'timeStamp',
          type: 'text',
          id: '1',
        ),
      ],
      loadAll: false,
      more: 5,
      read: false,
    );
    for (var element in _collections) {
      final access = element.access;
      for (var accessId in access) {
        if (accessId == id) {
          find = element;
        }
      }
    }

    return find;
  }

  void addNewMessage(String msgCollectionId, MessageModel newMessage) {
    int index =
        _collections.indexWhere((element) => element.id == msgCollectionId);
    _collections[index].items.add(newMessage);
    _collections.refresh();
  }

  String lastMessage(String userId) {
    MessageCollection find = MessageCollection(
      id: 'message 1',
      access: ['1', '1'],
      items: [
        MessageModel(
          auth: '1',
          content: 'content',
          timeStamp: 'timeStamp',
          type: 'text',
          id: '1',
        ),
      ],
      loadAll: false,
      more: 5,
      read: false,
    );
    for (var element in _collections) {
      final access = element.access;
      for (var accessId in access) {
        if (accessId == userId) {
          find = element;
        }
      }
    }
    final int length = find.items.length - 1;
    return find.items[length].content;
  }
}
