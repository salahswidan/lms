class DummyCoursesData {
  static const List<Map<String, dynamic>> categories = [
    {"id": "cat1", "name": "Development"},
    {"id": "cat2", "name": "Design"},
    {"id": "cat3", "name": "Marketing"},
    {"id": "cat4", "name": "Business"},
    {"id": "cat5", "name": "Photography"},
  ];

  static const List<Map<String, dynamic>> courses = [
    {
      "id": "c1",
      "title": "Flutter & Dart Bootcamp",
      "tutor": "Angela Yu",
      "price": 49.99,
      "rating": 4.8,
      "imageUrl": "https://images.unsplash.com/photo-1522071820081-009f0129c71c?w=800&q=80",
      "categoryId": "cat1"
    },
    {
      "id": "c2",
      "title": "UI/UX Design Essentials",
      "tutor": "Jesse Showalter",
      "price": 39.99,
      "rating": 4.6,
      "imageUrl": "https://images.unsplash.com/photo-1559028012-481c04fa702d?w=800&q=80",
      "categoryId": "cat2"
    },
    {
      "id": "c3",
      "title": "Digital Marketing Masterclass",
      "tutor": "Phil Ebiner",
      "price": 29.99,
      "rating": 4.5,
      "imageUrl": "https://images.unsplash.com/photo-1519389950473-47ba0277781c?w=800&q=80",
      "categoryId": "cat3"
    },
    {
      "id": "c4",
      "title": "Business Analytics with Excel",
      "tutor": "Chris Dutton",
      "price": 34.99,
      "rating": 4.4,
      "imageUrl": "https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?w=800&q=80",
      "categoryId": "cat4"
    },
    {
      "id": "c5",
      "title": "Photography Basics for Beginners",
      "tutor": "John Greengo",
      "price": 24.99,
      "rating": 4.7,
      "imageUrl": "https://images.unsplash.com/photo-1518779578993-ec3579fee39f?w=800&q=80",
      "categoryId": "cat5"
    },
  ];
}
