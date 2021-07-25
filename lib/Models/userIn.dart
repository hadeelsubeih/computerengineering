class userInfo {
  final String name;
  final String email;
  final String image;
  final List likes;
  final String id;
  final String role;
  bool admin;
  final  String token;


  userInfo( {
    this.name,
    this.email,
    this.image,
    this.role,
    this.likes,
    this.id,
    this.admin,
    this.token,

  });

  userInfo.fomJson(Map<String, dynamic> parsed)
      : name = parsed['name'],
        email = parsed['email'],
        image = parsed['image'],
        likes = parsed['likes'],
        id = parsed['id'],
        admin = parsed['admin'],
        role = parsed['role'],
        token =parsed['token'];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'image': image,
      'admin': admin,
      'role': role,
      'likes': likes,
      'id': id,
      'token': token,

    };
  }
}