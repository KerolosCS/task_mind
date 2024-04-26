import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_mind/Features/home/data/models/more_model.dart';
import 'package:task_mind/Features/home/data/repos/product_repo.dart';

part 'more_state.dart';

class MoreCubit extends Cubit<MoreState> {
  MoreCubit() : super(MoreInitial());

  HomeRepo repo = HomeRepo();
  MoreProductsModel? model2;
  void getMoreData() {
    emit(GetMoreDataLoading());
    repo.getmoreProducts().then((value) {
      model2 = value;
      for (var i = 0; i < model2!.data.length; i++) {
        print('model 2 : ${model2?.data[i].name}');
      }

      emit(GetMoreDataSuccesfully(model: value));
    }).catchError((e) {
      print(e.toString());
      emit(GetMoreDataError(error: e.toString()));
    });
  }
}
