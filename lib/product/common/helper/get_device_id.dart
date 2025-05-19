//NOTE: Bu kod, cihazın benzersiz kimliğini almak için kullanılabilir.
/* import 'dart:io';
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';

Future<String?> getDeviceId() async {
  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    var iosDeviceInfo = await deviceInfo.iosInfo;
    return iosDeviceInfo.identifierForVendor;
  } else if (Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
    return androidDeviceInfo.id;
  }
  return 'hakan';
}

int generateUniqueId() {
  // Şu anki zamanı al (milisaniye cinsinden)
  final timestamp = DateTime.now().millisecondsSinceEpoch; // 13 basamak

  // 6 basamaklı rastgele bir sayı ekle
  final random = Random().nextInt(999999).toString().padLeft(6, '0');

  // 19 basamaklı tam sayı oluştur
  return int.parse('$timestamp$random');
}
 */
