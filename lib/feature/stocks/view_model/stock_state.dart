import 'package:dinamik10_pos/product/service/local_stock_service.dart';
import 'package:equatable/equatable.dart';
import 'package:gen/gen.dart';

final class StockState extends Equatable {
  const StockState({
    required this.searchTypeText,
    required this.isLoading,
    required this.stocks,
    required this.stockSearchType,
    this.offset = 0,
  });

  final bool isLoading;
  final List<StockCardModel> stocks;
  final StockSearchType stockSearchType;
  final int offset;
  final String searchTypeText;

  StockState copyWith({
    bool? isLoading,
    List<StockCardModel>? stocks,
    StockSearchType? stockSearchType,
    int? offset,
    String? searchTypeText,
  }) {
    return StockState(
      isLoading: isLoading ?? this.isLoading,
      stocks: stocks ?? this.stocks,
      stockSearchType: stockSearchType ?? this.stockSearchType,
      searchTypeText: searchTypeText ?? this.searchTypeText,
    );
  }

  @override
  List<Object?> get props => [isLoading, stocks, stockSearchType, offset, searchTypeText];
}
