import 'package:money_manager/core/utils/typedefs.dart';

abstract class UseCaseWithParams<Type, Params> {
  const UseCaseWithParams();
  ResultFuture<Type> call(Params params);
}

abstract class UseCaseWithOutParams<Type> {
  const UseCaseWithOutParams();
  ResultFuture<Type> call();
}
