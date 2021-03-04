import 'package:get_it/get_it.dart';
import 'core/viewmodels/customer_login_view_model.dart';
import 'core/viewmodels/home_view_model.dart';
import 'core/viewmodels/product_detail_view_model.dart';

import 'core/services/navigation_api.dart';
import 'core/viewmodels/badge_menu_view_model.dart';
import 'core/viewmodels/write_comment_view_models.dart';
import 'core/viewmodels/left_drawer_view_model.dart';
import 'core/viewmodels/main_view_model.dart';
import 'core/viewmodels/splash_model.dart';

GetIt locator = GetIt.instance;

void initLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerFactory(() => SplashViewModel());
  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => BadgeMenuViewModel());
  locator.registerFactory(() => LeftDrawerViewModel());
  locator.registerFactory(() => MainViewModel());
  locator.registerFactory(() => WriteCommentViewodel());
  locator.registerFactory(() => CustomerLoginViewModel());
  locator.registerFactory(() => ProductDetailViewModel());
}
