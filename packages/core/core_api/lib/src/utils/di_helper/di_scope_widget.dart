import 'package:core_api/core_api.dart';
import 'package:flutter/material.dart';

/// Widget for initializing an instance of [BaseDiModule].
///
/// [module] - the instance of [BaseDiModule] that needs initializing.
///
/// [onModuleInitialized] - callback that is triggered when module is
/// initialized. Happens only once during the lifecycle of this widget.
///
/// [builder] - triggers after module has been initialized. Any registered
/// entity from inside the module can be retrieved safely inside of the builder.
///
///
class DiScopeWidget<T extends BaseDiModule> extends StatefulWidget {
  const DiScopeWidget({
    this.child,
    this.builder,
    this.onModuleInitialized,
    required this.module,
    super.key,
  }) : assert((child == null && builder != null) || (child != null && builder == null));

  final Widget? child;
  final Widget Function(
    BuildContext context,
    T module,
  )? builder;

  final void Function(BuildContext context)? onModuleInitialized;
  final T module;

  @override
  State<DiScopeWidget<T>> createState() => _DiScopeWidgetState<T>();
}

class _DiScopeWidgetState<T extends BaseDiModule> extends State<DiScopeWidget<T>> {
  @override
  void initState() {
    widget.module.pushScope();
    widget.onModuleInitialized?.call(context);
    super.initState();
  }

  @override
  void dispose() {
    widget.module.popScope();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child ?? widget.builder?.call(context, widget.module) ?? (throw Exception('Invalid $runtimeType'));
  }
}
