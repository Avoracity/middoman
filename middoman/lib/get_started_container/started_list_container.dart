import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import '../utils/flutter_flow_icon_button.dart';
import '../utils/flutter_flow_theme.dart';

class StartedList extends StatefulWidget {
  const StartedList({Key? key}) : super(key: key);
  @override
  State<StartedList> createState() => _StartedListState();
}

//Creating a class user to store the data;
class User {
  // final int userId;
  final String username;
  final String userphotoimage;

  User({
    // required this.userId,
    required this.username,
    required this.userphotoimage,
  });
}

class _StartedListState extends State<StartedList> {
  // String _counter = '';

  @override
  void initState() {
    super.initState();
  }

  Future<List<User>> getRequest() async {
    //replace your restFull API here.
    String url = "https://my-first-app-249520.uk.r.appspot.com/users";
    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<User> users = [];
    for (var singleUser in responseData) {
      User user = User(
          // userId: singleUser["userId"],
          username: singleUser["user_name"],
          userphotoimage: singleUser["user_photo_image"]);

      //Adding user to the list.
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.network(
                      'https://picsum.photos/seed/150/600',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        'Fidel',
                        style: FlutterFlowTheme.of(context).title1,
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      icon: const Icon(
                        Icons.keyboard_arrow_right_sharp,
                        color: Color(0xFF030000),
                        size: 30,
                      ),
                      onPressed: () {
                        // print('IconButton pressed ...');
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.network(
                      'https://picsum.photos/seed/150/600',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        'Tess',
                        style: FlutterFlowTheme.of(context).title1,
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      icon: const Icon(
                        Icons.keyboard_arrow_right_sharp,
                        color: Color(0xFF030000),
                        size: 30,
                      ),
                      onPressed: () {
                        // print('IconButton pressed ...');
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.network(
                      'https://picsum.photos/seed/150/600',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        'Alima',
                        style: FlutterFlowTheme.of(context).title1,
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      icon: const Icon(
                        Icons.keyboard_arrow_right_sharp,
                        color: Color(0xFF030000),
                        size: 30,
                      ),
                      onPressed: () {
                        // print('IconButton pressed ...');
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.network(
                      'https://picsum.photos/seed/150/600',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        'Ken',
                        style: FlutterFlowTheme.of(context).title1,
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      icon: const Icon(
                        Icons.keyboard_arrow_right_sharp,
                        color: Color(0xFF030000),
                        size: 30,
                      ),
                      onPressed: () {
                        // print('IconButton pressed ...');
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.network(
                      'https://picsum.photos/seed/150/600',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        'Michael',
                        style: FlutterFlowTheme.of(context).title1,
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      icon: const Icon(
                        Icons.keyboard_arrow_right_sharp,
                        color: Color(0xFF030000),
                        size: 30,
                      ),
                      onPressed: () {
                        // print('IconButton pressed ...');
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.network(
                      'https://picsum.photos/seed/150/600',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                      child: Text(
                        '.[User_name]',
                        style: FlutterFlowTheme.of(context).title1,
                      ),
                    ),
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      icon: const Icon(
                        Icons.keyboard_arrow_right_sharp,
                        color: Color(0xFF030000),
                        size: 30,
                      ),
                      onPressed: () {
                        // print('IconButton pressed ...');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
