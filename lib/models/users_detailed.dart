class UsersDetailed {
  String login;
  int id;
  String? nodeId;
  String? avatarUrl;
  String? gravatarId;
  String? url;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;
  String? gistsUrl;
  String? starredUrl;
  String? subscriptionsUrl;
  String? organisationsUrl;
  String? reposUrl;
  String? eventsUrl;
  String? receivedEventsUrl;
  String? type;
  bool siteAdmin;
  String? name;
  String? company;
  String? blog;
  String? location;
  String? email;
  String? hireable;
  String? bio;
  String? twitter_username;
  int public_repos;
  int public_gists;
  int followers;
  int following;
  String? created_at;
  String? updated_at;


  UsersDetailed({
    required this.avatarUrl,
    required this.eventsUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.gravatarId,
    required this.htmlUrl,
    required this.id,
    required this.login,
    required this.nodeId,
    required this.organisationsUrl,
    required this.receivedEventsUrl,
    required this.reposUrl,
    required this.siteAdmin,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.type,
    required this.url,
    required this.bio,
    required this.blog,
    required this.company,
    required this.created_at,
    required this.email,
    required this.followers,
    required this.following,
    required this.hireable,
    required this.location,
    required this.name,
    required this.public_gists,
    required this.public_repos,
    required this.twitter_username,
    required this.updated_at,
  });

  factory UsersDetailed.fromJson(Map<String, dynamic> json) {
    return UsersDetailed(
      login: json["login"],
      id: json["id"],
      nodeId: json["node_id"],
      avatarUrl: json["avatar_url"],
      gravatarId: json["grvatar_id"],
      url: json["url"],
      htmlUrl: json["html_url"],
      followersUrl: json["followers_url"],
      followingUrl: json["following_url"],
      gistsUrl: json["gists_url"],
      starredUrl: json["starred_url"],
      subscriptionsUrl: json["subscriptions_url"],
      organisationsUrl: json["organisations_url"],
      reposUrl: json["repos_url"],
      eventsUrl: json["events_url"],
      receivedEventsUrl: json["received_events_url"],
      type: json["type"],
      siteAdmin: json["site_admin"],
      name: json["name"],
      company: json["company"],
      blog: json["blog"],
      location: json["location"],
      email: json["email"],
      hireable: json["hireable"],
      bio: json["bio"],
      twitter_username: json["twitter_username"],
      public_repos: json["public_repos"],
      public_gists: json["public_gists"],
      followers: json["followers"],
      following: json["following"],
      created_at: json["created_at"],
      updated_at: json["updated_at"],
    );
  }
}