class SearchVideoModel {
  SearchVideoModel({this.list});
  List<SearchVideoItemModel>? list;
  SearchVideoModel.fromJson(Map<String, dynamic> json) {
    list = json['result']
        .map<SearchVideoItemModel>((e) => SearchVideoItemModel.fromJson(e))
        .toList();
  }
}

class SearchVideoItemModel {
  SearchVideoItemModel({
    this.type,
    this.id,
    this.cid,
    // this.author,
    // this.mid,
    // this.typeid,
    // this.typename,
    this.arcurl,
    this.aid,
    this.bvid,
    this.title,
    this.description,
    this.pic,
    // this.play,
    this.videoReview,
    // this.favorites,
    this.tag,
    // this.review,
    this.pubdate,
    this.senddate,
    this.duration,
    // this.viewType,
    // this.like,
    // this.upic,
    // this.danmaku,
    this.owner,
    this.stat,
    this.rcmdReason,
  });

  String? type;
  int? id;
  int? cid;
  // String? author;
  // String? mid;
  // String? typeid;
  // String? typename;
  String? arcurl;
  int? aid;
  String? bvid;
  String? title;
  String? description;
  String? pic;
  // String? play;
  int? videoReview;
  // String? favorites;
  String? tag;
  // String? review;
  int? pubdate;
  int? senddate;
  int? duration;
  // String? duration;
  // String? viewType;
  // String? like;
  // String? upic;
  // String? danmaku;
  Owner? owner;
  Stat? stat;
  String? rcmdReason;

  SearchVideoItemModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    cid = json['id'];
    arcurl = json['arcurl'];
    aid = json['aid'];
    title = json['title'].replaceAll(RegExp(r'<.*?>'), '');
    description = json['description'];
    pic = 'https:${json['pic']}';
    videoReview = json['video_review'];
    pubdate = json['pubdate'];
    senddate = json['senddate'];
    duration = test(json['duration']);
    // duration = json['duration'];
    owner = Owner.fromJson(json);
    stat = Stat.fromJson(json);
  }
}

test(String duration) {
  List timeList = duration.split(':');
  int len = timeList.length;
  if (len == 2) {
    return int.parse(timeList[0]) * 60 + int.parse(timeList[1]);
  }
  if (len == 3) {
    return int.parse(timeList[0]) * 3600 +
        int.parse(timeList[1]) * 60 +
        timeList[2];
  }
}

class Stat {
  Stat({
    this.view,
    this.danmaku,
    this.favorite,
    this.reply,
    this.like,
  });

  // 播放量
  int? view;
  // 弹幕数
  int? danmaku;
  // 收藏数
  int? favorite;
  // 评论数
  int? reply;
  // 喜欢
  int? like;

  Stat.fromJson(Map<String, dynamic> json) {
    view = json['play'];
    danmaku = json['danmaku'];
    favorite = json['favorite'];
    reply = json['review'];
    like = json['like'];
  }
}

class Owner {
  Owner({
    this.mid,
    this.name,
    this.face,
  });
  int? mid;
  String? name;
  String? face;

  Owner.fromJson(Map<String, dynamic> json) {
    mid = json["mid"];
    name = json["author"];
    face = json['upic'];
  }
}

class SearchUserModel {
  SearchUserModel({this.list});
  List<SearchUserItemModel>? list;
  SearchUserModel.fromJson(Map<String, dynamic> json) {
    list = json['result']
        .map<SearchUserItemModel>((e) => SearchUserItemModel.fromJson(e))
        .toList();
  }
}

class SearchUserItemModel {
  SearchUserItemModel({
    this.type,
    this.mid,
    this.uname,
    this.usign,
    this.fans,
    this.videos,
    this.upic,
    this.faceNft,
    this.faceNftType,
    this.verifyInfo,
    this.level,
    this.gender,
    this.isUpUser,
    this.isLive,
    this.roomId,
    this.officialVerify,
  });

  String? type;
  int? mid;
  String? uname;
  String? usign;
  int? fans;
  int? videos;
  String? upic;
  int? faceNft;
  int? faceNftType;
  String? verifyInfo;
  int? level;
  int? gender;
  int? isUpUser;
  int? isLive;
  int? roomId;
  Map? officialVerify;

  SearchUserItemModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    mid = json['mid'];
    uname = json['uname'];
    usign = json['usign'];
    fans = json['fans'];
    videos = json['videos'];
    upic = json['upic'];
    faceNft = json['face_nft'];
    faceNftType = json['face_nft_type'];
    verifyInfo = json['verify_info'];
    level = json['level'];
    gender = json['gender'];
    isUpUser = json['is_upuser'];
    isLive = json['is_live'];
    roomId = json['room_id'];
    officialVerify = json['official_verify'];
  }
}

class SearchLiveModel {
  SearchLiveModel({this.list});
  List<SearchLiveItemModel>? list;
  SearchLiveModel.fromJson(Map<String, dynamic> json) {
    list = json['result']
        .map<SearchLiveItemModel>((e) => SearchLiveItemModel.fromJson(e))
        .toList();
  }
}

class SearchLiveItemModel {
  SearchLiveItemModel({
    this.rankOffset,
    this.uid,
    this.tags,
    this.liveTime,
    this.uname,
    this.uface,
    this.userCover,
    this.type,
    this.title,
    this.cover,
    this.online,
    this.rankIndex,
    this.rankScore,
    this.roomid,
    this.attentions,
  });

  int? rankOffset;
  int? uid;
  String? tags;
  String? liveTime;
  String? uname;
  String? uface;
  String? userCover;
  String? type;
  String? title;
  String? cover;
  int? online;
  int? rankIndex;
  int? rankScore;
  int? roomid;
  int? attentions;

  SearchLiveItemModel.fromJson(Map<String, dynamic> json) {
    rankOffset = json['rank_offset'];
    uid = json['uid'];
    tags = json['tags'];
    liveTime = json['live_time'];
    uname = json['uname'];
    uface = json['uface'];
    userCover = json['user_cover'];
    type = json['type'];
    title = json['title'];
    cover = json['cover'];
    online = json['online'];
    rankIndex = json['rank_index'];
    rankScore = json['rank_score'];
    roomid = json['roomid'];
    attentions = json['attentions'];
  }
}