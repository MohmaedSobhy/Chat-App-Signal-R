part of 'user_status_cubit.dart';

@immutable
sealed class UserStatusState {}

final class UserStatusInitial extends UserStatusState {}

final class UserTypingStatus extends UserStatusState {}

final class UserOnlineStatus extends UserStatusState {}

final class UserLastSeenStatus extends UserStatusState {
  final DateTime time;

  UserLastSeenStatus(this.time);
}
