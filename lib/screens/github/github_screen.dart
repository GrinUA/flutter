import 'dart:async';
import 'package:flutter/material.dart';
import 'git_user.dart';

class GithubScreen extends StatefulWidget {
  @override
  _GithubScreenState createState() => _GithubScreenState();
}

class _GithubScreenState extends State<GithubScreen> {
  Future<GithubUser> userSearch;

  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: textController,
            autofocus: true,
            decoration: InputDecoration(hintText: 'Github login'),
          ),
          MaterialButton(
            child: Text('Find'),
            color: Colors.blueGrey[300],
            onPressed: () {
              setState(() {
                userSearch = fetchUserByLogin(textController.text);
                FocusScope.of(context).unfocus();
              });
            },
          ),
          FutureBuilder<GithubUser>(
            future: userSearch,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('');

                case ConnectionState.active:

                case ConnectionState.waiting:
                  return Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return Expanded(
                        child: Center(
                      child: Text(
                        snapshot.error.toString(),
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                    ));
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        snapshot.data.login,
                        style: TextStyle(fontSize: 24),
                      ),
                      Image.network(
                        snapshot.data.imageAddress,
                        fit: BoxFit.contain,
                      ),
                      Text(
                        snapshot.data.name != null
                            ? 'Name: ' + snapshot.data.name
                            : '',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 36),
                      ),
                      Text(
                        snapshot.data.bio != null
                            ? 'Bio: ' + snapshot.data.bio
                            : '',
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  );
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
