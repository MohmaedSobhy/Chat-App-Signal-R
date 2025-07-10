import 'package:chat_app/Feature/home/data/repo/chat_repository_implmentation.dart';
import 'package:chat_app/Feature/home/presentation/controller/all%20contacts/all_contacts_cubit.dart';
import 'package:chat_app/Feature/home/presentation/widgets/contact_list_tile_widget.dart';
import 'package:chat_app/core/services/get_it_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllContactsBottomSheet extends StatefulWidget {
  const AllContactsBottomSheet({super.key});

  @override
  State<AllContactsBottomSheet> createState() => _AllContactsBottomSheetState();
}

class _AllContactsBottomSheetState extends State<AllContactsBottomSheet> {
  late final AllContactsCubit contactsCubit;

  @override
  void initState() {
    super.initState();
    contactsCubit = AllContactsCubit(
      GetItServices.getIt<ChatRepositoryImplmentation>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: contactsCubit..loadAllContacts(),
      child: BlocBuilder<AllContactsCubit, AllContactsState>(
        builder: (context, state) {
          if (state is LoadingContactsState || state is AllContactsInitial) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          }
          if (state is FailedContactsState) {
            return const Center(child: Text("No Contacts Found"));
          }

          return Padding(
            padding: const EdgeInsets.only(top: 15),
            child: ListView.builder(
              itemCount: contactsCubit.contacts.length,
              itemBuilder: (context, index) {
                return ContactListTileWidget(
                  contact: contactsCubit.contacts[index],
                );
              },
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    contactsCubit.close();
    super.dispose();
  }
}
