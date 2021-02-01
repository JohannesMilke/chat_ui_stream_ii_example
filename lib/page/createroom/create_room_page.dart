import 'dart:io';

import 'package:chat_ui_stream_ii_example/api/stream_channel_api.dart';
import 'package:chat_ui_stream_ii_example/model/user.dart';
import 'package:chat_ui_stream_ii_example/page/home/home_page_mobile.dart';
import 'package:chat_ui_stream_ii_example/widget/profile_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateRoomPage extends StatefulWidget {
  final List<User> participants;

  const CreateRoomPage({
    Key key,
    @required this.participants,
  }) : super(key: key);

  @override
  _CreateRoomPageState createState() => _CreateRoomPageState();
}

class _CreateRoomPageState extends State<CreateRoomPage> {
  String name = '';
  File imageFile;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Create Room'),
          actions: [
            IconButton(
              icon: Icon(Icons.done),
              onPressed: () async {
                final idParticipants = widget.participants
                    .map((participant) => participant.idUser)
                    .toList();

                await StreamChannelApi.createChannel(
                  context,
                  name: name,
                  imageFile: imageFile,
                  idMembers: idParticipants,
                );

                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomePageMobile()),
                  ModalRoute.withName('/'),
                );
              },
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.all(24),
          children: [
            GestureDetector(
              onTap: () async {
                final pickedFile =
                    await ImagePicker().getImage(source: ImageSource.gallery);

                if (pickedFile == null) return;

                setState(() {
                  imageFile = File(pickedFile.path);
                });
              },
              child: buildImage(context),
            ),
            const SizedBox(height: 48),
            buildTextField(),
            const SizedBox(height: 12),
            Text(
              'Participants',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 12),
            buildMembers(),
          ],
        ),
      );

  Widget buildImage(BuildContext context) {
    if (imageFile == null) {
      return CircleAvatar(
        radius: 64,
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(Icons.add, color: Colors.white, size: 64),
      );
    } else {
      return CircleAvatar(
        radius: 64,
        backgroundColor: Theme.of(context).accentColor,
        child: ClipOval(
          child:
              Image.file(imageFile, fit: BoxFit.cover, width: 128, height: 128),
        ),
      );
    }
  }

  Widget buildTextField() => TextFormField(
        decoration: InputDecoration(
          labelText: 'Channel Name',
          labelStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(),
        ),
        maxLength: 30,
        onChanged: (value) => setState(() => name = value),
      );

  Widget buildMembers() => Column(
        children: widget.participants
            .map((member) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: ProfileImageWidget(imageUrl: member.imageUrl),
                  title: Text(
                    member.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
      );
}
