import 'package:auto_size_text/auto_size_text.dart';
import 'package:book/src/features/noori_naats/presentation/otherBooks/books.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:prayers_times/prayers_times.dart';

import '../../../utils/colors.dart';
import '../../kalam_list_screen.dart';
import '../favouriteKalam.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    _getCurrentPosition();
    super.initState();
  }

  String? _currentAddress;
  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final SearchController _searchController = SearchController();
  int _gridIndex = 0;
  final List _gridList = [
    "نعتیں",
    "کتابیں",
    "قاعدہ",
    "فضائل",
    "سٹوڈیو",
    "Favourite",
  ];
  final _gridPages = [
    KalamList(),
    BooksHomePage(),
    KalamList(),
    BooksHomePage(),
    KalamList(),
    FavouriteKalam(),
  ];

  @override
  Widget build(BuildContext context) {
    Duration Timediff(dt1, dt2) {
      final startTime = dt1;
      final currentTime = dt2;

      final diff = currentTime.difference(startTime);
      return diff;
    }

    var lat = _currentPosition?.latitude ?? 0;
    var lng = _currentPosition?.longitude ?? 0;

    // Define the geographical coordinates for the location
    Coordinates coordinates = Coordinates(lat, lng);

// Specify the calculation parameters for prayer times
    PrayerCalculationParameters params = PrayerCalculationMethod.karachi();
    params.madhab = PrayerMadhab.hanafi;

// Create a PrayerTimes instance for the specified location
    PrayerTimes prayerTimes = PrayerTimes(
      coordinates: coordinates,
      calculationParameters: params,
      precision: true,
      locationName: 'Asia/Karachi',
    );

    String current = prayerTimes.currentPrayer();
    String next = prayerTimes.nextPrayer();
    print('Current Prayer: $current ${prayerTimes.timeForPrayer(current)}');
    print('Next Prayer: $next ${prayerTimes.timeForPrayer(next)}');
    final heigth = MediaQuery.of(context).size.height;
    final weigth = MediaQuery.of(context).size.width;

    TimeOfDay TimeNow = TimeOfDay.now();

    return Scaffold(
      key: _key,
      backgroundColor: backgroundColor,
      appBar: _buildAppBar(),
      endDrawer: _drawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: heigth * 0.4,
            width: double.infinity,
            decoration: BoxDecoration(
              color: blueColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(48),
                bottomLeft: Radius.circular(48),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 24, 0, 4),
                  child: AutoSizeText(
                    "Current Prayer Time",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 24, 0, 4),
                  child: AutoSizeText(
                    "${prayerTimes.currentPrayer()}",
                    style: TextStyle(
                      color: yellowColor,
                      fontSize: weigth * 0.1,
                      fontStyle: FontStyle.italic,
                      shadows: [
                        Shadow(
                            color: Colors.grey.withOpacity(0.2),
                            offset: Offset(5, 5))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 24, 0, 4),
                  child: prayerTimes.timeForPrayer(current) == "isha"
                      ? AutoSizeText(
                          'Start Time:  ${TimeOfDay.fromDateTime(prayerTimes.ishaStartTime!).format(context)}',
                          style: TextStyle(
                            color: lightBlue,
                          ),
                        )
                      : prayerTimes.timeForPrayer(next) == "maghrib"
                          ? AutoSizeText(
                              'Start Time:  ${TimeOfDay.fromDateTime(prayerTimes.maghribStartTime!).format(context)}',
                              style: TextStyle(
                                color: lightBlue,
                              ),
                            )
                          : prayerTimes.timeForPrayer(next) == "asr"
                              ? AutoSizeText(
                                  'Start Time:  ${TimeOfDay.fromDateTime(prayerTimes.asrStartTime!).format(context)}',
                                  style: TextStyle(
                                    color: lightBlue,
                                  ),
                                )
                              : prayerTimes.timeForPrayer(next) == "dhuhr"
                                  ? AutoSizeText(
                                      'Start Time:  ${TimeOfDay.fromDateTime(prayerTimes.dhuhrStartTime!).format(context)}',
                                      style: TextStyle(
                                        color: lightBlue,
                                      ),
                                    )
                                  : prayerTimes.timeForPrayer(next) == "fajr"
                                      ? AutoSizeText(
                                          'Start Time:  ${TimeOfDay.fromDateTime(prayerTimes.fajrStartTime!).format(context)}',
                                          style: TextStyle(
                                            color: lightBlue,
                                          ),
                                        )
                                      : AutoSizeText(
                                          'Start Time: ',
                                          style: TextStyle(
                                            color: lightBlue,
                                          ),
                                        ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                  child: prayerTimes.timeForPrayer(current) == "isha"
                      ? AutoSizeText(
                          'End Time:  ${TimeOfDay.fromDateTime(prayerTimes.ishaEndTime!).format(context)}',
                          style: TextStyle(
                            color: lightBlue,
                          ),
                        )
                      : prayerTimes.timeForPrayer(next) == "maghrib"
                          ? AutoSizeText(
                              'End Time:  ${TimeOfDay.fromDateTime(prayerTimes.maghribEndTime!).format(context)}',
                              style: TextStyle(
                                color: lightBlue,
                              ),
                            )
                          : prayerTimes.timeForPrayer(next) == "asr"
                              ? AutoSizeText(
                                  'End Time:  ${TimeOfDay.fromDateTime(prayerTimes.asrEndTime!).format(context)}',
                                  style: TextStyle(
                                    color: lightBlue,
                                  ),
                                )
                              : prayerTimes.timeForPrayer(next) == "dhuhr"
                                  ? AutoSizeText(
                                      'End Time:  ${TimeOfDay.fromDateTime(prayerTimes.dhuhrEndTime!).format(context)}',
                                      style: TextStyle(
                                        color: lightBlue,
                                      ),
                                    )
                                  : prayerTimes.timeForPrayer(next) == "fajr"
                                      ? AutoSizeText(
                                          'End Time:  ${TimeOfDay.fromDateTime(prayerTimes.fajrEndTime!).format(context)}',
                                          style: TextStyle(
                                            color: lightBlue,
                                          ),
                                        )
                                      : AutoSizeText(
                                          'End Time: ',
                                          style: TextStyle(
                                            color: lightBlue,
                                          ),
                                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeText(
                    'Next Prayer: $next ${TimeOfDay.fromDateTime(prayerTimes.timeForPrayer(next)!).format(context)}',
                    style: TextStyle(
                      color: lightBlue,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                  child: AutoSizeText(
                    'Tahajjud End Time: ${TimeOfDay.fromDateTime(prayerTimes.tahajjudEndTime!).format(context)}',
                    style: TextStyle(
                      color: lightBlue,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                  child: IconButton(
                    onPressed: _getCurrentPosition,
                    icon: Icon(Icons.refresh),
                    color: yellowColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(8, 24, 8, 12),
              //margin: EdgeInsets.fromLTRB(2, 0, 2, 0),
              height: heigth * 0.4,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                ),
              ),
              child: GridView.builder(
                itemCount: _gridList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          _gridIndex = index;
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => _gridPages[_gridIndex],
                            ),
                          );
                        },
                      );
                    },
                    child: Card(
                      color: Colors.white,
                      margin: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            "راہِ نجات",
                            style: TextStyle(
                                color: blueColor, fontSize: weigth * 0.01),
                          ),
                          AutoSizeText(
                            _gridList[index].toString(),
                            style: TextStyle(
                              fontSize: weigth * 0.06,
                              color: blueColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {
            _key.currentState!.openEndDrawer();
          },
          icon: Icon(
            Icons.menu_rounded,
            color: yellowColor,
            size: 34,
          ),
        ),
      ],
      title: AutoSizeText(
        "Raah e Nijaat",
        style: TextStyle(
          color: yellowColor,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: blueColor,
    );
  }

  Drawer _drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                //bottomRight: Radius.circular(24),
                bottomLeft: Radius.circular(50),
              ),
              color: blueColor,
            ),
            child: Image(
              image: AssetImage("assets/images/logo_animated.gif"),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.account_circle,
              color: blueColor,
            ),
            title: Text('Profile'),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FavouriteKalam(),
                ),
              );
            },
            leading: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            title: Text('Favourite'),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: blueColor,
            ),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}
