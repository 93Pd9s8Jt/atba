import 'package:atba/models/permission_model.dart';
import 'package:atba/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> showPermissionDialog(BuildContext context) async {
  if (Settings.getValue<String>(Constants.folderPath) != null) return true;
  return await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Permission Required'),
            content: const Text(
                'Storage access is required to download files. Do you want to grant permission?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () async {
                  PermissionModel permissionModel = PermissionModel();
                  bool granted = await permissionModel.grantPermission(
                      Permission.storage, context);
                  Navigator.of(context).pop(granted);
                },
                child: const Text('Yes'),
              ),
            ],
          );
        },
      ) ??
      false;
}
