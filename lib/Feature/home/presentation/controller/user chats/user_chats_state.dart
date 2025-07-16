part of 'user_chats_cubit.dart';

@immutable
sealed class UserChatsState {}

final class UserChatsInitial extends UserChatsState {}

final class LoadingChatsState extends UserChatsState {}

final class SuccessChatState extends UserChatsState {}

final class FailedChatState extends UserChatsState {}
