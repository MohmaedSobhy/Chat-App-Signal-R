part of 'chat_messages_cubit.dart';

@immutable
sealed class ChatMessagesState {}

final class ChatMessagesInitial extends ChatMessagesState {}

final class ChatMessageAdd extends ChatMessagesState {}
