import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:atba/config/constants.dart';
import 'package:saf_util/saf_util.dart';

class PermissionModel {
  Future<bool> grantPermission(
    Permission permission,
    BuildContext context,
  ) async {
    if (permission == Permission.storage) {
      return await _grantStoragePermission(context);
    }
    if (!await permission.isGranted) {
      return await permission.request().isGranted;
    }
    return true;
  }

  Future<bool> _grantStoragePermission(BuildContext context) async {
    if (Settings.getValue<String>(Constants.folderPath) != null) {
      return true;
    }
    String? folderPath;
    while (true) {
      folderPath = await selectFolder();
      if (folderPath == null) {
        return false;
      }

      await saveFolderPath(folderPath);
      return true;
    }
  }

  Future<String?> selectFolder() async {
    if (Platform.isAndroid) {
      final file = (await SafUtil().pickDirectory(
        persistablePermission: true,
        writePermission: true,
      ));
      return file?.uri;
    } else {
      return await FilePicker.platform.getDirectoryPath();
    }
  }

  Future<void> saveFolderPath(String path, {notify = false}) async {
    await Settings.setValue<String>(Constants.folderPath, path, notify: notify);
  }
}
