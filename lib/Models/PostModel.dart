class PostModel {
  //-->graphql --> {shortcode_media} -->id , shortcode, display_url,is_video {video_url},
  //owner level under shortcode_media -- > id , username , profile_pic_url,full_name,
  //"edge_media_to_caption" level under shortcode_media -- >  "edges" -> at 0 ->"node" - >"text"

  String id;
  String shortcode;
  String displayUrl;
  bool isVideo;
  String videoUrl;
  String caption;
  String ownerId;

  PostModel(
      {this.id,
      this.shortcode,
      this.caption,
      this.displayUrl,
      this.isVideo,
      this.videoUrl,
      this.ownerId});
  factory PostModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> shortcodeMedia = json['graphql']["shortcode_media"];

    var edges = shortcodeMedia["edge_media_to_caption"]["edges"];
    return PostModel(
        id: shortcodeMedia["id"],
        shortcode: shortcodeMedia["shortcode"],
        displayUrl: shortcodeMedia["display_url"],
        isVideo: shortcodeMedia["is_video"],
        videoUrl:
            shortcodeMedia["is_video"] ? shortcodeMedia["video_url"] : "none",
        caption: edges.length == 0 ? "No Caption " : edges[0]["node"]["text"],
        ownerId: shortcodeMedia["owner"]["id"]);
  }

  factory PostModel.fromDb(Map<String, dynamic> json) {
    return PostModel(
        id: json["id"],
        isVideo: json["is_video"] == 1,
        shortcode: json["shortcode"],
        displayUrl: json["displayUrl"],
        videoUrl: json["videoUrl"],
        caption: json["caption"],
        ownerId: json["ownerId"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "is_video": this.isVideo ? 1 : 0,
      "shortcode": this.shortcode,
      "displayUrl": this.displayUrl,
      "videoUrl": this.videoUrl,
      "caption": this.caption,
      "ownerId": this.ownerId
    };
  }
}
