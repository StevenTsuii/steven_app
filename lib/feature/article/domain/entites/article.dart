import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String title;
  final String subtitle;
  final String coverImage;

  const Article(this.title, this.subtitle, this.coverImage);

  @override
  List<Object?> get props => [title, subtitle, coverImage];
}
