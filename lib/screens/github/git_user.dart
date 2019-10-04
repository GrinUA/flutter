import 'dart:convert';
import 'package:http/http.dart' as http;

class GithubUser {
  final String login;
  final String name;
  final String imageAddress;
  final String url;
  final String bio;

  GithubUser({this.login, this.name, this.imageAddress, this.url, this.bio});

  factory GithubUser.fromJson(Map<String, dynamic> json) {
    return GithubUser(
        login: json['login'],
        name: json['name'],
        imageAddress: json['avatar_url'],
        url: json['html_url'],
        bio: json['bio']);
  }
}

Future<GithubUser> fetchUserByLogin(String login) async {
  final url = 'https://api.github.com/users/';
  final response = await http.get(url + login);

  if (login == null || login == '') {
    throw Exception('Please enter the login');
  }
  if (response.statusCode == 200) {
    return GithubUser.fromJson(json.decode(response.body));
  } else {
    throw Exception('Not Found');
  }
}
