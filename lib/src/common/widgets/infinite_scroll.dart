import 'package:flutter/material.dart';

class PaginatedList<T> {
  final T? data;
  final bool isLoading;
  final Object? error;
  final StackTrace? stackTrace;

  const PaginatedList(
      {this.data,
      this.isLoading = false,
      this.error,
      this.stackTrace});

  PaginatedList<T> copyWith({
    T? data,
    bool? isLoading,
    Object? error,
    StackTrace? stackTrace,
  }) =>
      PaginatedList(
        data: data ?? this.data,
        isLoading: isLoading ?? this.isLoading,
        error: error,
        stackTrace: stackTrace,
      );

  Widget? when({
    required Widget? Function(T) data,
    required Widget? Function()? loading,
    required Widget? Function(Object error, StackTrace stackTrace)? error,
  }) {
    if (this.isLoading) {
      return loading?.call();
    } else {
      if (this.error != null && this.stackTrace != null) {
        return error?.call(this.error!, this.stackTrace!);
      }
      return data(this.data as T);
    }
  }
}

typedef Pagination = void Function(
  int page,
  int pageSize,
);
typedef ItemProvider<T> = PaginatedList<List<T>> Function();

/// Infinite builder used for paged views.
/// ```
/// SliverList(
/// delegate: SliverChildBuilderDelegate(
/// infinitePagedBuilder(
/// builder: (page, pageSize) => ref.watch(itemProvider(pageSize: pageSize, page: page)),
/// pageSize: 24,
/// data: (p) => ProductCard(product: p),
/// ))),
/// ```
NullableIndexedWidgetBuilder infinitePagedBuilder<T>({
  required Pagination builder,
  required ItemProvider<T> itemProvider,

  /// The amount of items fetched per page. Its value should not be too high as to fetch too much data eagerly or too small
  /// as to a whole page of items to be unable to fill a complete viewport
  required int pageSize,
  required Widget Function(T) data,
  int initialPageIndex = 1,

  /// Loading Widget displayed at the end of the list when fetching the next page
  Widget Function()? loading,

  /// Error widget
  Widget Function(Object error, StackTrace stackTrace)? error,
}) {
  return (_, index) {
    final page = (index ~/ pageSize) + initialPageIndex;
    final itemIndex = index % pageSize;
    // When page changes a request for the next pageValue is made via builder
    builder(page, pageSize);
    final pageValue = itemProvider();

    return pageValue.when(
      data: (items) {
        // By returning null we don't show more items that we currently have.
        // This has the added value of preventing to fetch after the last incomplete page
        if (itemIndex >= items.length) return null;
        return data(items[itemIndex]);
      },
      loading: () {
        // Show only one loading indicator
        if (itemIndex != 0) return null;
        return loading?.call() ??
            const Center(child: CircularProgressIndicator());
      },
      error: (err, st) {
        if (itemIndex != 0) return null;
        return error?.call(err, st) ?? ErrorWidget(err);
      },
    );
  };
}
