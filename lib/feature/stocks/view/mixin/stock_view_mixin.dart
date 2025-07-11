import 'package:dinamik10_pos/feature/stocks/view/stocks_view.dart';
import 'package:dinamik10_pos/feature/stocks/view_model/stock_view_model.dart';
import 'package:dinamik10_pos/product/state/base/base_state.dart';
import 'package:flutter/material.dart';

import '../../../../product/service/local_stock_service.dart';

mixin StockViewMixin on BaseState<StocksView> {
  late final StockViewModel _stocksViewModel;
  late final LocalStockService _localStockService;
  late final TextEditingController searchController;

  StockViewModel get stockViewModel => _stocksViewModel;
  @override
  void initState() {
    super.initState();
    _localStockService = LocalStockService();
    _stocksViewModel = StockViewModel(localStockService: _localStockService);
    searchController = TextEditingController();
    searchController.addListener(() {
      _stocksViewModel.fetchStocks(searchText: searchController.text, isLoading: false);
    });
    _stocksViewModel.fetchStocks(searchText: '', isLoading: true);
  }
}
