import 'package:flutter/material.dart';
import 'package:gdsc_task/models/users.dart';
import 'package:gdsc_task/models/users_detailed.dart';
import 'package:gdsc_task/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:gdsc_task/screens/followers_screen.dart';

class DetailedUserProfile extends StatefulWidget {
  @override
  State<DetailedUserProfile> createState() => _DetailedUserProfileState();
  Users user;
  DetailedUserProfile({required this.user});
}


class _DetailedUserProfileState extends State<DetailedUserProfile> {

  UsersDetailed myUser = UsersDetailed(
    login: "",
    id: 0,
    nodeId: "",
    avatarUrl: "",
    gravatarId: "",
    url: "",
    htmlUrl: "",
    followersUrl: "",
    followingUrl: "",
    gistsUrl: "",
    starredUrl: "",
    subscriptionsUrl: "",
    organisationsUrl: "",
    reposUrl: "",
    eventsUrl: "",
    receivedEventsUrl: "",
    type: "",
    siteAdmin: false,
    name: "",
    company: "",
    blog: "",
    location: "",
    email: "",
    hireable: "",
    bio: "",
    twitter_username: "",
    public_repos: 0,
    public_gists: 0,
    followers: 0,
    following: 0,
    created_at: "",
    updated_at: "",
  );

  Future<UsersDetailed> fetchData() async {
    final url = Uri.parse(widget.user.url!);
    var response = await http.get(url);
    var data = json.decode(response.body);

    UsersDetailed myUser = UsersDetailed.fromJson(data);
    return myUser;
  }

  @override
  void initState(){
    fetchData().then((value) {
      setState(() {
        myUser = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          myUser.name!,
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
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
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
            child: Column(
              children: [
                myUser.avatarUrl == null ?
                  Text("Please Wait") :
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(myUser.avatarUrl!),
                  ),
                TextButton(
                  child: Text('GITHUB PROFILE',style: STYLE2,),
                  onPressed: () async{
                    await launch(myUser.htmlUrl!);
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.pink,
                  ),
                ),
                TextButton(
                  child: Text('FOLLOWERS',style: STYLE2,),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FollowersScreen(url: myUser.followersUrl!,login: myUser.login,)),
                    );
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.pink,
                  ),
                ),
                SizedBox(height: 25,),
                Text("Name : ${myUser.name}",style: STYLE1,),
                Text("Login : ${myUser.login}",style: STYLE1,),
                Text("Id : ${myUser.id}",style: STYLE1,),
                Text("Location : ${myUser.location}",style: STYLE1,),
                Text("Company : ${myUser.company}",style: STYLE1,),
                Text("Email : ${myUser.email}",style: STYLE1,),
                Text("Twitter Username : ${myUser.twitter_username}",style: STYLE1,),
                Text("Node Id : ${myUser.nodeId}",style: STYLE1,),
                Text("Type : ${myUser.type}",style: STYLE1,),
                Text("Site Admin : ${myUser.siteAdmin}",style: STYLE1,),
                Text("Followers : ${myUser.followers}",style: STYLE1,),
                Text("Following : ${myUser.following}",style: STYLE1,),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

