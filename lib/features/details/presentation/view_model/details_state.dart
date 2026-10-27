part of 'details_cubit.dart';

abstract class DetailsState {}

class DetailsInitial extends DetailsState {}

class DetailsLoading extends DetailsState {}

class DetailsSuccess extends DetailsState {
  final ProductDetailsEntity product;

  DetailsSuccess(this.product);
}

class DetailsFailure extends DetailsState {
  final String errorMessage;

  DetailsFailure(this.errorMessage);
}
