part of 'all_contacts_cubit.dart';

@immutable
sealed class AllContactsState {}

final class AllContactsInitial extends AllContactsState {}

final class LoadingContactsState extends AllContactsState {}

final class SuccessContactsState extends AllContactsState {}

final class FailedContactsState extends AllContactsState {}
