import 'package:redux/redux.dart';

class CounterMiddleware implements MiddlewareClass {
  @override
  void call(Store store, action, NextDispatcher next) {
    next(action);
  }
}
