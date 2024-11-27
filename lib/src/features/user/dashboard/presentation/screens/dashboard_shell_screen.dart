import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:naviquezon/src/core/abstracts/cubit_state_abstract.dart';
import 'package:naviquezon/src/core/themes/styles/text_style_default.dart';
import 'package:naviquezon/src/core/widgets/text_fields/rounded_text_field.dart';
import 'package:naviquezon/src/features/establishment/application/blocs/establishment_list_get_cubit.dart';
import 'package:naviquezon/src/features/establishment/domain/models/establishment_model.dart';
import 'package:naviquezon/src/features/establishment/presentation/screens/establishment_discover_screen.dart';
import 'package:naviquezon/src/features/establishment/presentation/screens/establishment_itinerary_screen.dart';
import 'package:naviquezon/src/features/establishment/presentation/screens/establishment_map_screen.dart';
import 'package:naviquezon/src/features/profile/presentation/screens/profile_screen.dart';
import 'package:naviquezon/src/features/user/faq/presentation/screens/faq_screen.dart';

///{@template DashboardShellScreen}
/// Custom widget that display the dashboard screen of the app
///{@endtemplate}
class DashboardShellScreen extends StatefulWidget {
  const DashboardShellScreen({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<DashboardShellScreen> createState() => _ScreenState();
}

class _ScreenState extends State<DashboardShellScreen> {
  final _estaCubit = EstablishmentListGetCubit();

  final _searchController = TextEditingController();
  List<EstablishmentModel> _estaList = [];

  int _currentIndex = 0;

  bool _isMap = false;

  @override
  void initState() {
    super.initState();

    _initBlocs();
  }

  /// Method to initialize the blocs/cubits
  ///
  void _initBlocs() {
    _estaCubit.run();
  }

  /// Method that handle the navigation of the bottom navigation bar.
  ///
  void _onItemTapped(int index) {
    //  Don't do anything if the index is the same
    if (_currentIndex == index) return;

    switch (index) {
      case 0:
        context.go(EstablishmentDiscoverScreen.route);
      case 1:
        context.go(FaqScreen.route);
      case 2:
        context.go(EstablishmentItineraryScreen.route);
      case 3:
        context.go(ProfileScreen.route);
    }

    setState(() {
      _currentIndex = index;
      _isMap = false;
    });
  }

  /// Method to handle the search changed
  ///
  void _onSearchChanged(List<EstablishmentModel> list, String value) {
    //  Convert the search value to lowercase
    final search = value.toLowerCase();

    //  Filter the list based on the search value
    final filteredList = list.where((element) {
      //  Convert the name and address to lowercase
      final name = element.name.toLowerCase();
      //  Convert the address to lowercase
      final address = element.address.toLowerCase();

      //  Check if the name or address contains the search value
      return name.contains(search) || address.contains(search);
    }).toList();

    //  Set the filtered list to the esta list
    setState(() {
      _estaList = filteredList;
    });
  }

  /// Method to handle the search card pressed
  ///
  void _onSearchCardPressed(EstablishmentModel esta) {
    //  Convert the latitude and longitude to double
    final lat = esta.latitude.toDouble();
    final long = esta.longitude.toDouble();

    //  Create the latlng object
    final latLng = LatLng(lat, long);

    setState(() {
      //  Set the is map to true
      _isMap = true;
    });

    //  Set the search controller text to the establishment name
    _searchController.text = esta.name;

    //  Navigate to the establishment map screen
    context.go(EstablishmentMapScreen.route, extra: latLng);
  }

  /// Method to handle the clear pressed
  ///
  void _onClearPressed() {
    setState(() {
      //  Clear the search controller
      _searchController.clear();

      //  Set the map to false
      _isMap = false;
    });

    //  Navigate to the establishment discover screen
    context.go(EstablishmentDiscoverScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _estaCubit,
      child: Scaffold(
        body: Stack(
          children: [
            widget.child,
            if (_currentIndex == 0) ...[
              BlocBuilder<EstablishmentListGetCubit, CubitState>(
                builder: (context, estaState) {
                  if (estaState is CubitStateSuccess) {
                    final value = estaState.value;
                    final estaList = value as List<EstablishmentModel>;

                    return SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 4,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: RoundedTextField(
                                    controller: _searchController,
                                    hint: 'Search',
                                    enabled: !_isMap,
                                    prefixIcon: const Icon(Icons.search),
                                    onChanged: (value) {
                                      _onSearchChanged(estaList, value);
                                    },
                                  ),
                                ),
                                if (_searchController.text.isNotEmpty) ...[
                                  TextButton(
                                    onPressed: _onClearPressed,
                                    child: const Text('Clear'),
                                  ),
                                ],
                              ],
                            ),
                            if (_searchController.text.isNotEmpty) ...[
                              if (!_isMap) ...[
                                ColoredBox(
                                  color: Colors.white,
                                  child: _estaList.isEmpty
                                      ? const Text(
                                          'No establishment record found',
                                        )
                                      : Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: _estaList.map((esta) {
                                            return _DashboardSearchCard(
                                              onPressed: () {
                                                _onSearchCardPressed(
                                                  esta,
                                                );
                                              },
                                              esta: esta,
                                            );
                                          }).toList(),
                                        ),
                                ),
                              ],
                            ],
                          ],
                        ),
                      ),
                    );
                  }

                  return const SizedBox();
                },
              ),
            ],
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              tooltip: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'FAQ',
              tooltip: 'FAQ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: 'Itinerary',
              tooltip: 'Itinerary',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle_outlined,
              ),
              label: 'Profile',
              tooltip: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

///{@template _DashboardSearchCard}
/// Custom widget that display the search card in the dashboard screen
///{@endtemplate}
class _DashboardSearchCard extends StatelessWidget {
  const _DashboardSearchCard({
    required void Function() onPressed,
    required EstablishmentModel esta,
  })  : _esta = esta,
        _onPressed = onPressed;

  final void Function() _onPressed;
  final EstablishmentModel _esta;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: const RoundedRectangleBorder(),
        ),
        onPressed: _onPressed,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _esta.name,
              ),
              Text(
                _esta.address,
                style: textStyle10w400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
