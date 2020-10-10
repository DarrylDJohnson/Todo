import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/repositories/user_repository.dart';

import 'user_state.dart';
export 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserRepository _userRepository;

  UserCubit(UserRepository userRepository)
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(Initial());
}
