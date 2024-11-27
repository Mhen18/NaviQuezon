import 'package:bloc/bloc.dart';

import 'package:naviquezon/src/core/utils/loggers/print_logger.dart';

/// {@template bloc_logger}
/// A [BlocObserver] that logs all [Bloc] events, state changes,
/// and errors to the console.
/// {@endtemplate}
class BlocLogger extends BlocObserver {
  const BlocLogger();

  /// Called whenever a Change occurs in any bloc A change occurs when a new
  /// state is emitted. onChange is called before a bloc's state has
  /// been updated.
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);

    printInfo(change, title: '${bloc.runtimeType} onChange');
  }

  /// Called whenever a Bloc is closed. onClose is called just before the Bloc
  /// is closed and indicates that the particular instance will no
  /// longer emit new states.
  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);

    printWarning('${bloc.runtimeType} onClose');
  }

  /// Called whenever a Bloc is instantiated. In many cases, a cubit may be
  /// lazily instantiated and onCreate can be used to observe exactly
  /// when the cubit instance is created.
  @override
  void onCreate(BlocBase<dynamic> bloc) {
    super.onCreate(bloc);

    printSuccess('${bloc.runtimeType} onCreate');
  }

  /// Called whenever an error is thrown in any Bloc or Cubit. The stackTrace
  /// argument may be StackTrace.empty if an error was received
  /// without a stack trace.
  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);

    printError(error, title: '${bloc.runtimeType} onError');
  }

  /// Called whenever an event is added to any bloc with the
  /// given bloc and event.
  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);

    printInfo(event, title: '${bloc.runtimeType} onEvent');
  }

  /// Called whenever a transition occurs in any bloc with the given
  /// bloc and transition. A transition occurs when a new event
  /// is added and a new state is emitted from a corresponding EventHandler.
  /// onTransition is called before a bloc's state has been updated.
  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);

    printInfo(transition, title: '${bloc.runtimeType} onTransition');
  }
}
