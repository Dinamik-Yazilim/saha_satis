import 'package:equatable/equatable.dart';
import '../../../product/state/layout_menu/model/menu_item.dart';

final class LayoutState extends Equatable {
  const LayoutState({
    required this.isLoading,
    this.currentMenuItems = const [],
    this.breadcrumb = const [],
    this.errorMessage,
  });

  final bool isLoading;
  final List<MenuItem> currentMenuItems;
  final List<MenuItem> breadcrumb;
  final String? errorMessage;

  bool get isOnMainMenu => breadcrumb.isEmpty;

  LayoutState copyWith({
    bool? isLoading,
    List<MenuItem>? currentMenuItems,
    List<MenuItem>? breadcrumb,
    String? errorMessage,
  }) {
    return LayoutState(
      isLoading: isLoading ?? this.isLoading,
      currentMenuItems: currentMenuItems ?? this.currentMenuItems,
      breadcrumb: breadcrumb ?? this.breadcrumb,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, currentMenuItems, breadcrumb, errorMessage];
}
