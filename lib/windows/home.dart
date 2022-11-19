import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../domain/users.dart';

Future<List<Users>> fetchPhotos(http.Client client) async {
  final response =
      await client.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  return compute(parsePhotos, response.body);
}

List<Users> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Users>((json) => Users.fromJson(json)).toList();
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Пользователи",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder<List<Users>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return PhotosList(user: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  const PhotosList({super.key, required this.user});

  final List<Users> user;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
            itemCount: user.length,
            itemBuilder: (context, i) {
              return Card(
                  elevation: 2.0,
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: ListTile(
                        leading: Icon(
                          Icons.account_circle_outlined,
                          size: 50,
                        ),
                        title: Text(
                          user[i].name,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user[i].email,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 133, 124, 124),
                                  fontSize: 13,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                user[i].sometext,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 16,
                                ),
                              ),
                            ])),
                  ));
            }),
      ),
    );
  }
}



/*
Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, i) {
              return Card(
                  elevation: 2.0,
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: ListTile(
                        leading: Icon(
                          Icons.account_circle_outlined,
                          size: 50,
                        ),
                        title: Text(
                          users[i].name,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                users[i].email,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 133, 124, 124),
                                  fontSize: 13,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                users[i].sometext,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 16,
                                ),
                              ),
                            ])),
                  ));
            }),
      ),
    );
  } */

  /*
  class UList extends StatelessWidget {
 
  final notes = <Users>[];
  List<Users> _notes = <Users>[];
  Future<List<Users>> fetchPhotos(http.Client client) async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    return compute(parsePhotos, response.body);
  }
  List<Users> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Users>((json) => Users.fromJson(json)).toList();
}
  /*Future<List<Users>> users = getUsers();
  static Future<List<Users>> getUsers() async {
    const url = 'https://jsonplaceholder.typicode.com/users';
    final response = await http.get(Uri.parse(url));

    final body = json.decode(response.body);
    return body.map<Users>(Users.fromJson).toList();
  }*/

  /*final users = <Users>[
    Users(name: 'Ronaldo', email: 'siii.@gmail.com', sometext: 'cr7'),
    Users(name: 'Ronaldo2', email: 'siii2.@gmail.com', sometext: 'm10'),
  ];*/
  /*@override
  void initState() {
    fetchNotes().then((value) {
      setState(() {
        _notes.addAll(value);
      });
    });
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    fetchNotes().then((value) {
      setState(() {
        _notes.addAll(value);
      });
    });
    return Container(
      child: Container(
        child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, i) {
              return Card(
                  elevation: 2.0,
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: ListTile(
                        leading: Icon(
                          Icons.account_circle_outlined,
                          size: 50,
                        ),
                        title: Text(
                          notes[i].name,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notes[i].email,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 133, 124, 124),
                                  fontSize: 13,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                notes[i].sometext,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 16,
                                ),
                              ),
                            ])),
                  ));
            }),
      ),
    );
  }
}
  */