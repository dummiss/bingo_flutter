import 'package:get/get.dart';

import '../app/modules/home/home_binding.dart';
import '../app/modules/home/home_view.dart';
import '../app/modules/home/local/one_player/one_player_binding.dart';
import '../app/modules/home/local/one_player/one_player_view.dart';
import '../app/modules/home/local/two_player/two_player_binding.dart';
import '../app/modules/home/local/two_player/two_player_view.dart';
import '../app/modules/home/online/online_binding.dart';
import '../app/modules/home/online/online_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ONE_PLAYER,
      page: () => const OnePlayerView(),
      binding: OnePlayerBinding(),
    ),
    GetPage(
      name: _Paths.TWO_PLAYER,
      page: () => const TwoPlayerView(),
      binding: TwoPlayerBinding(),
    ),
    GetPage(
      name: _Paths.ONLINE,
      page: () => const OnlineView(),
      binding: OnlineBinding(),
    ),
  ];
}
