import 'package:chat_ui_stream_ii_example/api/stream_api.dart';
import 'package:flutter/foundation.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:chat_ui_stream_ii_example/model/user.dart' as model;

class StreamUserApi {
  static Future<List<model.User>> getAllUsers({bool includeMe = false}) async {
    final sort = SortOption('last_message_at');
    final response = await StreamApi.client.queryUsers(sort: [sort]);

    final defaultImage =
        'https://images.unsplash.com/photo-1580907114587-148483e7bd5f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';

    final allUsers = response.users
        .map((user) => model.User(
              idUser: user.id,
              name: user.name,
              imageUrl: user.extraData['image'] ?? defaultImage,
              isOnline: user.online,
            ))
        .toList();

    return allUsers;
  }

  static Future createUser({
    @required String idUser,
    @required String username,
    @required String urlImage,
  }) async {
    final token = StreamApi.client.devToken(idUser);

    final user = User(
      id: idUser,
      extraData: {
        'name': username,
        'image': urlImage,
      },
    );
    await StreamApi.client.setUser(user, token);
  }

  static Future login({@required String idUser}) async {
    final token = StreamApi.client.devToken(idUser);

    final user = User(id: idUser);
    await StreamApi.client.setUser(user, token);
  }
}
