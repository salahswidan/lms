import 'dart:developer';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:lms/core/errors/faluire.dart';

import '../../domain/entities/course_entity.dart';
import '../../domain/repos/course_repo.dart';
import '../models/course_model.dart';

class CourseRepoImpl extends CourseRepo {
  @override
  Future<Either<Faluire, List<CourseEntity>>> getCourses() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/courses.json',
      );
      final List<dynamic> data = json.decode(response);
      return right(
        data.map((json) => CourseModel.fromJson(json).toEntity()).toList(),
      );
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Faluire, CourseEntity>> getCourseById(String id) async {
    try {
      List<CourseEntity> allCourses = [];
      var result = await getCourses();
      result.fold((f) => log(f.message), (r) => allCourses.addAll(r));
      CourseEntity selected = allCourses.firstWhere((c) => c.id == id);
      return right(selected);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
