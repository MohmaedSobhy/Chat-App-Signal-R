import 'package:bloc/bloc.dart';
import 'package:chat_app/Feature/home/data/model/chat_model.dart';
import 'package:chat_app/Feature/home/data/repo/chat_repository_implmentation.dart';
import 'package:chat_app/core/services/connections_services.dart';
import 'package:meta/meta.dart';

import '../../../../../core/services/get_it_services.dart';
import '../../../../../core/services/secure_storage.dart';

part 'user_chats_state.dart';

class UserChatsCubit extends Cubit<UserChatsState> {
  final ChatRepositoryImplmentation chatRepository;
  List<ChatModel> chats = [];
  UserChatsCubit(this.chatRepository) : super(UserChatsInitial());

  Future<void> loadAllChats() async {
    String? token = await GetItServices.getIt<SecureStorage>().getUserToken();
    var result = await chatRepository.getAllChats(token!);

    result.fold(
      (failure) {
        emit(FailedChatState());
      },
      (chats) {
        this.chats.clear();
        this.chats.addAll(chats);
        emit(SuccessChatState());
      },
    );
  }

  Future<void> listenToMessages() async {
    ConnectionsServices.connection.on("ReceiveMessage", (arguments) {
      if (arguments != null && arguments.isNotEmpty) {
        final data = arguments[0];
        if (data is Map<String, dynamic>) {
          // chats[0].lastMessage = data['text'];
          // emit(SuccessChatState());
        }
      }
    });
  }
}
