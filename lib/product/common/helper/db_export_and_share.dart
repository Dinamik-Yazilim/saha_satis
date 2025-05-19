//NOTE: Bu dosya, veritabanını dışa aktarma ve paylaşma işlemlerini gerçekleştiren bir yardımcı fonksiyon içerir.
/* // ignore_for_file: use_build_context_synchronously, deprecated_member_use, depend_on_referenced_packages

import 'package:dinamic_mobile/common_widgets/custom_show_dialog.dart';
import 'package:dinamic_mobile/product/model/app_setting_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:share_plus/share_plus.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';

import '../../init/db/app_data_helper.dart';
import '../../init/db/db_initialize.dart';

Future<void> exportAndShareDatabase() async {
  AppSettingModel appSettingModel = (await AppDataHelper().getAppSetting()).first;
  try {
    //NOTENOTE Veritabanı yolunu al
    final dbPath = await getDatabasesPath();
    final pathMood = join(dbPath, 'dinamik_db.db');

    //NOTENOTE Veritabanı dosyasını geçici bir dizine kopyala
    final directory = await getTemporaryDirectory();
    final newDbPath = join(directory.path, '${appSettingModel.vkn}_dinamik_db.db');
    await File(pathMood).copy(newDbPath);

    Logger().i('Veritabanı dosyası kopyalandı: $newDbPath');

    //NOTENOTE Dosyayı paylaş
    Share.shareXFiles([XFile(newDbPath)], text: '${appSettingModel.vkn} VKN numarali Veritabanı');
  } catch (e) {
    Logger().e('Veritabanı paylaşımında hata: $e');
  }
}

Future<void> importDatabase(BuildContext context) async {
  try {
    //NOTE Kullanıcıdan bir dosya seçmesini iste
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      String? pathToImportedDb = result.files.single.path;

      //NOTE Veritabanı yolunu al
      final dbPath = await getDatabasesPath();
      final pathMood = join(dbPath, 'dinamik_db.db');

      //NOTE Seçilen dosyayı mevcut veritabanı dosyasının üzerine yaz
      await File(pathToImportedDb!).copy(pathMood).then((value) {});
      Logger().i('Veritabanı başarılı bir şekilde içe aktarıldı: $pathToImportedDb');
      showDialogGeneral(
          context: context, alertEnum: AlertEnum.done, subTitle: 'Veritabanı başarılı bir şekilde içe aktarıldı');

      //NOTE Veritabanını yeniden yükle
      await DatabaseInitialize.initDatabase();
    } else {
      showDialogGeneral(context: context, alertEnum: AlertEnum.error, subTitle: 'Herhangi bir dosya seçilmedi.');
    }
  } catch (e) {
    Logger().e('Veritabanı içe aktarmada hata: $e');
    showDialogGeneral(context: context, alertEnum: AlertEnum.error, subTitle: 'Veritabanı içe aktarmada hata: $e');
  }
}
 */