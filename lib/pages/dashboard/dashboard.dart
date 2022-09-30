import 'package:bdn_test/bloc/user/user_bloc.dart';
import 'package:bdn_test/service/models/user/UserListResponse.dart';
import 'package:bdn_test/service/repository/UserRepository.dart';
import 'package:bdn_test/tools/Typoghrapy.dart';
import 'package:bdn_test/widget/UserCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  UserBloc _UserBloc = UserBloc(repository: UserRepositoryImpl());
  int page = 1;
  bool isFetching = false;
  List<DataListUser> _userList = [];
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _UserBloc
      ..page = 1
      ..add(getListUser());
    _scrollController = ScrollController()..addListener(handleScrolling);
  }

  void handleScrolling() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !isFetching) {
      setState(() {
        _UserBloc
          ..page = page + 1
          ..isFetching = true
          ..add(getListUser());
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(handleScrolling);
    super.dispose();
  }

  Widget FetchUser(bool loading) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: _userList.length,
      itemBuilder: (ctx, pos) {
        return UserCard(
            first_name: _userList[pos].firstName ?? "",
            last_name: _userList[pos].lastName ?? "",
            email: _userList[pos].email ?? "",
            image: _userList[pos].avatar ?? "",
            id: _userList[pos].id ?? 0,
            loading: loading);
      },
    );
  }

  Widget buildLoading() {
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: 4,
      itemBuilder: (ctx, pos) {
        return UserCard(
            first_name: "",
            last_name: "",
            email: "",
            image: "",
            id: 0,
            loading: true);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (BuildContext context) => _UserBloc,
        ),
      ],
      child: Scaffold(
          body: ListView(
        controller: _scrollController,
        children: [
          Container(
            padding: EdgeInsets.all(20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hai,",
                  style: popins.copyWith(fontSize: 40.sp),
                ),
                Text("Selamat Datang di aplikasi test",
                    style: popins.copyWith(fontSize: 16.sp)),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "List User",
                  style: popins.copyWith(fontSize: 20.sp),
                ),
                Divider()
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 5.w, right: 5.w),
            child: BlocConsumer<UserBloc, UserState>(
                listener: (context, state) {},
                builder: (context, state) {
                  _UserBloc.page = page;
                  if (state is UserLoadingState ) {
                    return buildLoading();
                  } else if (state is UserLoadedState) {
                    page = state.response.page!;
                    isFetching = false;
                    _UserBloc.isFetching = false;
                    _userList.addAll(state.response.data!);
                  } else if (state is UserErrorState) {
                    return Text("Error");
                  }
                  return FetchUser(false);
                }),
          ),
          Container(
            margin: EdgeInsets.only(left: 5.w, right: 5.w),
            child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
              if (state is UserLoadingLoadMoreState) {
                return buildLoading();
              }
              return Container();
            }),
          ),
          SizedBox(height: 40.h,)
        ],
      )),
    );
  }
}
