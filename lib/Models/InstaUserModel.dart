class InstaUserModel {
  //-->graphql --> {shortcode_media} -->id , shortcode, display_url,is_video {video_url},
  //owner level under shortcode_media -- > id , username , profile_pic_url,full_name,
  //"edge_media_to_caption" level under shortcode_media -- >  "edges" -> at 0 ->"node" - >"text"

  String id;
  String username;
  String profilePicUrl;
  String fullName;

  InstaUserModel({this.id, this.username, this.fullName, this.profilePicUrl});

  factory InstaUserModel.fromJson(Map<String, dynamic> json) {
    return InstaUserModel(
        id: json["id"],
        username: json["username"],
        profilePicUrl: json["profile_pic_url"],
        fullName: json["full_name"]);
  }



  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "username": this.username,
      "profile_pic_url": this.profilePicUrl,
      "full_name": this.fullName
    };
  }
}
