// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';

import 'package:cuidapet_api/entities/category.dart';
import 'package:cuidapet_api/modules/categories/data/i_categories_repository.dart';

import './i_categories_service.dart';

@LazySingleton(as: ICategoriesService)
class ICategoriesServiceImpl implements ICategoriesService {
  ICategoriesRepository repository;

  ICategoriesServiceImpl({
    required this.repository,
  });

  @override
  Future<List<Category>> findAll() => repository.findAll();
}
