import 'dart:convert';
import 'dart:io';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:instagram_media_downloader/Configuration/Pallete.dart';
import 'package:instagram_media_downloader/Controllers/DatabaseController.dart';
import 'package:instagram_media_downloader/Models/InstaUserModel.dart';
import 'package:instagram_media_downloader/Models/PostModel.dart';
import 'package:instagram_media_downloader/Pages/AboutSection.dart';
import 'package:instagram_media_downloader/Pages/DownloadsSection.dart';
import 'package:instagram_media_downloader/Pages/FavoritesSection.dart';
import 'package:instagram_media_downloader/Pages/SettingsSection.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:http/http.dart' as http;

class AppController extends GetxController {
  List<String> pages = [
    "downloads",
    "settings",
    "favorites",
    "about the app",
  ];
  List<IconData> icons = [
    Icons.download_rounded,
    Icons.settings,
    Icons.star_rate_rounded,
    Icons.info,
    Icons.folder
  ];

  PanelController panelController = PanelController();

  RxDouble minPanelHeight = RxDouble(Get.height * 0.4);

  RxDouble maxPanelHeight = RxDouble(Get.height * 0.85);

  TextEditingController linkController = TextEditingController();

  DBController dbController;

  @override
  void onInit() {
    super.onInit();

    dbController = Get.put(DBController());
    KeyboardVisibilityNotification().addNewListener(
      onChange: (bool visible) {
        print("the keyboard is : " + visible.toString());
        if (visible) {
          minPanelHeight.value = 0;
        } else {
          minPanelHeight.value = Get.height * 0.4;
        }
        update();
      },
    );
  }

  @override
  void onClose() {
    super.onClose();
    linkController.dispose();
  }

  RxString currentPageString = RxString("downloads");
  RxInt currentPageInt = RxInt(0);

  changePage(int index) {
    currentPageInt.value = index;
    currentPageString.value = pages[index];

    update();
  }

  Widget getPageWidget(ScrollController sc) {
    List<Widget> pagesWidgets = [
      DownloadsSection(sc: sc),
      SettingsSection(sc: sc),
      FavoritesSection(sc: sc),
      AboutSection(sc: sc),
    ];
    return pagesWidgets[currentPageInt.value];
  }

  // getDownload
  void download(PostModel postModel) async {
    final PermissionStatus status = await Permission.storage.request();
    final PermissionStatus status2 = await Permission.notification.request();
    print(status2.isGranted);
    print(status.isGranted);
    await _createFolder();
    Get.showSnackbar(GetBar(
      message: "Download started check your status bar",
      title: "Downloading",
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 2, milliseconds: 500),
      borderRadius: 25,
      backgroundColor: color2,
      overlayBlur: 24,
    ));
    await FlutterDownloader.enqueue(
      url: postModel.isVideo ? postModel.videoUrl : postModel.displayUrl,

      savedDir: '/sdcard/InstaDonwloader/',
      fileName: postModel.shortcode + (postModel.isVideo ? ".mp4" : ".jpg"),
      showNotification: true,
      // show download progress in status bar (for Android)
      openFileFromNotification:
          true, // click on notification to open downloaded file (for Android)
    );
    linkController.clear();
  }

  _createFolder() async {
    // final folderName = "InstaDownloader";
    final path = Directory("sdcard/InstaDonwloader");
    if ((await path.exists())) {
      print("exist");
    } else {
      print("not exist");
      path.createSync(recursive: true);
    }
  }

  getFile(String filename) async {
    Directory path = Directory("sdcard/InstaDonwloader");
    String filePath = path.path + "/$filename";
    File f = File(filePath);
    if (await f.exists()) {
      print(f.path + " exists");
      Share.shareFiles(['${f.path}'], text: "Shared from insta downloader!");
    } else {
      print(f.path + " does not exist");
    }
  }

  parseJsonAndDownload(BuildContext context) async {
    String link = linkController.text;
    if (!(link.length == 0)) {
      if ((link.contains("instagram"))) {
        List<String> linkEdit = link.replaceAll(" ", "").split("/");
        print('${linkEdit[0]}//${linkEdit[2]}/${linkEdit[3]}/${linkEdit[4]}' +
            "/?__a=1");
        http.Response response = await http.get(
            '${linkEdit[0]}//${linkEdit[2]}/${linkEdit[3]}/${linkEdit[4]}' +
                "/?__a=1");

        if (response.statusCode == 200) {
          var data = json.decode(response.body);

          PostModel post = PostModel.fromJson(data);

          InstaUserModel user = InstaUserModel.fromJson(
              data['graphql']["shortcode_media"]["owner"]);
          dbController.insertUser(user);
          dbController.insertPost(post);

          download(post);
        } else {
          CoolAlert.show(
              context: context,
              type: CoolAlertType.error,
              animType: CoolAlertAnimType.slideInDown,
              title: "Error ${response.statusCode}",
              confirmBtnColor: Colors.red,
              text: "${response.reasonPhrase}");
        }
      } else {
        CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            animType: CoolAlertAnimType.slideInDown,
            title: "Enter Valid Instagram Link",
            confirmBtnColor: Colors.red,
            text: "the link you have inserted is not a valid Instagram link");
      }
    } else {
      CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          animType: CoolAlertAnimType.slideInDown,
          title: "Empty link",
          confirmBtnColor: Colors.red,
          text: "you haven't inserted any link yet");
    }
  }
}
