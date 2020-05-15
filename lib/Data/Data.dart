import 'package:provider_http_req/Models/phone_countris_model.dart';
import 'package:provider_http_req/Util/images.dart';

class Data {
  Data._();
  static final kategori = [
    {
      "nama": "Sapi",
      "image": "assets/cow_icon.svg",
    },
    {
      "nama": "Kerbau",
      "image": "assets/cow_icon.svg",
    },
    {
      "nama": "Kambing",
      "image": "assets/cow_icon.svg",
    },
    {
      "nama": "Ayam",
      "image": "assets/cow_icon.svg",
    },
  ];
  static final rekomendasi = [
    {
      "id": 0,
      "profil": "assets/images/goat.jpg",
      "nama": "Kambing Etawa",
      "alamat": "Bantul, Yogyakarta",
      "gender": "Betina",
      "discription":
          "Sapo ini meripakan sapi potong dengan perototan lebih baik dari sapi simmental. Sapi ini memiliki bulu agak kecoklatan dan sedikit berwarna putih serta lutut kebawah dan sekitarnya lebih muda",
      "umur": 20,
      "berat": 10,
      "harga": 2000000,
      "rating": 4.4,
      "review": [
        {
          "nama": "Culametan",
          "profil": "assets/images/orang2.jpg",
          "reting": 4.0,
          "pesan": "Mengasikan dan Bagus Sekali",
        },
        {
          "nama": "Eko",
          "profil": "assets/images/orang.jpg",
          "reting": 4.0,
          "pesan": "Mengasikan dan Bagus Sekali",
        },
        {
          "nama": "Paijo",
          "profil": "assets/images/orang.jpg",
          "reting": 4.0,
          "pesan": "Mengasikan dan Bagus Sekali",
        },
        {
          "nama": "Paijo",
          "profil": "assets/images/orang.jpg",
          "reting": 4.0,
          "pesan": "Mengasikan dan Bagus Sekali",
        },
      ],
      "image": [
        "assets/images/goat.jpg",
        "assets/images/goat.jpg",
        "assets/images/limousin.jpg"
      ]
    },
    {
      "id": 1,
      "profil": "assets/images/limousin.jpg",
      "nama": "Sapi Perah",
      "alamat": "Bantul, Yogyakarta",
      "gender": "Betina",
      "discription":
          "Sapo ini meripakan sapi potong dengan perototan lebih baik dari sapi simmental. Sapi ini memiliki bulu agak kecoklatan dan sedikit berwarna putih serta lutut kebawah dan sekitarnya lebih muda",
      "umur": 12,
      "berat": 15,
      "harga": 40000000,
      "rating": 4.4,
      "review": [
        {
          "nama": "Culametan",
          "profil": "assets/images/orang2.jpg",
          "reting": 4.0,
          "pesan": "Mengasikan dan Bagus Sekali",
        },
        {
          "nama": "Culametan",
          "profil": "assets/images/orang.jpg",
          "reting": 4.0,
          "pesan": "Mengasikan dan Bagus Sekali",
        },
        {
          "nama": "Culametan",
          "profil": "assets/images/orang2.jpg",
          "reting": 4.0,
          "pesan": "Mengasikan dan Bagus Sekali",
        }
      ],
      "image": [
        "assets/images/limousin.jpg",
        "assets/images/goat.jpg",
        "assets/images/limousin.jpg"
      ]
    },
    {
      "id": 2,
      "profil": "assets/images/limousin.jpg",
      "nama": "Sapi Putih",
      "alamat": "Bantul, Yogyakarta",
      "gender": "Betina",
      "discription":
          "Sapo ini meripakan sapi potong dengan perototan lebih baik dari sapi simmental. Sapi ini memiliki bulu agak kecoklatan dan sedikit berwarna putih serta lutut kebawah dan sekitarnya lebih muda",
      "umur": 10,
      "berat": 10,
      "harga": 23000000,
      "rating": 4.4,
      "review": [
        {
          "nama": "Culametan",
          "profil": "assets/images/orang2.jpg",
          "reting": 4.0,
          "pesan": "Mengasikan dan Bagus Sekali",
        },
        {
          "nama": "Culametan",
          "profil": "assets/images/orang.jpg",
          "reting": 4.0,
          "pesan": "Mengasikan dan Bagus Sekali",
        },
        {
          "nama": "Culametan",
          "profil": "assets/images/orang.jpg",
          "reting": 4.0,
          "pesan": "Mengasikan dan Bagus Sekali",
        }
      ],
      "image": [
        "assets/images/goat.jpg",
        "assets/images/limousin.jpg",
        "assets/images/limousin.jpg"
      ]
    },
    {
      "id": 3,
      "profil": "assets/images/limousin.jpg",
      "nama": "Sapi Jersey",
      "alamat": "Bantul, Yogyakarta",
      "gender": "Betina",
      "discription":
          "Sapo ini meripakan sapi potong dengan perototan lebih baik dari sapi simmental. Sapi ini memiliki bulu agak kecoklatan dan sedikit berwarna putih serta lutut kebawah dan sekitarnya lebih muda",
      "umur": 15,
      "berat": 15,
      "harga": 14500000,
      "rating": 4.4,
      "review": [
        {
          "nama": "Culametan",
          "profil": "assets/images/orang2.jpg",
          "reting": 4.0,
          "pesan": "Mengasikan dan Bagus Sekali",
        },
        {
          "nama": "Culametan",
          "profil": "assets/images/orang.jpg",
          "reting": 4.0,
          "pesan": "Mengasikan dan Bagus Sekali",
        },
        {
          "nama": "Culametan",
          "profil": "assets/images/orang2.jpg",
          "reting": 4.0,
          "pesan": "Mengasikan dan Bagus Sekali",
        }
      ],
      "image": [
        "assets/images/limousin.jpg",
        "assets/images/goat.jpg",
        "assets/images/limousin.jpg"
      ]
    }
  ];
  static final kebutuhan = [
    {
      "image": "assets/images/limousin.jpg",
      "nama": "Kolonjono",
      "satuan": "Bentel",
      "jumlah": 1,
      "harga": 15.000
    },
    {
      "image": "assets/images/limousin.jpg",
      "nama": "Damen",
      "satuan": "Bentel",
      "jumlah": 1,
      "harga": 10.000
    },
    {
      "image": "assets/images/limousin.jpg",
      "nama": "Vitamin Turmonk",
      "satuan": "Liter",
      "jumlah": 1,
      "harga": 50.000
    },
    {
      "image": "assets/images/limousin.jpg",
      "nama": "Vitamin Viterna",
      "satuan": "Liter",
      "jumlah": 1,
      "harga": 30.000
    },
  ];

  static final List<PhoneCountris> phoneNumber = [
    PhoneCountris(code: '+62', image: ImageData.id),
    PhoneCountris(code: '+1', image: ImageData.us),
    PhoneCountris(code: '+91', image: ImageData.ind),
    PhoneCountris(code: '+60', image: ImageData.my),
    PhoneCountris(code: '+63', image: ImageData.ph),
    PhoneCountris(code: '+65', image: ImageData.sg),
  ];
}
