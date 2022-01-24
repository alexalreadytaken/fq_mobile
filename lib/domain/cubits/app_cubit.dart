import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fq_mobile/data/repositories/app_props_repo.dart';
import 'package:fq_mobile/domain/entities/app_props.dart';
import 'package:fq_mobile/domain/states/app_props_state.dart';

class AppPropsCubit extends Cubit<AppPropsState> {
  AppPropsCubit(this.repo)
      : super(repo.propsSaved() ? LoadedState(repo.loadProps()) : InitialState());

  final AppPropsRepo repo;

  void getProps() async {
    emit(LoadingState());
    if (repo.propsSaved()) {
      emit(LoadedState(repo.loadProps()));
    } else {
      emit(InitialState());
    }
  }

  void saveProps(AppProps props) {
    repo.saveProps(props);
    emit(LoadedState(props));
  }
}
