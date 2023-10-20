import 'package:flutter/material.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';

import '../../../utils/AppWidget.dart';

class FileManagerBottomSheet extends StatefulWidget {
  @override
  _FileManagerBottomSheetState createState() => _FileManagerBottomSheetState();
}

class _FileManagerBottomSheetState extends State<FileManagerBottomSheet> {
  // late ThemeData theme;
  // late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();

  }

  List<int> _list = List.generate(20, (i) => i);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            _showBottomSheet(context);
          },
          elevation: 2,
          backgroundColor: KelolakuGlobalColor.colorPrimaryLogo,
          label: Text(
            "CREATE",
            style: heading3.copyWith(
                color: KelolakuGlobalColor.dark
            ),
          ),
          icon: Icon(
            Icons.add,
            color: KelolakuGlobalColor.light70,
          ),
        ),
        body: Container(
          color: KelolakuGlobalColor.light70,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            itemCount: _list.length,
            itemBuilder: (context, index) {
              return Ink(
                  color: KelolakuGlobalColor.light70,
                  child: ListTile(
                    leading: Icon(
                      Icons.folder,
                      color: KelolakuGlobalColor.grayFed,
                    ),
                    title: Text(
                      'Folder - ' + _list[index].toString(),
                    ),
                  ));
            },
          ),
        ));
  }

  void _showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext buildContext) {
          return Container(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: KelolakuGlobalColor.light60,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.fromLTRB(12, 0, 0, 8),
                        child: Text("CREATE")),
                    ListTile(
                      dense: true,
                      leading: Icon(Icons.folder_open_outlined,
                          color: Colors.amber.withAlpha(220)),
                      title: Text(
                          "Folder",
                          style: TextStyle(
                              color: Colors.black45,
                              letterSpacing: 0.3,
                              fontWeight: FontWeight.w500)),
                    ),
                    Divider(
                      color: KelolakuGlobalColor.lightSmoke,
                    ),
                    ListTile(
                      dense: true,
                      leading: Icon(Icons.cloud_upload_outlined,
                          color: KelolakuGlobalColor.dark60.withAlpha(220)),
                      title: const Text(
                          "Upload photo",
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
                          "Take Photo",
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
}

