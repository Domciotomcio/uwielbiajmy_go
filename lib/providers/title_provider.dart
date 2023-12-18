import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uwielbiajmy_go/constants/destinations.dart';

final titleProvider = StateProvider<String>((ref) => menuDestinations[0].title);
