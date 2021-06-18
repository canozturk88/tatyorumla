import 'package:get_it/get_it.dart';
import 'package:tadayim_bunu/core/viewmodels/commentator_profile_view_model.dart';
import 'package:tadayim_bunu/core/viewmodels/customer_signup_view_model.dart';
import 'package:tadayim_bunu/core/viewmodels/filter_page_view_model.dart';
import 'package:tadayim_bunu/core/viewmodels/product_search_view_model.dart';
import 'core/viewmodels/add_comment_view_model.dart';
import 'core/viewmodels/change_mail_address_view_model.dart';
import 'core/viewmodels/change_password_view_model.dart';
import 'core/viewmodels/commet_like_view_model.dart';
import 'core/viewmodels/customer_login_view_model.dart';
import 'core/viewmodels/customer_profile_view_model.dart';
import 'core/viewmodels/forgot_password_view_model.dart';
import 'core/viewmodels/home_view_model.dart';
import 'core/viewmodels/my_profile_info_view_model.dart';
import 'core/viewmodels/product_comment_view_model.dart';
import 'core/viewmodels/product_detail_view_model.dart';
import 'core/services/navigation_api.dart';
import 'core/viewmodels/badge_menu_view_model.dart';
import 'core/viewmodels/splash_view_model.dart';
import 'core/viewmodels/write_comment_view_models.dart';
import 'core/viewmodels/left_drawer_view_model.dart';
import 'core/viewmodels/main_view_model.dart';

GetIt locator = GetIt.instance;

void initLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerFactory(() => SplashViewModel());
  locator.registerFactory(() => HomeViewModel());
  locator.registerFactory(() => BadgeMenuViewModel());
  locator.registerFactory(() => LeftDrawerViewModel());
  locator.registerFactory(() => MainViewModel());
  locator.registerFactory(() => WriteCommentViewodel());
  locator.registerFactory(() => CustomerSignInViewModel());
  locator.registerFactory(() => ProductDetailViewModel());
  locator.registerFactory(() => CustomerSignupViewModel());
  locator.registerFactory(() => CustomerProfileViewModel());
  locator.registerFactory(() => MyProfileInfoViewModel());
  locator.registerFactory(() => ChangePasswordViewModel());
  locator.registerFactory(() => ChangeMailAddressViewModel());
  locator.registerFactory(() => ForgotPasswordViewModel());
  locator.registerFactory(() => ProductCommentViewModel());
  locator.registerFactory(() => ProductSearchViewModel());
  locator.registerFactory(() => AddCommentViewModel());
  locator.registerFactory(() => CommentatorProfileViewModel());
  locator.registerFactory(() => FilterPageViewModel());
  locator.registerFactory(() => CommetLikeViewViewModel());
}
