import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const NavBarPage() : const SignUpWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const NavBarPage() : const SignUpWidget(),
        ),
        FFRoute(
          name: 'Login',
          path: '/login',
          builder: (context, params) => const LoginWidget(),
        ),
        FFRoute(
          name: 'SignUp',
          path: '/signUp',
          builder: (context, params) => const SignUpWidget(),
        ),
        FFRoute(
          name: 'SignUpInfo1',
          path: '/signUpInfo1',
          builder: (context, params) => SignUpInfo1Widget(
            email: params.getParam('email', ParamType.String),
            password: params.getParam('password', ParamType.String),
            passwordConformation:
                params.getParam('passwordConformation', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'ProfileEditing',
          path: '/profileEditing',
          requireAuth: true,
          builder: (context, params) => const ProfileEditingWidget(),
        ),
        FFRoute(
          name: 'ChatPage',
          path: '/chatPage',
          requireAuth: true,
          asyncParams: {
            'chatUser': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => ChatPageWidget(
            chatUser: params.getParam('chatUser', ParamType.Document),
            chatRef: params.getParam(
                'chatRef', ParamType.DocumentReference, false, ['chats']),
          ),
        ),
        FFRoute(
          name: 'Inbox',
          path: '/inbox',
          requireAuth: true,
          builder: (context, params) => const InboxWidget(),
        ),
        FFRoute(
          name: 'Calendar',
          path: '/calendar',
          requireAuth: true,
          builder: (context, params) => const CalendarWidget(),
        ),
        FFRoute(
          name: 'Dashboard',
          path: '/dashboard',
          requireAuth: true,
          builder: (context, params) => const DashboardWidget(),
        ),
        FFRoute(
          name: 'DescribeYourSpaceIntro',
          path: '/DescribeYourSpaceIntro',
          requireAuth: true,
          builder: (context, params) => const DescribeYourSpaceIntroWidget(),
        ),
        FFRoute(
          name: 'DescribeYourSpaceTypes',
          path: '/DescribeYourSpaceTypes',
          requireAuth: true,
          builder: (context, params) => const DescribeYourSpaceTypesWidget(),
        ),
        FFRoute(
          name: 'DescribeYourSpaceRegion',
          path: '/DescribeYourSpaceRegion',
          requireAuth: true,
          builder: (context, params) => DescribeYourSpaceRegionWidget(
            property: params.getParam(
                'property', ParamType.DocumentReference, false, ['properties']),
          ),
        ),
        FFRoute(
          name: 'DescribeYourSpaceBasics',
          path: '/DescribeYourSpaceBasics',
          requireAuth: true,
          builder: (context, params) => DescribeYourSpaceBasicsWidget(
            property: params.getParam(
                'property', ParamType.DocumentReference, false, ['properties']),
          ),
        ),
        FFRoute(
          name: 'DescribeYourSpaceUsages',
          path: '/DescribeYourSpaceUsages',
          requireAuth: true,
          builder: (context, params) => DescribeYourSpaceUsagesWidget(
            property: params.getParam(
                'property', ParamType.DocumentReference, false, ['properties']),
          ),
        ),
        FFRoute(
          name: 'DescribeYourSpaceLocation',
          path: '/DescribeYourSpaceLocation',
          requireAuth: true,
          builder: (context, params) => DescribeYourSpaceLocationWidget(
            property: params.getParam(
                'property', ParamType.DocumentReference, false, ['properties']),
          ),
        ),
        FFRoute(
          name: 'HighlightIntro',
          path: '/HighlightIntro',
          requireAuth: true,
          builder: (context, params) => HighlightIntroWidget(
            property: params.getParam(
                'property', ParamType.DocumentReference, false, ['properties']),
          ),
        ),
        FFRoute(
          name: 'HighlightAmenities',
          path: '/HighlightAmenities',
          requireAuth: true,
          builder: (context, params) => HighlightAmenitiesWidget(
            property: params.getParam(
                'property', ParamType.DocumentReference, false, ['properties']),
          ),
        ),
        FFRoute(
          name: 'HighlightPhotos',
          path: '/HighlightPhotos',
          requireAuth: true,
          builder: (context, params) => HighlightPhotosWidget(
            property: params.getParam(
                'property', ParamType.DocumentReference, false, ['properties']),
            listbytes: params.getParam<FFUploadedFile>(
                'listbytes', ParamType.FFUploadedFile, true),
          ),
        ),
        FFRoute(
          name: 'HighlightTitle',
          path: '/HighlightTitle',
          requireAuth: true,
          builder: (context, params) => HighlightTitleWidget(
            property: params.getParam(
                'property', ParamType.DocumentReference, false, ['properties']),
          ),
        ),
        FFRoute(
          name: 'HighlightDescription',
          path: '/HighlightDescription',
          requireAuth: true,
          builder: (context, params) => HighlightDescriptionWidget(
            property: params.getParam(
                'property', ParamType.DocumentReference, false, ['properties']),
          ),
        ),
        FFRoute(
          name: 'FinishAndPublish',
          path: '/FinishAndPublish',
          requireAuth: true,
          builder: (context, params) => FinishAndPublishWidget(
            property: params.getParam(
                'property', ParamType.DocumentReference, false, ['properties']),
          ),
        ),
        FFRoute(
          name: 'FinishAndPublishPrice',
          path: '/FinishAndPublishPrice',
          requireAuth: true,
          builder: (context, params) => FinishAndPublishPriceWidget(
            property: params.getParam(
                'property', ParamType.DocumentReference, false, ['properties']),
          ),
        ),
        FFRoute(
          name: 'FinishAndPublishRestauration',
          path: '/FinishAndPublishRestauration',
          requireAuth: true,
          builder: (context, params) => FinishAndPublishRestaurationWidget(
            property: params.getParam(
                'property', ParamType.DocumentReference, false, ['properties']),
          ),
        ),
        FFRoute(
          name: 'FinishAndPublishActivities',
          path: '/FinishAndPublishActivities',
          requireAuth: true,
          builder: (context, params) => FinishAndPublishActivitiesWidget(
            property: params.getParam(
                'property', ParamType.DocumentReference, false, ['properties']),
          ),
        ),
        FFRoute(
          name: 'Profile',
          path: '/profile',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'Profile')
              : const NavBarPage(
                  initialPage: 'Profile',
                  page: ProfileWidget(),
                ),
        ),
        FFRoute(
          name: 'Reviews',
          path: '/reviews',
          requireAuth: true,
          asyncParams: {
            'property': getDoc(['properties'], PropertiesRecord.fromSnapshot),
          },
          builder: (context, params) => ReviewsWidget(
            property: params.getParam('property', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'Explore',
          path: '/explore',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'Explore')
              : ExploreWidget(
                  filterAdults:
                      params.getParam('filterAdults', ParamType.double),
                  filterRegion: params.getParam<String>(
                      'filterRegion', ParamType.String, true),
                  filterMinimumPrice:
                      params.getParam('filterMinimumPrice', ParamType.double),
                  filterMaximumPrice:
                      params.getParam('filterMaximumPrice', ParamType.double),
                  filterPets: params.getParam('filterPets', ParamType.bool),
                  filterOffer: params.getParam<String>(
                      'filterOffer', ParamType.String, true),
                  filterBeds: params.getParam('filterBeds', ParamType.double),
                  filterBedrooms:
                      params.getParam('filterBedrooms', ParamType.double),
                  filterBathrooms:
                      params.getParam('filterBathrooms', ParamType.double),
                  filterAmenities: params.getParam<String>(
                      'filterAmenities', ParamType.String, true),
                  filterStandoutAmenities: params.getParam<String>(
                      'filterStandoutAmenities', ParamType.String, true),
                  filterSafetyItems: params.getParam<String>(
                      'filterSafetyItems', ParamType.String, true),
                  filterActivities: params.getParam<String>(
                      'filterActivities', ParamType.String, true),
                  filterRestauration: params.getParam<String>(
                      'filterRestauration', ParamType.String, true),
                ),
        ),
        FFRoute(
          name: 'DetailsProperty',
          path: '/detailsProperty',
          requireAuth: true,
          asyncParams: {
            'property': getDoc(['properties'], PropertiesRecord.fromSnapshot),
          },
          builder: (context, params) => DetailsPropertyWidget(
            property: params.getParam('property', ParamType.Document),
            startDate: params.getParam('startDate', ParamType.DateTime),
            endDate: params.getParam('endDate', ParamType.DateTime),
            capacity: params.getParam('capacity', ParamType.double),
          ),
        ),
        FFRoute(
          name: 'DescribeYourSpaceLocationDescription',
          path: '/DescribeYourSpaceLocationDescription',
          requireAuth: true,
          builder: (context, params) =>
              DescribeYourSpaceLocationDescriptionWidget(
            property: params.getParam(
                'property', ParamType.DocumentReference, false, ['properties']),
          ),
        ),
        FFRoute(
          name: 'FinishAndPublishRules',
          path: '/FinishAndPublishRules',
          requireAuth: true,
          builder: (context, params) => FinishAndPublishRulesWidget(
            property: params.getParam(
                'property', ParamType.DocumentReference, false, ['properties']),
          ),
        ),
        FFRoute(
          name: 'Favorites',
          path: '/favorites',
          requireAuth: true,
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'Favorites')
              : const NavBarPage(
                  initialPage: 'Favorites',
                  page: FavoritesWidget(),
                ),
        ),
        FFRoute(
          name: 'StaggeredView',
          path: '/staggeredView',
          requireAuth: true,
          builder: (context, params) => StaggeredViewWidget(
            photos: params.getParam<String>('photos', ParamType.String, true),
          ),
        ),
        FFRoute(
          name: 'MyListings',
          path: '/myListings',
          requireAuth: true,
          builder: (context, params) => const MyListingsWidget(),
        ),
        FFRoute(
          name: 'RequestToBook',
          path: '/requestToBook',
          requireAuth: true,
          asyncParams: {
            'property': getDoc(['properties'], PropertiesRecord.fromSnapshot),
          },
          builder: (context, params) => RequestToBookWidget(
            property: params.getParam('property', ParamType.Document),
            startDate: params.getParam('startDate', ParamType.DateTime),
            endDate: params.getParam('endDate', ParamType.DateTime),
            capacity: params.getParam('capacity', ParamType.double),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/signUp';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
