import 'package:api_testing/services/api_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/user_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  List<User> userList = [];
  ApiService apiService;
  UserCubit({ required this.apiService}) : super(UserInitial());

  void getAllUserList() async{
    try{
      emit(UserLoading());
      //we get the userList by calling the function from the api
      userList = await apiService.getData();

      emit(UserLoaded(userList: userList));
    }catch(e){
      emit(UserError(message: e.toString()));
    }


  }
}
