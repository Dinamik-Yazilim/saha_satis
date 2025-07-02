import 'package:dinamik10_pos/product/state/base/base_cubit.dart';
import 'package:dinamik10_pos/product/state/layout_menu/repositories/menu_repositorie.dart';
import 'layout_state.dart';
import '../../../product/state/layout_menu/model/menu_item.dart';

class LayoutViewModel extends BaseCubit<LayoutState> {
  final Set<String> _favoriteItemIds = {};

  LayoutViewModel()
    : super(
        LayoutState(
          isLoading: false,
          currentMenuItems: MenuRepository.getMainMenuItems(),
          breadcrumb: [],
          favoriteMenuItems: [],
          showFavoritesOnly: false,
        ),
      ) {
    _loadFavorites();
  }

  void _loadFavorites() {
    /// TODO: apiden gelen favori öğe ID'lerini burada yüklenecek.
    // Ex: _favoriteItemIds.add('satis_faturasi');
    _updateFavoriteMenuItems();
  }

  void changeLoading({bool? isLoading}) {
    emit(state.copyWith(isLoading: isLoading ?? !state.isLoading));
  }

  void toggleShowFavoritesOnly() {
    emit(state.copyWith(showFavoritesOnly: !state.showFavoritesOnly));
  }

  void navigateToSubMenu(MenuItem parentItem) {
    // Favori filtrelemesi açıkken alt menüye gidilirse kapatılabilir
    if (state.showFavoritesOnly) {
      emit(state.copyWith(showFavoritesOnly: false));
    }

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
        showFavoritesOnly: false,
      ),
    );
  }

  void toggleFavorite(MenuItem item) {
    ///TODO: Favori ogeleri apiye gonderilecek
    if (_favoriteItemIds.contains(item.id)) {
      _favoriteItemIds.remove(item.id);
    } else {
      _favoriteItemIds.add(item.id);
    }
    _updateFavoriteMenuItems();
  }

  void _updateFavoriteMenuItems() {
    final List<MenuItem> updatedFavorites = [];
    _collectFavorites(MenuRepository.getMainMenuItems(), updatedFavorites);
    emit(state.copyWith(favoriteMenuItems: updatedFavorites));
  }

  void _collectFavorites(List<MenuItem> menuItems, List<MenuItem> collectedFavorites) {
    for (var item in menuItems) {
      if (_favoriteItemIds.contains(item.id)) {
        collectedFavorites.add(item.copyWith(isFavorite: true));
      }
      if (item.children != null) {
        _collectFavorites(item.children!, collectedFavorites);
      }
    }
  }

  bool isMenuItemFavorite(MenuItem item) {
    return _favoriteItemIds.contains(item.id);
  }
}
