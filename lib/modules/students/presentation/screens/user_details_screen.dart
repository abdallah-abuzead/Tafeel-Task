import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tafeel/core/widgets/cookbooks/loading_widget.dart';
import 'package:tafeel/core/widgets/custom_app_bar.dart';
import 'package:tafeel/modules/students/presentation/bloc/single_user/single_user_bloc.dart';
import 'package:tafeel/modules/students/presentation/widgets/user_details_screen/user_details_body.dart';

import '../../../../core/widgets/cookbooks/errors/offline_widget.dart';
import '../../../../core/widgets/cookbooks/errors/server_error_widget.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  void initState() {
    BlocProvider.of<SingleUserBloc>(context).add(GetSingleUserEvent(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<SingleUserBloc>(context);
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white,
        body: Column(
          children: [
            const CustomAppBar(title: 'User Details', showBackButton: true),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async => userBloc.add(GetSingleUserEvent(id: widget.id)),
                child: BlocBuilder<SingleUserBloc, SingleUserState>(
                  builder: (context, state) {
                    if (state is SuccessGetSingleUser) {
                      return UserDetailsBody(user: state.user);
                    } else if (state is OfflineSingleUser) {
                      return OfflineWidget(onPressed: () => userBloc.add(GetSingleUserEvent(id: widget.id)));
                    } else if (state is FailedGetSingleUser) {
                      return ServerErrorWidget(onPressed: () => userBloc.add(GetSingleUserEvent(id: widget.id)));
                    } else {
                      return const LoadingWidget();
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
