import 'package:background_downloader/background_downloader.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:atba/config/constants.dart';

class PermissionModel {
  Future<bool> grantPermission(
    Permission permission,
    BuildContext context,
  ) async {
    if (permission == Permission.storage) {
      return await grantStoragePermission(context);
    }
    final isGranted = await permission.isGranted;
    if (!isGranted) {
      //print(await permission.status);
      return await permission.request().isGranted;
    }
    return true;
  }

  Future<bool> grantStoragePermission(
    BuildContext context, {
    notify = false,
  }) async {
    if (Settings.getValue<String>(Constants.folderPath) != null) {
      return true;
    }
    Uri? folderPath;
    while (true) {
      folderPath = await selectFolder();
      if (folderPath == null) {
        return false;
      }

      await saveFolderPath(folderPath, notify: notify);
      return true;
    }
  }

  Future<Uri?> selectFolder() async {
    return await FileDownloader().uri.pickDirectory(
      persistedUriPermission: true,
    );
    //await FilePicker.platform.getDirectoryPath();
  }

  Future<void> saveFolderPath(Uri uri, {notify = false}) async {
    await Settings.setValue<String>(
      Constants.folderPath,
      uri.toString(),
      notify: notify,
    );
  }
}
