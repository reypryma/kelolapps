import 'package:flutter/material.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';

void showEmployeeOptionSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext buildContext) {
        return Container(
          color: Colors.transparent,
          child: Container(
            decoration: const BoxDecoration(
                color: KelolakuGlobalColor.light60,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.fromLTRB(12, 0, 0, 8),
                      child: const Text("Pilih Opsi")),
                  // ListTile(
                  //   dense: true,
                  //   leading: Icon(Icons.folder_open_outlined,
                  //       color: Colors.amber.withAlpha(220)),
                  //   title: const Text(
                  //       "Folder",
                  //       style: TextStyle(
                  //           color: Colors.black45,
                  //           letterSpacing: 0.3,
                  //           fontWeight: FontWeight.w500)),
                  // ),
                  const Divider(
                    color: KelolakuGlobalColor.grayFed,
                  ),
                  ListTile(
                    dense: true,
                    leading: Icon(Icons.cloud_upload_outlined,
                        color: KelolakuGlobalColor.dark60.withAlpha(220)),
                    title: const Text(
                        "Informasi Izin Akses Pengurus Toko",
                        style: TextStyle(
                            color: KelolakuGlobalColor.dark,
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.w500)),
                  ),
                  ListTile(
                    dense: true,
                    leading: Icon(Icons.camera_alt_outlined,
                        color: KelolakuGlobalColor.ocean.withAlpha(220)),
                    title: const Text(
                        "Tambahkan Pengurus Toko",
                        style: TextStyle(
                            color: KelolakuGlobalColor.dark60,
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
