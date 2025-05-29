import 'package:dinamik10_pos/product/state/base/base_cubit.dart';
import 'package:dinamik10_pos/product/state/layout_menu/repositories/menu_repositorie.dart';
import 'layout_state.dart';
import '../../../product/state/layout_menu/model/menu_item.dart';

class LayoutViewModel extends BaseCubit<LayoutState> {
  LayoutViewModel()
    : super(LayoutState(isLoading: false, currentMenuItems: MenuRepository.getMainMenuItems(), breadcrumb: []));

  void changeLoading({bool? isLoading}) {
    emit(state.copyWith(isLoading: isLoading ?? !state.isLoading));
  }

  void navigateToSubMenu(MenuItem parentItem) {
    if (!parentItem.isExpandable || parentItem.children == null) {
      emit(state.copyWith(errorMessage: 'Bu öğenin alt menüsü yok veya genişletilemez.'));
      return;
    }

    final updatedBreadcrumb = List<MenuItem>.from(state.breadcrumb)..add(parentItem);

    emit(state.copyWith(currentMenuItems: parentItem.children, breadcrumb: updatedBreadcrumb, errorMessage: null));
  }

  void goBack() {
    if (state.breadcrumb.isEmpty) {
      emit(state.copyWith(errorMessage: 'Zaten ana menüdesiniz.'));
      return;
    }

    final updatedBreadcrumb = List<MenuItem>.from(state.breadcrumb)..removeLast();

    List<MenuItem> previousMenuItems;
    if (updatedBreadcrumb.isEmpty) {
      previousMenuItems = MenuRepository.getMainMenuItems();
    } else {
      previousMenuItems = updatedBreadcrumb.last.children ?? [];
    }

    emit(state.copyWith(currentMenuItems: previousMenuItems, breadcrumb: updatedBreadcrumb, errorMessage: null));
  }

  void resetMenu() {
    emit(
      state.copyWith(
        currentMenuItems: MenuRepository.getMainMenuItems(),
        breadcrumb: [],
        errorMessage: null,
        isLoading: false,
      ),
    );
  }
}
