import 'package:my_book_shelf/features/domain/entities/book_entity.dart';

class MockData {
  static Map<String, dynamic> books = {
    "items": [
      {
        "id": "fneVAAAACAAJ",
        "volumeInfo": {
          "title": "Yüzük",
          "authors": ["Danielle Steel"],
          "publishedDate": "1999",
          "pageCount": 342,
          "imageLinks": {
            "smallThumbnail":
                "http://books.google.com/books/content?id=fneVAAAACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api"
          }
        }
      },
      {
        "id": "P_FX0AEACAAJ",
        "volumeInfo": {
          "title": "Kayip Yüzük",
          "subtitle": "Yüzük Mühür ve Kilic Efsanesi",
          "authors": ["Bilal Özbay"],
          "publishedDate": "2018-03",
          "pageCount": 0
        }
      },
      {
        "id": "GSI_0AEACAAJ",
        "volumeInfo": {
          "title": "Yüzük ve Tac - Yüzük ve Tac Serisi 1",
          "authors": ["Melissa de La Cruz"],
          "publishedDate": "2021-09",
          "pageCount": 0
        }
      }
    ]
  };

  static Map<String, dynamic> book = {
    "id": "fneVAAAACAAJ",
    "volumeInfo": {
      "title": "Yüzük",
      "authors": ["Danielle Steel"],
      "publishedDate": "1999",
      "pageCount": 342,
      "imageLinks": {
        "smallThumbnail":
            "http://books.google.com/books/content?id=fneVAAAACAAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api"
      }
    }
  };

  static List<BookEntity> favorites = [BookEntity.fromJson(book)];
}
