import 'dart:io';
import 'package:get/get.dart';
import 'package:instagram_media_downloader/Models/InstaUserModel.dart';
import 'package:instagram_media_downloader/Models/PostModel.dart';
import 'package:instagram_media_downloader/services/DatabaseService.dart';

class DBController extends GetxController {
  //Databsae helper

  DatabaseHelper _databaseHelper = DatabaseHelper.instance;
  // posts
  RxList<PostModel> posts = RxList();
  //users
  RxList<InstaUserModel> users = RxList();

  @override
  void onInit() {
    super.onInit();
    getAllUsers();
    getAllPosts();
  }

  insertPost(PostModel post) async {
    posts.insert(0,post);
    await _databaseHelper.insertPost(post);
  }

  insertUser(InstaUserModel user) async {
    users.add(user);
    await _databaseHelper.insertUser(user);
  }

  deletePost(PostModel post) async {
    posts.remove(post);
    await _databaseHelper.deletePost(post);
    deleteFile(
        post.isVideo ? "${post.shortcode}.mp4" : "${post.shortcode}.jpg");
  }

  getAllUsers() async {
    // users.clear();
    List<Map<String, dynamic>> map = await _databaseHelper.getAllUsers();
    print("the map of users length is " + map.length.toString());
    map.forEach((element) {
      users.add(InstaUserModel.fromJson(element));
      // print(element);
    });
    print(users.length.toString());
  }

  getAllPosts() async {
    // posts.clear();
    List<Map<String, dynamic>> map = await _databaseHelper.getAllPosts();
    print("the map of posts length is " + map.length.toString());
    map.forEach((element) {
      posts.add(PostModel.fromDb(element));
    });
    posts = RxList(posts.reversed.toList());
  }

  deleteFile(String filename) async {
    Directory path = Directory("sdcard/InstaDonwloader");
    String filePath = path.path + "/$filename";
    File f = File(filePath);
    if (await f.exists()) {
      print(f.path + " exists");
      f.delete();
    } else {
      print(f.path + " does not exist");
    }
  }
}
