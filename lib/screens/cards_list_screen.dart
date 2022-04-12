import 'package:flutter/material.dart';
import 'package:gdsc_task/constants.dart';
import 'package:gdsc_task/models/users.dart';
import 'package:gdsc_task/screens/detailed_user_profile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:gdsc_task/screens/followers_screen.dart';

class CardsListScreen extends StatefulWidget {
  @override
  State<CardsListScreen> createState() => _CardsListScreenState();
}

class _CardsListScreenState extends State<CardsListScreen> {

  List<Users> _users = <Users>[];

  Future<List<Users>> fetchData() async {
    var users = <Users>[];
    final url = Uri.parse('https://api.github.com/users');
    var response = await http.get(url);
    var data = json.decode(response.body);
    for(var user in data){
      users.add(Users.fromJson(user));
    }
    return users;
  }

  @override
  void initState(){
    fetchData().then((value) {
      setState(() {
        _users.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GitHub Users',
          style: TextStyle(
            color: Colors.teal.shade100,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Stack(
        children : [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromRGBO(27, 22, 210, 0.8),
                  const Color.fromRGBO(210, 22, 91, 0.8).withOpacity(0.9),
                  // const Color.fromRGBO(209, 220, 4, 0.8).withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 1],
              ),
            ),
          ),
          ListView.builder(
          padding: const EdgeInsets.all(25.0),
          itemCount: _users.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text(
                      _users[index].login,
                      style: const TextStyle(
                        color: COLOR_BLACK,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 75,
                              backgroundImage: NetworkImage(_users[index].avatarUrl!),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          children: [
                            Text("Id : ${_users[index].id}",style: STYLE3),
                            Text("Type : ${_users[index].type}",style: STYLE3),
                            Text("Site Admin : ${_users[index].siteAdmin}",style: STYLE3),
                            // Text("Node Id : ${_users[index].nodeId}",style: TextStyle(color: COLOR_BLACK),),
                            TextButton(
                              child: Text('GITHUB PROFILE'),
                              onPressed: () async{
                                await launch(_users[index].htmlUrl!);
                              },
                              style: TextButton.styleFrom(
                                primary: Colors.black,
                                textStyle: STYLE2,
                              ),
                            ),
                            TextButton(
                              child: Text('DETAILED PROFILE'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => DetailedUserProfile(user: _users[index])),
                                );
                              },
                              style: TextButton.styleFrom(
                                primary: Colors.black,
                                textStyle: STYLE2,
                              ),
                            ),
                            TextButton(
                              child: const Text('FOLLOWERS'),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => FollowersScreen(url: _users[index].followersUrl!,login: _users[index].login,)),
                                );
                              },
                              style: TextButton.styleFrom(
                                primary: Colors.black,
                                textStyle: STYLE2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        ],
      ),
    );
  }
}
