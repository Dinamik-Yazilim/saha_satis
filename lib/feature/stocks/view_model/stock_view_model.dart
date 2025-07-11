import 'package:easy_localization/easy_localization.dart';
import 'package:gen/gen.dart';

import '../../../product/init/language/locale_keys.g.dart';
import '../../../product/service/local_stock_service.dart';
import '../../../product/state/base/base_cubit.dart';
import 'stock_state.dart';

class StockViewModel extends BaseCubit<StockState> {
  StockViewModel({required LocalStockService localStockService})
    : _localStockService = localStockService,
      super(
        const StockState(
          isLoading: false,
          stocks: [],
          stockSearchType: StockSearchType.stockName,
          offset: 0,
          searchTypeText: '',
        ),
      );

  late final LocalStockService _localStockService;

  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  Future<void> fetchStocks({required String searchText, required bool isLoading}) async {
    isLoading ? changeLoading() : null;
    List<StockCardModel> result = await _localStockService.getFilteredStock(
      offset: state.offset,
      searchText: searchText,
      searchType: state.stockSearchType,
      currentSequenceNo: null,
    );
    emit(state.copyWith(stocks: result, offset: 0, stockSearchType: state.stockSearchType));
    _getSearchTypeText();
    isLoading ? changeLoading() : null;
  }

  void _getSearchTypeText() {
    switch (state.stockSearchType) {
      case StockSearchType.stockName:
        emit(state.copyWith(searchTypeText: LocaleKeys.stock_search_type_name.tr()));
      case StockSearchType.barcode:
        emit(state.copyWith(searchTypeText: LocaleKeys.stock_search_type_barcode.tr()));
      case StockSearchType.stockCode:
        emit(state.copyWith(searchTypeText: LocaleKeys.stock_search_type_code.tr()));
    }
  }

  void changeSearchType() {
    StockSearchType searchType = state.stockSearchType;
    state.stockSearchType == StockSearchType.stockName
        ? searchType = StockSearchType.stockCode
        : state.stockSearchType == StockSearchType.stockCode
        ? searchType = StockSearchType.barcode
        : searchType = StockSearchType.stockName;
    emit(state.copyWith(stockSearchType: searchType));
    _getSearchTypeText();
  }
}
