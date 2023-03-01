import 'package:api_testing/cubits/user/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UserCubit>().getAllUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Testing Api'),
      ),
      body: BlocBuilder<UserCubit,UserState>(
        builder: (context,state){
          if(state is UserLoading){
            return Center(child: CircularProgressIndicator(),);
          } else if(state is UserError){
            return Center(child: Text(state.message.toString(),),);
          }else if(state is UserLoaded){
            return ListView.builder(itemBuilder: (context, itemIndex){
              User userModel = state.userList[itemIndex];
              return ListTile(
                leading: Text(userModel.id.toString()),
                title: Text(userModel.name.toString()),
              );
            }, itemCount: state.userList.length,);
          } else{
            return SizedBox();
          }
        },
      ),
    );
  }
}
