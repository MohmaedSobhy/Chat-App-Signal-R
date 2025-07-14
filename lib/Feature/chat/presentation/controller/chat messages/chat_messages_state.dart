part of 'chat_messages_cubit.dart';

@immutable
sealed class ChatMessagesState {}

final class ChatMessagesInitial extends ChatMessagesState {}

final class ChatMessageAdd extends ChatMessagesState {}

final class LoadingChatMessages extends ChatMessagesState {}

final class SuccessChatMessages extends ChatMessagesState {}

final class FailedChatMessages extends ChatMessagesState {}
