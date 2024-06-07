class ProductModel {
  ProductModel({
    this.links,
    this.averageRating,
    this.backordered,
    this.backorders,
    this.backordersAllowed,
    this.buttonText,
    this.catalogVisibility,
    this.categories,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.description,
    this.dimensions,
    this.downloadExpiry,
    this.downloadLimit,
    this.downloadable,
    this.externalUrl,
    this.featured,
    this.id,
    this.images,
    this.inStock,
    this.manageStock,
    this.menuOrder,
    this.name,
    this.onSale,
    this.parentId,
    this.permalink,
    this.postAuthor,
    this.price,
    this.priceHtml,
    this.purchasable,
    this.purchaseNote,
    this.ratingCount,
    this.regularPrice,
    this.relatedIds,
    this.reviewsAllowed,
    this.salePrice,
    this.shippingClass,
    this.shippingClassId,
    this.shippingRequired,
    this.shippingTaxable,
    this.shortDescription,
    this.sku,
    this.slug,
    this.soldIndividually,
    this.status,
    this.store,
    this.tags,
    this.taxClass,
    this.taxStatus,
    this.totalSales,
    this.type,
    this.virtual,
    this.weight,});

  ProductModel.fromJson(dynamic json) {
    links = json['_links'] != null ? Links.fromJson(json['_links']) : null;
    averageRating = json['average_rating'];
    backordered = json['backordered'];
    backorders = json['backorders'];
    backordersAllowed = json['backorders_allowed'];
    buttonText = json['button_text'];
    catalogVisibility = json['catalog_visibility'];
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
    dateCreated = json['date_created'];
    dateCreatedGmt = json['date_created_gmt'];
    dateModified = json['date_modified'];
    dateModifiedGmt = json['date_modified_gmt'];
    description = json['description'];
    dimensions = json['dimensions'] != null ? Dimensions.fromJson(json['dimensions']) : null;
    downloadExpiry = json['download_expiry'];
    downloadLimit = json['download_limit'];
    downloadable = json['downloadable'];
    externalUrl = json['external_url'];
    featured = json['featured'];
    id = json['id'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(Images.fromJson(v));
      });
    }
    inStock = json['in_stock'];
    manageStock = json['manage_stock'];
    menuOrder = json['menu_order'];
    name = json['name'];
    onSale = json['on_sale'];
    parentId = json['parent_id'];
    permalink = json['permalink'];
    postAuthor = json['post_author'];
    price = json['price'];
    priceHtml = json['price_html'];
    purchasable = json['purchasable'];
    purchaseNote = json['purchase_note'];
    ratingCount = json['rating_count'];
    regularPrice = json['regular_price'];
    relatedIds = json['related_ids'] != null ? json['related_ids'].cast<num>() : [];
    reviewsAllowed = json['reviews_allowed'];
    salePrice = json['sale_price'];
    shippingClass = json['shipping_class'];
    shippingClassId = json['shipping_class_id'];
    shippingRequired = json['shipping_required'];
    shippingTaxable = json['shipping_taxable'];
    shortDescription = json['short_description'];
    sku = json['sku'];
    slug = json['slug'];
    soldIndividually = json['sold_individually'];
    status = json['status'];
    store = json['store'] != null ? Store.fromJson(json['store']) : null;
    if (json['tags'] != null) {
      tags = [];
      json['tags'].forEach((v) {
        tags?.add(Tags.fromJson(v));
      });
    }
    taxClass = json['tax_class'];
    taxStatus = json['tax_status'];
    totalSales = json['total_sales'];
    type = json['type'];
    virtual = json['virtual'];
    weight = json['weight'];
  }
  Links? links;
  String? averageRating;
  bool? backordered;
  String? backorders;
  bool? backordersAllowed;
  String? buttonText;
  String? catalogVisibility;
  List<Categories>? categories;
  String? dateCreated;
  String? dateCreatedGmt;
  String? dateModified;
  String? dateModifiedGmt;
  String? description;
  Dimensions? dimensions;
  num? downloadExpiry;
  num? downloadLimit;
  bool? downloadable;
  String? externalUrl;
  bool? featured;
  num? id;
  List<Images>? images;
  bool? inStock;
  bool? manageStock;
  num? menuOrder;
  String? name;
  bool? onSale;
  num? parentId;
  String? permalink;
  String? postAuthor;
  String? price;
  String? priceHtml;
  bool? purchasable;
  String? purchaseNote;
  num? ratingCount;
  String? regularPrice;
  List<num>? relatedIds;
  bool? reviewsAllowed;
  String? salePrice;
  String? shippingClass;
  num? shippingClassId;
  bool? shippingRequired;
  bool? shippingTaxable;
  String? shortDescription;
  String? sku;
  String? slug;
  bool? soldIndividually;
  String? status;
  Store? store;
  List<Tags>? tags;
  String? taxClass;
  String? taxStatus;
  num? totalSales;
  String? type;
  bool? virtual;
  String? weight;
  ProductModel copyWith({  Links? links,
    String? averageRating,
    bool? backordered,
    String? backorders,
    bool? backordersAllowed,
    String? buttonText,
    String? catalogVisibility,
    List<Categories>? categories,
    String? dateCreated,
    String? dateCreatedGmt,
    String? dateModified,
    String? dateModifiedGmt,
    String? description,
    Dimensions? dimensions,
    num? downloadExpiry,
    num? downloadLimit,
    bool? downloadable,
    String? externalUrl,
    bool? featured,
    num? id,
    List<Images>? images,
    bool? inStock,
    bool? manageStock,
    num? menuOrder,
    String? name,
    bool? onSale,
    num? parentId,
    String? permalink,
    String? postAuthor,
    String? price,
    String? priceHtml,
    bool? purchasable,
    String? purchaseNote,
    num? ratingCount,
    String? regularPrice,
    List<num>? relatedIds,
    bool? reviewsAllowed,
    String? salePrice,
    String? shippingClass,
    num? shippingClassId,
    bool? shippingRequired,
    bool? shippingTaxable,
    String? shortDescription,
    String? sku,
    String? slug,
    bool? soldIndividually,
    String? status,
    Store? store,
    List<Tags>? tags,
    String? taxClass,
    String? taxStatus,
    num? totalSales,
    String? type,
    bool? virtual,
    String? weight,
  }) => ProductModel(  links: links ?? this.links,
    averageRating: averageRating ?? this.averageRating,
    backordered: backordered ?? this.backordered,
    backorders: backorders ?? this.backorders,
    backordersAllowed: backordersAllowed ?? this.backordersAllowed,
    buttonText: buttonText ?? this.buttonText,
    catalogVisibility: catalogVisibility ?? this.catalogVisibility,
    categories: categories ?? this.categories,
    dateCreated: dateCreated ?? this.dateCreated,
    dateCreatedGmt: dateCreatedGmt ?? this.dateCreatedGmt,
    dateModified: dateModified ?? this.dateModified,
    dateModifiedGmt: dateModifiedGmt ?? this.dateModifiedGmt,
    description: description ?? this.description,
    dimensions: dimensions ?? this.dimensions,
    downloadExpiry: downloadExpiry ?? this.downloadExpiry,
    downloadLimit: downloadLimit ?? this.downloadLimit,
    downloadable: downloadable ?? this.downloadable,
    externalUrl: externalUrl ?? this.externalUrl,
    featured: featured ?? this.featured,
    id: id ?? this.id,
    images: images ?? this.images,
    inStock: inStock ?? this.inStock,
    manageStock: manageStock ?? this.manageStock,
    menuOrder: menuOrder ?? this.menuOrder,
    name: name ?? this.name,
    onSale: onSale ?? this.onSale,
    parentId: parentId ?? this.parentId,
    permalink: permalink ?? this.permalink,
    postAuthor: postAuthor ?? this.postAuthor,
    price: price ?? this.price,
    priceHtml: priceHtml ?? this.priceHtml,
    purchasable: purchasable ?? this.purchasable,
    purchaseNote: purchaseNote ?? this.purchaseNote,
    ratingCount: ratingCount ?? this.ratingCount,
    regularPrice: regularPrice ?? this.regularPrice,
    relatedIds: relatedIds ?? this.relatedIds,
    reviewsAllowed: reviewsAllowed ?? this.reviewsAllowed,
    salePrice: salePrice ?? this.salePrice,
    shippingClass: shippingClass ?? this.shippingClass,
    shippingClassId: shippingClassId ?? this.shippingClassId,
    shippingRequired: shippingRequired ?? this.shippingRequired,
    shippingTaxable: shippingTaxable ?? this.shippingTaxable,
    shortDescription: shortDescription ?? this.shortDescription,
    sku: sku ?? this.sku,
    slug: slug ?? this.slug,
    soldIndividually: soldIndividually ?? this.soldIndividually,
    status: status ?? this.status,
    store: store ?? this.store,
    tags: tags ?? this.tags,
    taxClass: taxClass ?? this.taxClass,
    taxStatus: taxStatus ?? this.taxStatus,
    totalSales: totalSales ?? this.totalSales,
    type: type ?? this.type,
    virtual: virtual ?? this.virtual,
    weight: weight ?? this.weight,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (links != null) {
      map['_links'] = links?.toJson();
    }
    map['average_rating'] = averageRating;
    map['backordered'] = backordered;
    map['backorders'] = backorders;
    map['backorders_allowed'] = backordersAllowed;
    map['button_text'] = buttonText;
    map['catalog_visibility'] = catalogVisibility;
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    map['date_created'] = dateCreated;
    map['date_created_gmt'] = dateCreatedGmt;
    map['date_modified'] = dateModified;
    map['date_modified_gmt'] = dateModifiedGmt;
    map['description'] = description;
    if (dimensions != null) {
      map['dimensions'] = dimensions?.toJson();
    }
    map['download_expiry'] = downloadExpiry;
    map['download_limit'] = downloadLimit;
    map['downloadable'] = downloadable;
    map['external_url'] = externalUrl;
    map['featured'] = featured;
    map['id'] = id;
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    map['in_stock'] = inStock;
    map['manage_stock'] = manageStock;
    map['menu_order'] = menuOrder;
    map['name'] = name;
    map['on_sale'] = onSale;
    map['parent_id'] = parentId;
    map['permalink'] = permalink;
    map['post_author'] = postAuthor;
    map['price'] = price;
    map['price_html'] = priceHtml;
    map['purchasable'] = purchasable;
    map['purchase_note'] = purchaseNote;
    map['rating_count'] = ratingCount;
    map['regular_price'] = regularPrice;
    map['related_ids'] = relatedIds;
    map['reviews_allowed'] = reviewsAllowed;
    map['sale_price'] = salePrice;
    map['shipping_class'] = shippingClass;
    map['shipping_class_id'] = shippingClassId;
    map['shipping_required'] = shippingRequired;
    map['shipping_taxable'] = shippingTaxable;
    map['short_description'] = shortDescription;
    map['sku'] = sku;
    map['slug'] = slug;
    map['sold_individually'] = soldIndividually;
    map['status'] = status;
    if (store != null) {
      map['store'] = store?.toJson();
    }
    if (tags != null) {
      map['tags'] = tags?.map((v) => v.toJson()).toList();
    }
    map['tax_class'] = taxClass;
    map['tax_status'] = taxStatus;
    map['total_sales'] = totalSales;
    map['type'] = type;
    map['virtual'] = virtual;
    map['weight'] = weight;
    return map;
  }

}

class Tags {
  Tags({
    this.id,
    this.name,
    this.slug,});

  Tags.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }
  num? id;
  String? name;
  String? slug;
  Tags copyWith({  num? id,
    String? name,
    String? slug,
  }) => Tags(  id: id ?? this.id,
    name: name ?? this.name,
    slug: slug ?? this.slug,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    return map;
  }

}

class Store {
  Store({
    this.address,
    this.avatar,
    this.id,
    this.name,
    this.url,});

  Store.fromJson(dynamic json) {
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
    avatar = json['avatar'];
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }
  Address? address;
  String? avatar;
  num? id;
  String? name;
  String? url;
  Store copyWith({  Address? address,
    String? avatar,
    num? id,
    String? name,
    String? url,
  }) => Store(  address: address ?? this.address,
    avatar: avatar ?? this.avatar,
    id: id ?? this.id,
    name: name ?? this.name,
    url: url ?? this.url,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (address != null) {
      map['address'] = address?.toJson();
    }
    map['avatar'] = avatar;
    map['id'] = id;
    map['name'] = name;
    map['url'] = url;
    return map;
  }

}

class Address {
  Address({
    this.city,
    this.country,
    this.state,
    this.street1,
    this.street2,
    this.zip,});

  Address.fromJson(dynamic json) {
    city = json['city'];
    country = json['country'];
    state = json['state'];
    street1 = json['street_1'];
    street2 = json['street_2'];
    zip = json['zip'];
  }
  String? city;
  String? country;
  String? state;
  String? street1;
  String? street2;
  String? zip;
  Address copyWith({  String? city,
    String? country,
    String? state,
    String? street1,
    String? street2,
    String? zip,
  }) => Address(  city: city ?? this.city,
    country: country ?? this.country,
    state: state ?? this.state,
    street1: street1 ?? this.street1,
    street2: street2 ?? this.street2,
    zip: zip ?? this.zip,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city'] = city;
    map['country'] = country;
    map['state'] = state;
    map['street_1'] = street1;
    map['street_2'] = street2;
    map['zip'] = zip;
    return map;
  }

}

class Images {
  Images({
    this.alt,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.id,
    this.name,
    this.position,
    this.src,});

  Images.fromJson(dynamic json) {
    alt = json['alt'];
    dateCreated = json['date_created'];
    dateCreatedGmt = json['date_created_gmt'];
    dateModified = json['date_modified'];
    dateModifiedGmt = json['date_modified_gmt'];
    id = json['id'];
    name = json['name'];
    position = json['position'];
    src = json['src'];
  }
  String? alt;
  String? dateCreated;
  String? dateCreatedGmt;
  String? dateModified;
  String? dateModifiedGmt;
  num? id;
  String? name;
  num? position;
  String? src;
  Images copyWith({  String? alt,
    String? dateCreated,
    String? dateCreatedGmt,
    String? dateModified,
    String? dateModifiedGmt,
    num? id,
    String? name,
    num? position,
    String? src,
  }) => Images(  alt: alt ?? this.alt,
    dateCreated: dateCreated ?? this.dateCreated,
    dateCreatedGmt: dateCreatedGmt ?? this.dateCreatedGmt,
    dateModified: dateModified ?? this.dateModified,
    dateModifiedGmt: dateModifiedGmt ?? this.dateModifiedGmt,
    id: id ?? this.id,
    name: name ?? this.name,
    position: position ?? this.position,
    src: src ?? this.src,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['alt'] = alt;
    map['date_created'] = dateCreated;
    map['date_created_gmt'] = dateCreatedGmt;
    map['date_modified'] = dateModified;
    map['date_modified_gmt'] = dateModifiedGmt;
    map['id'] = id;
    map['name'] = name;
    map['position'] = position;
    map['src'] = src;
    return map;
  }

}

class Dimensions {
  Dimensions({
    this.height,
    this.length,
    this.width,});

  Dimensions.fromJson(dynamic json) {
    height = json['height'];
    length = json['length'];
    width = json['width'];
  }
  String? height;
  String? length;
  String? width;
  Dimensions copyWith({  String? height,
    String? length,
    String? width,
  }) => Dimensions(  height: height ?? this.height,
    length: length ?? this.length,
    width: width ?? this.width,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['height'] = height;
    map['length'] = length;
    map['width'] = width;
    return map;
  }

}

class Categories {
  Categories({
    this.id,
    this.name,
    this.slug,});

  Categories.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
  }
  num? id;
  String? name;
  String? slug;
  Categories copyWith({  num? id,
    String? name,
    String? slug,
  }) => Categories(  id: id ?? this.id,
    name: name ?? this.name,
    slug: slug ?? this.slug,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    return map;
  }

}

class Links {
  Links({
    this.collection,
    this.self,});

  Links.fromJson(dynamic json) {
    if (json['collection'] != null) {
      collection = [];
      json['collection'].forEach((v) {
        collection?.add(Collection.fromJson(v));
      });
    }
    if (json['self'] != null) {
      self = [];
      json['self'].forEach((v) {
        self?.add(Self.fromJson(v));
      });
    }
  }
  List<Collection>? collection;
  List<Self>? self;
  Links copyWith({  List<Collection>? collection,
    List<Self>? self,
  }) => Links(  collection: collection ?? this.collection,
    self: self ?? this.self,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (collection != null) {
      map['collection'] = collection?.map((v) => v.toJson()).toList();
    }
    if (self != null) {
      map['self'] = self?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Self {
  Self({
    this.href,});

  Self.fromJson(dynamic json) {
    href = json['href'];
  }
  String? href;
  Self copyWith({  String? href,
  }) => Self(  href: href ?? this.href,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['href'] = href;
    return map;
  }

}

class Collection {
  Collection({
    this.href,});

  Collection.fromJson(dynamic json) {
    href = json['href'];
  }
  String? href;
  Collection copyWith({  String? href,
  }) => Collection(  href: href ?? this.href,
  );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['href'] = href;
    return map;
  }

}