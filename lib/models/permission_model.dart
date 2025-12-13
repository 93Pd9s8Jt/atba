import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:atba/config/constants.dart';


class PermissionModel {
  Future<bool> grantPermission(Permission permission, BuildContext context) async {
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
    bool? result;

    while (true) {
      folderPath = await selectFolder();
      if (folderPath == null) {
        return false;
      }

      if (await isPathOnSdCard(folderPath)) {
        result = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('SD Card Permission Required'),
              content: Text('The selected folder is on an SD card. To proceed, you need to grant this app permission to manage all external files.'),
              actions: <Widget>[
                TextButton(
                  child: Text('Grant Permission'),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
                TextButton(
                  child: Text('Choose Different Folder'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop(null);
                  },
                ),
              ],
            );
          },
        );

        if (result == true) { // grant manageExternalStorage
          if (await Permission.manageExternalStorage.request().isGranted) {
            await saveFolderPath(folderPath);
            return true;
          } else {
            return false;
          }
        } else if (result == false) { // choose different folder
          continue;
        } else if (result == null) { // cancel
          return false;
        }
      } else {
        await saveFolderPath(folderPath);
        return true;
      }
    }
  }

  Future<String?> selectFolder() async {
    return await FilePicker.platform.getDirectoryPath();
  }

  Future<void> saveFolderPath(String path) async {
    await Settings.setValue<String>(Constants.folderPath, path);
  }

  Future<bool> isPathOnSdCard(String path) async {
    // only works on Android - TODO: make cross platform
    return !path.startsWith("/storage/emulated/0/");
  }
}
