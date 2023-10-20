import 'package:flutter/material.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
import 'package:kelolapps/data/model/selected_model.dart';
import 'package:nb_utils/nb_utils.dart';

void showBookBottomSheet(BuildContext context,  KSelectOptionsModel element) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: true,
      shape: RoundedRectangleBorder(borderRadius: radiusOnly(topLeft: 30, topRight: 30)),
      builder: (context) {
        return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    finish(context);
                  },
                  icon: Icon(Icons.cancel_rounded, color: Colors.orange),
                ),
              ),
              // titleText(title: element.name, size: 24),
              16.height,
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                style: heading2,
              ),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // titleText(title: element.title ,size: 16,maxLines: 2),
                      Text(element.title,style: large36,)
                    ],
                  ),
                  AppButton(
                    //padding: EdgeInsets.all(0),
                    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                    child: Text('Book Now',),
                    color: Colors.green,
                    onTap: () {
                      // BMCalenderScreen(element: element,isStaffBooking: false).launch(context);
                    },
                  ),
                ],
              )

            ],
          ).paddingAll(16);
        });
      });
}