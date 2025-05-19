import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../../../widgets.dart';

/// [CustomSearchDropDown] is a customizable and reusable search-based dropdown widget
/// that supports disabling items, async loading, and custom decoration.
/// You can integrate this as a component in your design system or Flutter package.
///
/// Example:
/// ```dart
/// CustomSearchDropDown<String>(
///   items: ['Apple', 'Banana', 'Orange'],
///   selectedItem: 'Apple',
///   itemAsString: (item) => item,
///   onChanged: (val) => print('Selected: $val'),
///   decoration: InputDecoration(labelText: 'Fruits'),
///   disabledMatcher: (item) => item == 'Banana',
/// )
/// ```

class CustomSearchDropDown<T> extends StatelessWidget {
  const CustomSearchDropDown({
    super.key,
    required this.items,
    required this.itemAsString,
    required this.onChanged,
    required this.decoration,
    required this.selectedItem,
    this.clearButtonProps,
    this.disabledMatcher,
  });

  final List<T> items;
  final String Function(T)? itemAsString;
  final ValueChanged<T?>? onChanged;
  final InputDecoration decoration;
  final T? selectedItem;
  final ClearButtonProps? clearButtonProps;

  final bool Function(T item)? disabledMatcher;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final borderRadius = ProjectBorderRadius.large();
    OutlineInputBorder border({double width = 1.0}) {
      return OutlineInputBorder(borderRadius: borderRadius);
    }

    return DropdownSearch<T>(
      selectedItem: selectedItem,
      popupProps: PopupProps.dialog(
        disabledItemFn: disabledMatcher,
        fit: FlexFit.loose,
        showSelectedItems: true,
        showSearchBox: true,
        searchDelay: const Duration(milliseconds: 500),
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
            border: border(),
            focusedBorder: border(),
            enabledBorder: border(),
            errorBorder: border(),
            disabledBorder: border(),
          ),
        ),
        dialogProps: DialogProps(elevation: 10, backgroundColor: theme.colorScheme.surface),
        emptyBuilder: (context, searchEntry) {
          return Center(child: Text('$searchEntry not found', style: theme.textTheme.bodyLarge));
        },
        errorBuilder: (context, searchEntry, exception) {
          return Center(child: Text('An error occurred: ${exception.toString()}', style: theme.textTheme.bodyLarge));
        },
        loadingBuilder: (context, searchEntry) {
          return Center(child: CircularProgressIndicator(color: theme.colorScheme.primary));
        },
      ),
      compareFn: (item1, item2) => item1 == item2,
      items: (String filter, LoadProps? props) async => items,
      itemAsString: itemAsString,
      onChanged: onChanged,
      decoratorProps: DropDownDecoratorProps(decoration: decoration),
    );
  }
}
