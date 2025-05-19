import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum CustomFormFieldType { text, double, email, phone, password }

class CustomFormField extends TextFormField {
  CustomFormField({
    super.key,
    required TextEditingController super.controller,
    required CustomFormFieldType fieldType,
    bool isDone = false,
    String? Function(String?)? validator,
    super.maxLength,
    int? maxLines,
    bool? obscureText,
    bool? readOnly,
    super.focusNode,
    InputDecoration? decoration,
    void Function(String)? onChanged,
    void Function(String)? isDoneCallback,
    bool autoValidate = false,
  }) : super(
         decoration: decoration ?? InputDecoration(labelText: _defaultLabel(fieldType)),
         keyboardType: _getKeyboardType(fieldType),
         inputFormatters: _getInputFormatters(fieldType),
         textInputAction: isDone ? TextInputAction.done : TextInputAction.next,
         validator: validator ?? _defaultValidator(fieldType),
         maxLines: maxLines ?? 1,
         obscureText: obscureText ?? false,
         readOnly: readOnly ?? false,
         onChanged: (val) => onChanged?.call(val.trim()),
         onFieldSubmitted: (val) => isDoneCallback?.call(val.trim()),
         autovalidateMode: autoValidate ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
       );

  static TextInputType _getKeyboardType(CustomFormFieldType type) {
    switch (type) {
      case CustomFormFieldType.double:
        return const TextInputType.numberWithOptions(decimal: true);
      case CustomFormFieldType.email:
        return TextInputType.emailAddress;
      case CustomFormFieldType.phone:
        return TextInputType.phone;
      default:
        return TextInputType.text;
    }
  }

  static List<TextInputFormatter> _getInputFormatters(CustomFormFieldType type) {
    switch (type) {
      case CustomFormFieldType.double:
        return [FilteringTextInputFormatter.allow(RegExp(r'^\d{0,6}(\.\d{0,3})?$'))];
      case CustomFormFieldType.phone:
        return [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(11)];
      default:
        return [];
    }
  }

  static String _defaultLabel(CustomFormFieldType type) {
    switch (type) {
      case CustomFormFieldType.double:
        return 'Sayı';
      case CustomFormFieldType.email:
        return 'E-posta';
      case CustomFormFieldType.phone:
        return 'Telefon';
      case CustomFormFieldType.password:
        return 'Şifre';
      case CustomFormFieldType.text:
        return 'Metin';
    }
  }

  static String? Function(String?) _defaultValidator(CustomFormFieldType type) {
    return (val) {
      val = val?.trim();
      if (val == null || val.isEmpty) return 'Boş bırakılamaz';
      switch (type) {
        case CustomFormFieldType.double:
          return double.tryParse(val) == null ? 'Geçerli bir sayı girin' : null;
        case CustomFormFieldType.email:
          final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
          return emailRegex.hasMatch(val) ? null : 'Geçerli bir e-posta girin';
        case CustomFormFieldType.phone:
          return val.length < 10 ? 'Geçerli bir telefon girin' : null;
        default:
          return null;
      }
    };
  }
}
