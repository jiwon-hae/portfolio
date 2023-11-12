import 'package:flutter/cupertino.dart';

typedef ValueCallback<T> = Function(T value);
typedef ItemWidgetBuilder<T> = Widget Function(BuildContext context, T item);
typedef NullableItemWidgetBuilder<T> = Widget? Function(BuildContext context, T item);