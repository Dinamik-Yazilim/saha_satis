import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Represents the state of the product features, including theme and authentication token.
final class ProductState extends Equatable {
  /// Constructor for ProductState.
  /// [themeMode] defaults to [ThemeMode.dark].
  /// [authToken] defaults to an empty string.
  const ProductState({this.themeMode = ThemeMode.dark, this.authToken = '', this.appLayout = 'grid'});

  /// The current theme mode of the application.
  final ThemeMode themeMode;

  /// The authentication token for the current user session.
  final String authToken;

  /// The layout of the application, defaulting to 'default'.
  final String appLayout;

  @override
  List<Object> get props => [themeMode, authToken, appLayout];

  /// Creates a copy of [ProductState] with new values.
  ProductState copyWith({ThemeMode? themeMode, String? authToken, String? appLayout}) {
    return ProductState(
      themeMode: themeMode ?? this.themeMode,
      authToken: authToken ?? this.authToken,
      appLayout: appLayout ?? this.appLayout,
    );
  }
}
