import 'package:flutter/material.dart';

enum AlertEnum { error, warning, success, info }

class AlertConfig {
  final String title;
  final Icon icon;
  final bool dismissible;

  const AlertConfig({required this.title, required this.icon, required this.dismissible});
}

final Map<AlertEnum, AlertConfig> alertConfigs = {
  AlertEnum.error: AlertConfig(
    title: 'Hata !!!',
    icon: Icon(Icons.error, color: Colors.red, size: 64),
    dismissible: false,
  ),
  AlertEnum.warning: AlertConfig(
    title: 'Uyarı !!!',
    icon: Icon(Icons.warning, color: Colors.amber, size: 64),
    dismissible: true,
  ),
  AlertEnum.success: AlertConfig(
    title: 'Başarılı !!!',
    icon: Icon(Icons.done_all_sharp, color: Colors.green, size: 64),
    dismissible: false,
  ),
  AlertEnum.info: AlertConfig(
    title: 'Bilgilendirme',
    icon: Icon(Icons.info_outline, color: Colors.blue, size: 64),
    dismissible: true,
  ),
};
