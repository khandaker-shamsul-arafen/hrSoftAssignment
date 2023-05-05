import 'package:flutter_easyloading/flutter_easyloading.dart';

class AppHelper {
  hideLoader() {
    if (EasyLoading.isShow) {
      EasyLoading.dismiss();
    }
  }

  showLoader() {
    return EasyLoading.show(
      // status: 'loading...',
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
  }
}
