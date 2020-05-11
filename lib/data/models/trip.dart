import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Trip extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final int likes;
  final bool isLiked;

  Trip({
    @required this.id,
    @required this.title,
    @required this.subtitle,
    @required this.likes,
    @required this.isLiked,
  });

  @override
  List<Object> get props => [id, title, subtitle, likes, isLiked];
}
