import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_chats_state.dart';

class UserChatsCubit extends Cubit<UserChatsState> {
  UserChatsCubit() : super(UserChatsInitial());
}
