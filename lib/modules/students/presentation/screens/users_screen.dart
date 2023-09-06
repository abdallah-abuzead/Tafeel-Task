import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tafeel/core/widgets/cookbooks/loading_widget.dart';
import 'package:tafeel/core/widgets/custom_app_bar.dart';
import 'package:tafeel/modules/students/presentation/bloc/users/users_bloc.dart';

import '../../../../core/widgets/cookbooks/errors/offline_widget.dart';
import '../../../../core/widgets/cookbooks/errors/server_error_widget.dart';
import '../widgets/users_screen/user_card.dart';

class UsersScreen extends StatelessWidget {
  UsersScreen({Key? key}) : super(key: key);

  final ScrollController scrollController = ScrollController();

  void setUpScrollController(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge && scrollController.position.pixels != 0) {
        BlocProvider.of<UsersBloc>(context).hasReachedMax = true;
        BlocProvider.of<UsersBloc>(context).add(GetAllUsersEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final usersBloc = BlocProvider.of<UsersBloc>(context);
    setUpScrollController(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppBar(title: 'Users'),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async => usersBloc.add(GetAllUsersEvent(isRefresh: true)),
                child: BlocBuilder<UsersBloc, UsersState>(
                  builder: (context, state) {
                    if (state is LoadingUsers && usersBloc.page == 1) {
                      return const LoadingWidget();
                    } else if (state is OfflineUsers) {
                      return OfflineWidget(onPressed: () => usersBloc.add(GetAllUsersEvent()));
                    } else if (state is FailedGetAllUsers) {
                      return ServerErrorWidget(onPressed: () => usersBloc.add(GetAllUsersEvent()));
                    } else {
                      return ListView.separated(
                        controller: scrollController,
                        padding: const EdgeInsets.all(16),
                        itemCount: usersBloc.users.length + (usersBloc.hasReachedMax ? 1 : 0),
                        separatorBuilder: (context, i) => const SizedBox(height: 14),
                        itemBuilder: (context, i) {
                          if (i < usersBloc.users.length) {
                            return UserCard(user: usersBloc.users[i]);
                          } else {
                            Timer(const Duration(milliseconds: 30), () {
                              scrollController.jumpTo(scrollController.position.maxScrollExtent);
                            });
                            return const Center(child: CircularProgressIndicator());
                          }
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
