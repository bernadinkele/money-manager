import 'package:dartz/dartz.dart';

typedef ResultFuture<T> = Future<Either<Exception, T>>;

typedef ResultVoid = Future<Either<Exception, void>>;

typedef DataMap = Map<String, dynamic>;
