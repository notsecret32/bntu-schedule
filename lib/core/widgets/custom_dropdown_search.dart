import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

// TODO: Make the error output more beautiful

/// Wrapper over [DropdownSearch] from the [dropdown_search](https://pub.dev/packages/dropdown_search) library.
class CustomDropdownSearch extends StatefulWidget {
  const CustomDropdownSearch({
    super.key,
    required this.items,
    this.validator,
    this.onChange,
  });

  /// The item list to display.
  final List<Widget> items;

  /// Validation function, used to be able to add validation anywhere.
  final Function(String? selectedItem)? validator;

  /// The callback function is called when the selected item from the
  /// list is changed.
  final Function(String? selectedItem)? onChange;

  @override
  State<CustomDropdownSearch> createState() => _CustomDropdownSearchState();
}

class _CustomDropdownSearchState extends State<CustomDropdownSearch> {
  /// The selected item.
  ///
  /// It is used for display in the [DropdownSearch] widget,
  /// and is also returned as a parameter for the [onChange]
  /// and [validator] callback functions.
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return DropdownSearch<String>(
      /// ========== [Validation] ==========
      autoValidateMode: AutovalidateMode.onUserInteraction,
      validator: (String? selectedItem) => widget.validator!(selectedItem),

      /// ========== [Input] ==========
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Выберите группу',
          hintStyle: theme.textTheme.titleSmall!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 13.5,
            horizontal: 16,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
      ),

      /// ========== [Dropdown] ==========
      popupProps: PopupProps<String>.menu(
        showSelectedItems: true,
        fit: FlexFit.loose,
        menuProps: const MenuProps(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        itemBuilder: (BuildContext context, String item, bool isSelected) {
          return Container(
            padding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 16,
            ),
            child: Text(
              item,
              style: TextStyle(
                color: isSelected ? theme.colorScheme.primary : Colors.black,
              ),
            ),
          );
        },
        emptyBuilder: (BuildContext context, String error) {
          return Text(error);
        },
      ),

      /// ========== [Events] ==========
      onChanged: (String? selectedItem) {
        setState(() {
          _selectedItem = selectedItem;
        });

        widget.onChange!(selectedItem);
      },

      /// ========== [Items] ==========
      selectedItem: _selectedItem,
      items: _convertToDropdownMenuItems(),
    );
  }

  /// Converts `[List<GroupNumberEntity>]` to `[List<String>]`
  List<String> _convertToDropdownMenuItems() {
    return widget.items
        .map(
          (Widget group) => group.toString(),
        )
        .toList();
  }
}
