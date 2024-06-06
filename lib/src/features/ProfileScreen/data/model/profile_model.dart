class ProfileModel {
  ProfileModel({
    this.id,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.email,
    this.url,
    this.description,
    this.link,
    this.locale,
    this.nickname,
    this.slug,
    this.roles,
    this.registeredDate,
    this.capabilities,
    this.extraCapabilities,
    this.avatarUrls,
    this.links,
  });

  ProfileModel.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    url = json['url'];
    description = json['description'];
    link = json['link'];
    locale = json['locale'];
    nickname = json['nickname'];
    slug = json['slug'];
    roles = json['roles'] != null ? json['roles'].cast<String>() : [];
    registeredDate = json['registered_date'];
    capabilities = json['capabilities'] != null
        ? Capabilities.fromJson(json['capabilities'])
        : null;
    extraCapabilities = json['extra_capabilities'] != null
        ? ExtraCapabilities.fromJson(json['extra_capabilities'])
        : null;
    avatarUrls = Map.from(json["avatar_urls"])
        .map((k, v) => MapEntry<String, String>(k, v));
    links = json['_links'] != null ? Links.fromJson(json['_links']) : null;
  }

  num? id;
  String? username;
  String? name;
  String? firstName;
  String? lastName;
  String? email;
  String? url;
  String? description;
  String? link;
  String? locale;
  String? nickname;
  String? slug;
  List<String>? roles;
  String? registeredDate;
  Capabilities? capabilities;
  ExtraCapabilities? extraCapabilities;
  Map<String, String>? avatarUrls;
  Links? links;

  ProfileModel copyWith({
    num? id,
    String? username,
    String? name,
    String? firstName,
    String? lastName,
    String? email,
    String? url,
    String? description,
    String? link,
    String? locale,
    String? nickname,
    String? slug,
    List<String>? roles,
    String? registeredDate,
    Capabilities? capabilities,
    ExtraCapabilities? extraCapabilities,
    Map<String, String>? avatarUrls,
    Links? links,
  }) =>
      ProfileModel(
        id: id ?? this.id,
        username: username ?? this.username,
        name: name ?? this.name,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        url: url ?? this.url,
        description: description ?? this.description,
        link: link ?? this.link,
        locale: locale ?? this.locale,
        nickname: nickname ?? this.nickname,
        slug: slug ?? this.slug,
        roles: roles ?? this.roles,
        registeredDate: registeredDate ?? this.registeredDate,
        capabilities: capabilities ?? this.capabilities,
        extraCapabilities: extraCapabilities ?? this.extraCapabilities,
        avatarUrls: avatarUrls ?? this.avatarUrls,
        links: links ?? this.links,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['name'] = name;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['url'] = url;
    map['description'] = description;
    map['link'] = link;
    map['locale'] = locale;
    map['nickname'] = nickname;
    map['slug'] = slug;
    map['roles'] = roles;
    map["avatar_urls"] =
        Map.from(avatarUrls!).map((k, v) => MapEntry<String, dynamic>(k, v));
    map['registered_date'] = registeredDate;
    if (capabilities != null) {
      map['capabilities'] = capabilities?.toJson();
    }
    if (extraCapabilities != null) {
      map['extra_capabilities'] = extraCapabilities?.toJson();
    }
    if (links != null) {
      map['_links'] = links?.toJson();
    }
    return map;
  }
}

class Links {
  Links({
    this.self,
    this.collection,
  });

  Links.fromJson(dynamic json) {
    if (json['self'] != null) {
      self = [];
      json['self'].forEach((v) {
        self?.add(Self.fromJson(v));
      });
    }
    if (json['collection'] != null) {
      collection = [];
      json['collection'].forEach((v) {
        collection?.add(Collection.fromJson(v));
      });
    }
  }

  List<Self>? self;
  List<Collection>? collection;

  Links copyWith({
    List<Self>? self,
    List<Collection>? collection,
  }) =>
      Links(
        self: self ?? this.self,
        collection: collection ?? this.collection,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (self != null) {
      map['self'] = self?.map((v) => v.toJson()).toList();
    }
    if (collection != null) {
      map['collection'] = collection?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Collection {
  Collection({
    this.href,
  });

  Collection.fromJson(dynamic json) {
    href = json['href'];
  }

  String? href;

  Collection copyWith({
    String? href,
  }) =>
      Collection(
        href: href ?? this.href,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['href'] = href;
    return map;
  }
}

class Self {
  Self({
    this.href,
  });

  Self.fromJson(dynamic json) {
    href = json['href'];
  }

  String? href;

  Self copyWith({
    String? href,
  }) =>
      Self(
        href: href ?? this.href,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['href'] = href;
    return map;
  }
}

class ExtraCapabilities {
  ExtraCapabilities({
    this.subscriber,
  });

  ExtraCapabilities.fromJson(dynamic json) {
    subscriber = json['subscriber'];
  }

  bool? subscriber;

  ExtraCapabilities copyWith({
    bool? subscriber,
  }) =>
      ExtraCapabilities(
        subscriber: subscriber ?? this.subscriber,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['subscriber'] = subscriber;
    return map;
  }
}

class Capabilities {
  Capabilities({
    this.read,
    this.level0,
    this.subscriber,
  });

  Capabilities.fromJson(dynamic json) {
    read = json['read'];
    level0 = json['level_0'];
    subscriber = json['subscriber'];
  }

  bool? read;
  bool? level0;
  bool? subscriber;

  Capabilities copyWith({
    bool? read,
    bool? level0,
    bool? subscriber,
  }) =>
      Capabilities(
        read: read ?? this.read,
        level0: level0 ?? this.level0,
        subscriber: subscriber ?? this.subscriber,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['read'] = read;
    map['level_0'] = level0;
    map['subscriber'] = subscriber;
    return map;
  }
}
