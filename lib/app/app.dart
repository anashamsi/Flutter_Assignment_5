import 'package:flutter_assignment_5/app/UI/LoginScreen/login_view.dart';
import 'package:flutter_assignment_5/app/UI/MainView/main_view.dart';
import 'package:flutter_assignment_5/app/UI/ProductView/product_view.dart';
import 'package:flutter_assignment_5/app/UI/WishlistScreen/Wishlist_view.dart';

import 'package:stacked/stacked_annotations.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: LoginView),
    MaterialRoute(page: MainView),
    MaterialRoute(page: ProductView),
    MaterialRoute(page: WishlistView, initial: true),
  ],
  dependencies: [],
)
class App {}
