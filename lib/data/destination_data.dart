import '../models/destination.dart';

final List<String> categories = [
  'Semua',
  'Pantai',
  'Gunung',
  'Budaya',
  'Alam',
];

final List<Destination> destinationList = [
  Destination(
    name: 'Pantai Kuta Bali',
    location: 'Bali',
    description: 'Pantai Kuta adalah salah satu pantai yang paling terkenal di Bali. Dengan pasir putihnya yang lembut dan ombak yang cocok untuk berselancar, pantai ini menjadi destinasi favorit wisatawan lokal dan mancanegara.',
    imageAsset: 'assets/images/bali.jpg',
    rating: 4.8,
    category: 'Pantai',
  ),
  Destination(
    name: 'Gunung Bromo',
    location: 'Jawa Timur',
    description: 'Gunung Bromo adalah gunung berapi aktif dan destinasi wisata populer di Jawa Timur. Pemandangan matahari terbit dan lautan pasir yang mengelilinginya menjadi daya tarik utama.',
    imageAsset: 'assets/images/bromo.jpg',
    rating: 4.8,
    category: 'Gunung',
  ),
  Destination(
    name: 'Raja Ampat',
    location: 'Papua Barat',
    description: 'Raja Ampat adalah surganya para penyelam dengan keanekaragaman hayati bawah laut yang menakjubkan. Terdiri dari ratusan pulau kecil dengan pemandangan yang memukau.',
    imageAsset: 'assets/images/raja_ampat.jpg',
    rating: 4.8,
    category: 'Alam',
  ),
  Destination(
    name: 'Candi Borobudur',
    location: 'Yogyakarta',
    description: 'Candi Borobudur adalah monumen Buddha terbesar di dunia yang berlokasi di Magelang, Jawa Tengah, dan merupakan situs warisan dunia UNESCO. Dibangun pada abad ke-8 hingga ke-9 Masehi oleh Raja Samaratungga dari Dinasti Syailendra, candi ini merupakan candi Buddha Mahayana yang terkenal dengan relief dan stupanya. ',
    imageAsset: 'assets/images/borobudur.jpg',
    rating: 4.8,
    category: 'Budaya',
  ),
  Destination(
    name: 'Danau Toba',
    location: 'Sumatra Utara',
    description: 'Danau Toba adalah danau alami terbesar di Sumatera Utara, Indonesia yang terletak di kaldera gunung supervulkan. Danau ini memiliki panjang 100 kilometer (62 mil), lebar 30 kilometer (19 mi), dan kedalaman 508 meter (1.667 ft).',
    imageAsset: 'assets/images/toba.jpg',
    rating: 4.8,
    category: 'Alam',
  ),
  Destination(
    name: 'Wakatobi',
    location: 'Sumatra Tenggara',
    description: 'Wakatobi adalah nama sebuah kabupaten di Sulawesi Tenggara, Indonesia, yang terkenal sebagai destinasi wisata bahari kelas dunia karena keindahan alam bawah lautnya dan masuk dalam kawasan Segitiga Karang Dunia.',
    imageAsset: 'assets/images/wakatobi.jpg',
    rating: 4.8,
    category: 'Alam',
  ),
];
