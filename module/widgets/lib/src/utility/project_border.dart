import 'package:flutter/material.dart';

/// Project general border radius items
final class ProjectBorderRadius extends BorderRadius {
  /// [ProjectBorderRadius.small] is 4
  ProjectBorderRadius.small() : super.all(Radius.circular(4));

  /// [ProjectBorderRadius.medium] is 8
  ProjectBorderRadius.medium() : super.all(Radius.circular(8));

  /// [ProjectBorderRadius.normal] is 12
  ProjectBorderRadius.normal() : super.all(Radius.circular(12));

  /// [ProjectBorderRadius.large] is 20
  ProjectBorderRadius.large() : super.all(Radius.circular(20));

  /// [ProjectBorderRadius.circle] is max circular
  ProjectBorderRadius.circle() : super.all(Radius.circular(999));
}
