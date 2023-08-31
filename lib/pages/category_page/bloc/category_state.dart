part of 'category_bloc.dart';

class CategoryState extends Equatable {
  final bool isChecked;
  const CategoryState({this.isChecked = false});

  CategoryState copyWith({
    bool? isChecked,
  }) {
    return CategoryState(isChecked: isChecked ?? this.isChecked);
  }

  @override
  List<Object?> get props => [isChecked];
}
