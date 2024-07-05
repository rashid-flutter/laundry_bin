import 'package:go_router/go_router.dart';
import 'package:laundry_bin/features/auth/Sign_in_page.dart';
import 'package:laundry_bin/features/auth/sign_up_page.dart';
import 'package:laundry_bin/features/navigation/admin/navigationapage.dart';

final GoRouter router = GoRouter(routes: <GoRoute>[
  GoRoute(
    path: '/',
    builder: (context, state) => NavigationAdminPage(),
  ),
  GoRoute(
    path: '/signin',
    builder: (context, state) => SignIn(),
  ),
  GoRoute(
    path: '/signup',
    builder: (context, state) => SignUp(),
  )
]);
