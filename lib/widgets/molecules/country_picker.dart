import 'package:balancebyte/core/theme/theme_palette/default_palette.dart';
import 'package:balancebyte/extensions/build_context.dart';
import 'package:balancebyte/extensions/num.dart';
import 'package:balancebyte/generated/assets/assets.gen.dart';
import 'package:balancebyte/utils/country.dart';
import 'package:flutter/material.dart';

class CountryDropdownSearch extends StatefulWidget {
  final void Function(String) onCountrySelected;
  final String? initialCountry;
  final String hint;

  const CountryDropdownSearch({
    required this.onCountrySelected,
    super.key,
    this.initialCountry,
    this.hint = "Select a country",
  });

  @override
  CountryDropdownSearchState createState() => CountryDropdownSearchState();
}

class CountryDropdownSearchState extends State<CountryDropdownSearch> {
  final TextEditingController _controller = TextEditingController();
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  List<Country> _allCountries = [];
  List<Country> _filteredCountries = [];

  @override
  void initState() {
    super.initState();
    _controller.text = widget.initialCountry ?? "";
    _loadCountries();
  }

  Future<void> _loadCountries() async {
    final countries = await CountryUtil.loadCountries();
    setState(() {
      _allCountries = countries;
      _filteredCountries = countries;
    });
  }

  void _filterCountries(String query) {
    setState(() {
      _filteredCountries = _allCountries
          .where(
            (country) =>
                country.name.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    });
  }

  void _toggleDropdown() {
    if (_overlayEntry == null) {
      _showDropdown();
    } else {
      _removeDropdown();
    }
  }

  void _showDropdown() {
    final overlay = Overlay.of(context);
    _overlayEntry = _createOverlayEntry();
    overlay.insert(_overlayEntry!);
  }

  void _removeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  OverlayEntry _createOverlayEntry() {
    final renderBox = context.findRenderObject()! as RenderBox;
    final size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          offset: Offset(0, size.height),
          child: Material(
            color: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.only(top: 8.0.s),
              child: Container(
                constraints: BoxConstraints(maxHeight: 286.0.s),
                decoration: BoxDecoration(
                  color: DefaultPalette.backgroundFormColor,
                  border: Border.all(color: DefaultPalette.inactiveTextColor),
                  borderRadius: BorderRadius.circular(14.0.s),
                ),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: _filteredCountries.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        _filteredCountries[index].name,
                        style: context.theme.textTheme.titleLarge
                            ?.copyWith(color: DefaultPalette.kDarkGreen),
                      ),
                      onTap: () =>
                          _selectCountry(_filteredCountries[index].name),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _selectCountry(String country) {
    _controller.text = country;
    widget.onCountrySelected(country);
    _removeDropdown();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextFormField(
        onTap: () {
          if (_overlayEntry == null) {
            _showDropdown();
          }
        },
        onChanged: (value) {
          _filterCountries(value);
          if (_overlayEntry == null) {
            _showDropdown();
          }
        },
        cursorColor: DefaultPalette.borderColor,
        controller: _controller,
        style: context.theme.textTheme.titleLarge
            ?.copyWith(color: DefaultPalette.kDarkGreen),
        decoration: InputDecoration(
          filled: true,
          fillColor: DefaultPalette.backgroundFormColor,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: "Country",
          labelStyle: context.theme.textTheme.titleLarge
              ?.copyWith(color: DefaultPalette.inactiveTextColor),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: _overlayEntry != null
                  ? DefaultPalette.inactiveTextColor
                  : DefaultPalette.backgroundFormColor,
            ),
            borderRadius: BorderRadius.circular(14.0.s),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.0.s),
            borderSide: const BorderSide(
              color: DefaultPalette.inactiveTextColor,
            ),
          ),
          suffixIcon: IconButton(
            icon: _overlayEntry == null
                ? Assets.icons.arrowBottom.svg()
                : Assets.icons.arrowTop.svg(),
            onPressed: _toggleDropdown,
          ),
        ),
        validator: (value) {},
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _removeDropdown();
    super.dispose();
  }
}
