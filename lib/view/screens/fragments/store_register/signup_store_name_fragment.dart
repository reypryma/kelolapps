import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kelolapps/config/image.dart';
import 'package:kelolapps/config/kelolaku/color_style.dart';
import 'package:kelolapps/config/kelolaku/text_style.dart';
import 'package:kelolapps/utils/app_strings.dart';
import 'package:kelolapps/utils/dimensions.dart';
import 'package:kelolapps/view/screens/fragments/store_register/signup_store_info_fragment.dart';
import 'package:nb_utils/nb_utils.dart';


class StoreSignupNameFragment extends StatefulWidget {
  @override
  StoreSignupNameFragmentState createState() => StoreSignupNameFragmentState();
}

class StoreSignupNameFragmentState extends State<StoreSignupNameFragment> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.MARGIN_SIZE_GRID_6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 30),
            Image(
              image: const AssetImage(KelolaImage.kelolaLetsJoin),
              height: 150,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(height: 16, width: 16),
            Text(
              AppString.hdWelcome,
              textAlign: TextAlign.left,
              overflow: TextOverflow.clip,
              style: heading1.copyWith(
                color: KelolakuGlobalColor.dark,
              ),
            ),
            // const SizedBox(height: 16, width: 16),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: Dimensions.VERTICAL_SIZE_8),
              child: Text(
                AppString.descWelcome,
                textAlign: TextAlign.left,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  fontSize: 14,
                  color: KelolakuGlobalColor.grayText,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(top: Dimensions.VERTICAL_SIZE_32),
                child: const TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nama Toko'
                    )
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: AppButton(
                width: MediaQuery.of(context).size.width,
                height: 51,
                color: KelolakuGlobalColor.colorPrimaryLogo,
                //context.cardColor,
                text: AppString.createStoreNow,
                textColor: Colors.white,
                onTap: () {
                    Get.to(StoreSignupInfoFragment());
                },
                shapeBorder:
                RoundedRectangleBorder(borderRadius: radius(defaultRadius)),
                padding: const EdgeInsets.all(16),
              ),
            )
          ],
        ),
      ),
    );
  }
}

