import 'package:equatable/equatable.dart';

class Review extends Equatable {
  final String author;
  final Map<String, dynamic> authorDetails;
  final String content;
  final DateTime createdAt;
  final String id;
  final DateTime updatedAt;
  final String url;

  Review(
      {this.author,
      this.authorDetails,
      this.content,
      this.createdAt,
      this.id,
      this.updatedAt,
      this.url});

  @override
  List<Object> get props => [
        this.author,
        this.authorDetails,
        this.content,
        this.createdAt,
        this.id,
        this.updatedAt,
        this.url
      ];
}

// {
//     "author": "ikomrad",
//     "author_details": {
//         "name": "",
//         "username": "ikomrad",
//         "avatar_path": "/https://secure.gravatar.com/avatar/b81ebdb950829a0af723b7daf360ef8d.jpg",
//         "rating": 9
//     },
//     "content": "The Joker is similar to the DC Joker character but is not a criminal genius. The movie was a great depiction of how a person who has been mistreated, lied to, and ignored, totally lacking access to human compassion, can snap. The acting is top notch, and it puts a spotlight on the importance of mental health in modern times.",
//     "created_at": "2019-10-27T04:42:49.176Z",
//     "id": "5db52049d40d4c0014fd08bc",
//     "updated_at": "2019-10-30T14:34:51.193Z",
//     "url": "https://www.themoviedb.org/review/5db52049d40d4c0014fd08bc"
// }
