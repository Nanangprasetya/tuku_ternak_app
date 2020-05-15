class PeopleResponse {
  final List<People> results;
  final String error;

  PeopleResponse(this.results, this.error);

  PeopleResponse.formJson(Map<String, dynamic> json)
      : results = (json['results'] as List).map((f) {
          //convert dari List ke objek
          return People.fromJson(f);
        }).toList(),
        error = "";
  PeopleResponse.errorResponse(String errorValue)
      : results = List(),
        error = errorValue;
}

class People {
  final String gender;
  final Name name;
  final Location location;
  final String email;
  final Login login;
  final String phone;
  final String cell;
  final Picture picture;

  People({
    this.gender,
    this.name,
    this.location,
    this.email,
    this.login,
    this.phone,
    this.cell,
    this.picture,
  });

  factory People.fromJson(Map<String, dynamic> json) => People(
        gender: json["gender"],
        name: Name.fromJson(json["name"]),
        location: Location.fromJson(json["location"]),
        email: json["email"],
        login: Login.fromJson(json["login"]),
        phone: json["phone"],
        cell: json["cell"],
        picture: Picture.fromJson(json["picture"]),
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "name": name.toJson(),
        "location": location.toJson(),
        "email": email,
        "login": login.toJson(),
        "phone": phone,
        "cell": cell,
        "picture": picture.toJson(),
      };
}

class Location {
  final String city;
  final String state;
  final String country;
  

  Location({
    this.city,
    this.state,
    this.country,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        city: json["city"],
        state: json["state"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "city": city,
        "state": state,
        "country": country,
      };
}

class Login {
  final String uuid;
  final String username;
  final String password;
  final String salt;
  final String md5;
  final String sha1;
  final String sha256;

  Login({
    this.uuid,
    this.username,
    this.password,
    this.salt,
    this.md5,
    this.sha1,
    this.sha256,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        uuid: json["uuid"],
        username: json["username"],
        password: json["password"],
        salt: json["salt"],
        md5: json["md5"],
        sha1: json["sha1"],
        sha256: json["sha256"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "username": username,
        "password": password,
        "salt": salt,
        "md5": md5,
        "sha1": sha1,
        "sha256": sha256,
      };
}

class Name {
  final String title;
  final String first;
  final String last;

  Name({
    this.title,
    this.first,
    this.last,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        title: json["title"],
        first: json["first"],
        last: json["last"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "first": first,
        "last": last,
      };
}

class Picture {
  final String large;
  final String medium;
  final String thumbnail;

  Picture({
    this.large,
    this.medium,
    this.thumbnail,
  });

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        large: json["large"],
        medium: json["medium"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
        "medium": medium,
        "thumbnail": thumbnail,
      };
}
