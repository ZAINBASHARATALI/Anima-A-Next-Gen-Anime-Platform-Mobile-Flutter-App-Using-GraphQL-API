class TrendingAnime {
  Page? page;

  TrendingAnime({this.page});

  TrendingAnime.fromJson(Map<String, dynamic> json) {
    page = json['Page'] != null ? Page.fromJson(json['Page']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (page != null) {
      data['Page'] = page!.toJson();
    }
    return data;
  }
}

class Page {
  PageInfo? pageInfo;
  List<Media>? media;

  Page({this.pageInfo, this.media});

  Page.fromJson(Map<String, dynamic> json) {
    pageInfo = json['pageInfo'] != null
        ? PageInfo.fromJson(json['pageInfo'])
        : null;
    if (json['media'] != null) {
      media = <Media>[];
      json['media'].forEach((v) {
        media!.add(Media.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pageInfo != null) {
      data['pageInfo'] = pageInfo!.toJson();
    }
    if (media != null) {
      data['media'] = media!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PageInfo {
  int? total;
  int? perPage;
  int? currentPage;
  int? lastPage;
  bool? hasNextPage;

  PageInfo(
      {this.total,
      this.perPage,
      this.currentPage,
      this.lastPage,
      this.hasNextPage});

  PageInfo.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['perPage'];
    currentPage = json['currentPage'];
    lastPage = json['lastPage'];
    hasNextPage = json['hasNextPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['perPage'] = perPage;
    data['currentPage'] = currentPage;
    data['lastPage'] = lastPage;
    data['hasNextPage'] = hasNextPage;
    return data;
  }
}

class Media {
  int? id;
  Title? title;
  CoverImage? coverImage;
  StartDate? startDate;
  StartDate? endDate;
  String? bannerImage;
  String? season;
  int? seasonYear;
  String? description;
  String? type;
  String? format;
  String? status;
  int? episodes;
  int? duration;
  int? chapters;
  int? volumes;
  List<String>? genres;
  bool? isAdult;
  int? averageScore;
  int? popularity;
  NextAiringEpisode? nextAiringEpisode;
  int? mediaListEntry;
  Studios? studios;

  Media(
      {this.id,
      this.title,
      this.coverImage,
      this.startDate,
      this.endDate,
      this.bannerImage,
      this.season,
      this.seasonYear,
      this.description,
      this.type,
      this.format,
      this.status,
      this.episodes,
      this.duration,
      this.chapters,
      this.volumes,
      this.genres,
      this.isAdult,
      this.averageScore,
      this.popularity,
      this.nextAiringEpisode,
      this.mediaListEntry,
      this.studios});

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    coverImage = json['coverImage'] != null
        ? CoverImage.fromJson(json['coverImage'])
        : null;
    startDate = json['startDate'] != null
        ? StartDate.fromJson(json['startDate'])
        : null;
    endDate = json['endDate'] != null
        ? StartDate.fromJson(json['endDate'])
        : null;
    bannerImage = json['bannerImage'];
    season = json['season'];
    seasonYear = json['seasonYear'];
    description = json['description'];
    type = json['type'];
    format = json['format'];
    status = json['status'];
    episodes = json['episodes'];
    duration = json['duration'];
    chapters = json['chapters'];
    volumes = json['volumes'];
    genres = json['genres'].cast<String>();
    isAdult = json['isAdult'];
    averageScore = json['averageScore'];
    popularity = json['popularity'];
    nextAiringEpisode = json['nextAiringEpisode'] != null
        ? NextAiringEpisode.fromJson(json['nextAiringEpisode'])
        : null;
    mediaListEntry = json['mediaListEntry'];
    studios =
        json['studios'] != null ? Studios.fromJson(json['studios']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (coverImage != null) {
      data['coverImage'] = coverImage!.toJson();
    }
    if (startDate != null) {
      data['startDate'] = startDate!.toJson();
    }
    if (endDate != null) {
      data['endDate'] = endDate!.toJson();
    }
    data['bannerImage'] = bannerImage;
    data['season'] = season;
    data['seasonYear'] = seasonYear;
    data['description'] = description;
    data['type'] = type;
    data['format'] = format;
    data['status'] = status;
    data['episodes'] = episodes;
    data['duration'] = duration;
    data['chapters'] = chapters;
    data['volumes'] = volumes;
    data['genres'] = genres;
    data['isAdult'] = isAdult;
    data['averageScore'] = averageScore;
    data['popularity'] = popularity;
    if (nextAiringEpisode != null) {
      data['nextAiringEpisode'] = nextAiringEpisode!.toJson();
    }
    data['mediaListEntry'] = mediaListEntry;
    if (studios != null) {
      data['studios'] = studios!.toJson();
    }
    return data;
  }
}

class Title {
  String? userPreferred;

  Title({this.userPreferred});

  Title.fromJson(Map<String, dynamic> json) {
    userPreferred = json['userPreferred'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userPreferred'] = userPreferred;
    return data;
  }
}

class CoverImage {
  String? extraLarge;
  String? large;
  String? color;

  CoverImage({this.extraLarge, this.large, this.color});

  CoverImage.fromJson(Map<String, dynamic> json) {
    extraLarge = json['extraLarge'];
    large = json['large'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['extraLarge'] = extraLarge;
    data['large'] = large;
    data['color'] = color;
    return data;
  }
}

class StartDate {
  int? year;
  int? month;
  int? day;

  StartDate({this.year, this.month, this.day});

  StartDate.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    month = json['month'];
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['year'] = year;
    data['month'] = month;
    data['day'] = day;
    return data;
  }
}

class NextAiringEpisode {
  int? airingAt;
  int? timeUntilAiring;
  int? episode;

  NextAiringEpisode({this.airingAt, this.timeUntilAiring, this.episode});

  NextAiringEpisode.fromJson(Map<String, dynamic> json) {
    airingAt = json['airingAt'];
    timeUntilAiring = json['timeUntilAiring'];
    episode = json['episode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['airingAt'] = airingAt;
    data['timeUntilAiring'] = timeUntilAiring;
    data['episode'] = episode;
    return data;
  }
}

class Studios {
  List<Edges>? edges;

  Studios({this.edges});

  Studios.fromJson(Map<String, dynamic> json) {
    if (json['edges'] != null) {
      edges = <Edges>[];
      json['edges'].forEach((v) {
        edges!.add(Edges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (edges != null) {
      data['edges'] = edges!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Edges {
  bool? isMain;
  Node? node;

  Edges({this.isMain, this.node});

  Edges.fromJson(Map<String, dynamic> json) {
    isMain = json['isMain'];
    node = json['node'] != null ? Node.fromJson(json['node']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isMain'] = isMain;
    if (node != null) {
      data['node'] = node!.toJson();
    }
    return data;
  }
}

class Node {
  int? id;
  String? name;

  Node({this.id, this.name});

  Node.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
