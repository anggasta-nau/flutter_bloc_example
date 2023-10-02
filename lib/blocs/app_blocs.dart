import '../repo/repositories.dart';
import '../models/user_model.dart';
import 'app_event.dart';
import 'app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc(this._userRepository) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final List<Map<String, dynamic>>? userDataList =
            await _userRepository.getUser();

        if (userDataList != null) {
          // Convert List<Map<String, dynamic>> to List<Datum>
          final users =
              userDataList.map((userData) => Datum.fromJson(userData)).toList();

          if (users.isNotEmpty) {
            emit(UserLoadedState(users));
          } else {
            print('Invalid user data.');
            emit(UserErrorState("Invalid user data."));
          }
        } else {
          // Handle the case where userDataList is null
          print('User data is null.');
          emit(UserErrorState("User data is null."));
        }
      } catch (e) {
        print("An error occurred: $e");
        emit(UserErrorState(e.toString()));
      }
    });
  }
}
