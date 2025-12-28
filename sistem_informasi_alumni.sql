-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2025 at 09:23 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistem_informasi_alumni`
--

-- --------------------------------------------------------

--
-- Table structure for table `daftar_alumni`
--

CREATE TABLE `daftar_alumni` (
  `nim` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `id_prodi` int(11) NOT NULL,
  `id_fakultas` int(11) NOT NULL,
  `jalur_masuk` varchar(50) NOT NULL,
  `tahun_masuk` int(4) NOT NULL,
  `tahun_lulus` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daftar_alumni`
--

INSERT INTO `daftar_alumni` (`nim`, `nama`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `alamat`, `no_hp`, `email`, `id_prodi`, `id_fakultas`, `jalur_masuk`, `tahun_masuk`, `tahun_lulus`) VALUES
(2023000001, 'Nathaniel Kenan', 'Yogyakarta', '2000-01-12', 'Laki-laki', 'Bantul', '085758916471', 'nathanielknn@gmail.com', 1, 4, 'Mandiri', 2020, 2024),
(2023000002, 'Siti Rahma', 'Bandung', '2001-06-04', 'Perempuan', ' Bandung', '081234567891', 'sirahma@gmail.com', 9, 5, 'Beasiswa', 2020, 2025),
(2023000003, 'Alif Ramadhan', 'Jakarta', '1999-01-20', 'Laki-laki', 'Jakarta', '08123450987', 'alif@gmail.com', 17, 6, 'SNBT', 2020, 2025),
(2023000004, 'Dinda Putri', 'Bandung', '2000-05-10', 'Perempuan', 'Bandung', '0857697451', 'dinput@gmail.com', 22, 8, 'Mandiri', 2019, 2024),
(2023000005, 'Rizky Pratama', 'Surabaya', '1998-07-28', 'Laki-laki', 'Surabaya', '08550078924', 'rizprtm@gmail.com', 35, 10, 'Beasiswa', 2020, 2024),
(2023000006, 'Sari Lestari', 'Bekasi', '2000-11-17', 'Perempuan', 'Bekasi', '085760089714', 'sarilestari@gmail.com', 3, 4, 'Mandiri', 2020, 2024),
(2023000007, 'Agnia Saraswati', 'Jakarta', '1999-02-14', 'Perempuan', 'Jakarta', '08874569821', 'agnia@gmail.com', 19, 7, 'Mandiri', 2020, 2025),
(2023000008, 'Agus Santoso', 'Yogyakarta', '2000-08-11', 'Laki-laki', 'Yogyakarta', '08500089326', 'agssnt@gmail.com', 28, 9, 'Beasiswa', 2020, 2024),
(2023000009, 'Fajar Nugroho', 'Bantul', '1998-04-03', 'Laki-laki', 'Bantul', '08523697415', 'fjrnug@gmail.com', 6, 4, 'Mandiri', 2020, 2024),
(2023000010, 'Rini Oktaviani', 'Kulon Progo', '2001-12-24', 'Perempuan', 'Kulon Progo', '058746911636', 'rini@gmail.com', 16, 6, 'Mandiri', 2020, 2024),
(2023000011, 'Hendra Wijaya', 'Jakarta', '1999-10-10', 'Laki-laki', 'Jakarta', '088965472122', 'hendra@gmail.com', 17, 6, 'SNBT', 2020, 2025),
(2023000012, 'Nadia Sari', 'Solo', '2001-02-01', 'Perempuan', 'Solo', '085811123987', 'nanad@gmail.com', 32, 10, 'Mandiri', 2020, 2024),
(2023000013, 'Arif Nugraha', 'Tangerang', '2001-06-03', 'Laki-laki', 'Tangerang', '088965000176', 'arif@gmail.com', 15, 6, 'Mandiri', 2020, 2025),
(2023000014, 'Rian Bagus Prasetyo', 'Solo', '2000-01-25', 'Laki-laki', 'Solo', '086540013206', 'rianbgs@gmail.com', 3, 4, 'Beasiswa', 2020, 2024),
(2023000015, 'Maya Sari', 'Yogyakarta', '2001-07-03', 'Perempuan', 'Yogyakarta', '09874560001', 'maya@gmail.com', 18, 7, 'Mandiri', 2020, 2024),
(2023000016, 'Zidan Alfarizqi', 'Jepara', '2001-01-25', 'Laki-laki', 'Jepara', '089874663114', 'zidan@gmail.com', 17, 6, 'Mandiri', 2020, 2025),
(2023000017, 'Andi Prasetyo', 'Solo', '2001-12-26', 'Laki-laki', 'Solo', '08587960012', 'andi@gmail.com', 2, 4, 'Mandiri', 2020, 2025),
(2023000018, 'Marisa Alya', 'Jakarta', '2000-05-22', 'Perempuan', 'Jakarta', '08654793136', 'marisa@gmail.com', 18, 7, 'Mandiri', 2020, 2024),
(2023000019, 'Fina Risa', 'Bantul', '2000-03-01', 'Perempuan', 'Bantul', '06589741336', 'fina@gmail.com', 19, 7, 'Mandiri', 2020, 2025),
(2023000020, 'Gian Nino', 'Yogyakarta', '1999-09-23', 'Laki-laki', 'Yogyakarta', '085869741365', 'gian@gmail.com', 15, 6, 'Beasiswa', 2020, 2024);

-- --------------------------------------------------------

--
-- Table structure for table `daftar_fakultas`
--

CREATE TABLE `daftar_fakultas` (
  `id_fakultas` int(11) NOT NULL,
  `nama_fakultas` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daftar_fakultas`
--

INSERT INTO `daftar_fakultas` (`id_fakultas`, `nama_fakultas`, `deskripsi`) VALUES
(4, 'Fakultas Teknik dan Teknologi Informasi', 'Unit akademik yang berfokus pada pengembangan ilmu teknik dan teknologi digital'),
(5, 'Fakultas Ekonomi', 'Fakultas yang menyelenggarakan program studi di bidang ekonomi, manajemen, dan akuntansi.'),
(6, 'Fakultas Ilmu Sosial dan Ilmu Politik', 'Fakultas yang mempelajari dinamika sosial, politik, dan pemerintahan untuk memahami serta menganalisis berbagai persoalan masyarakat dan kebijakan publik.'),
(7, 'Fakultas Ilmu Budaya / Sastra', 'Fakultas yang mempelajari bahasa, sastra, dan budaya untuk memahami komunikasi, warisan budaya, dan ekspresi kreatif manusia.'),
(8, 'Fakultas Pertanian', 'Fakultas yang mempelajari ilmu pertanian, teknologi pangan, dan agribisnis untuk mendukung ketahanan pangan dan pengelolaan sumber daya alam secara berkelanjutan.'),
(9, 'Fakultas Perikanan dan Ilmu Kelautan', 'Fakultas yang mempelajari pengelolaan sumber daya perairan, perikanan, dan ekosistem laut untuk mendukung kelestarian lingkungan dan industri kelautan.'),
(10, 'Fakultas Kesehatan', 'Fakultas yang mempelajari ilmu kesehatan, perawatan, dan pencegahan penyakit untuk meningkatkan kualitas hidup masyarakat.');

-- --------------------------------------------------------

--
-- Table structure for table `daftar_prodi`
--

CREATE TABLE `daftar_prodi` (
  `id_prodi` int(11) NOT NULL,
  `nama_prodi` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daftar_prodi`
--

INSERT INTO `daftar_prodi` (`id_prodi`, `nama_prodi`, `deskripsi`) VALUES
(1, 'Teknik Informatika', 'Mempelajari pemrograman, algoritma, kecerdasan buatan, dan pengembangan aplikasi berbasis komputer.'),
(2, 'Sistem Informasi', 'Fokus pada pengelolaan dan analisis sistem informasi untuk organisasi.'),
(3, 'Teknologi Informasi', 'Mempelajari penerapan teknologi komputer, jaringan, dan sistem digital.'),
(4, 'Rekayasa Perangkat Lunak', 'Berfokus pada pengembangan dan pemeliharaan perangkat lunak.'),
(5, 'Teknik Elektro', 'Mempelajari kelistrikan, elektronika, dan sistem kontrol.'),
(6, 'Teknik Mesin', 'Fokus pada perancangan, produksi, dan pemeliharaan mesin.'),
(7, 'Teknik Sipil', 'Mempelajari pembangunan infrastruktur seperti gedung, jalan, dan jembatan.'),
(8, 'Manajemen', 'Mempelajari pengelolaan bisnis, organisasi, dan sumber daya manusia.'),
(9, 'Akuntansi', 'Fokus pada pencatatan, pelaporan, dan analisis keuangan.'),
(10, 'Ekonomi Pembangunan', 'Mempelajari pembangunan ekonomi dan strategi peningkatan kesejahteraan masyarakat.'),
(11, 'Bisnis Digital', 'Fokus pada manajemen bisnis berbasis teknologi dan digital marketing.'),
(12, 'Ilmu Administrasi Negara', 'Mempelajari pengelolaan pemerintahan dan kebijakan publik.'),
(13, 'Ilmu Administrasi Bisnis', 'Fokus pada manajemen organisasi dan strategi bisnis.'),
(14, 'Ilmu Komunikasi', 'Mempelajari media, jurnalistik, dan komunikasi organisasi.'),
(15, 'Hubungan Internasional', 'Mempelajari politik global dan hubungan antarnegara.'),
(16, 'Sosiologi', 'Mempelajari struktur, perilaku, dan dinamika masyarakat.'),
(17, 'Ilmu Politik', 'Fokus pada sistem politik, pemerintahan, dan kebijakan publik.'),
(18, 'Sastra Indonesia', 'Mempelajari bahasa, sastra, dan budaya Indonesia.'),
(19, 'Sastra Inggris', 'Fokus pada bahasa, sastra, dan budaya berbahasa Inggris.'),
(20, 'Sastra Jepang', 'Mempelajari bahasa, sastra, dan budaya Jepang.'),
(21, 'Linguistik', 'Fokus pada analisis bahasa, struktur, dan fungsinya.'),
(22, 'Agroteknologi', 'Mempelajari teknik dan teknologi budidaya tanaman.'),
(23, 'Agribisnis', 'Fokus pada manajemen usaha pertanian dan pemasaran produk.'),
(24, 'Ilmu Tanah', 'Mempelajari karakteristik tanah dan pengelolaannya untuk pertanian.'),
(25, 'Proteksi Tanaman', 'Fokus pada pengendalian hama, penyakit, dan gulma.'),
(26, 'Manajemen Sumber Daya Perairan', 'Mempelajari pengelolaan dan konservasi sumber daya air.'),
(27, 'Budidaya Perairan', 'Fokus pada teknik budidaya ikan dan organisme air lainnya.'),
(28, 'Teknologi Hasil Perikanan', 'Mempelajari pengolahan dan preservasi produk perikanan.'),
(29, 'Ilmu Kelautan', 'Mempelajari ekosistem laut, biologi laut, dan konservasi.'),
(30, 'Pendidikan Dokter', 'Mempelajari ilmu kedokteran untuk menjadi tenaga medis profesional.'),
(31, 'Keperawatan', 'Fokus pada perawatan pasien dan pelayanan kesehatan.'),
(32, 'Kebidanan', 'Mempelajari kesehatan ibu dan bayi serta praktik kebidanan.'),
(33, 'Kesehatan Masyarakat', 'Fokus pada pencegahan penyakit dan promosi kesehatan masyarakat.'),
(34, 'Gizi', 'Mempelajari ilmu gizi dan pola makan sehat.'),
(35, 'Farmasi', 'Mempelajari obat-obatan dan teknologi farmasi.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  `nim` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `role`, `nim`) VALUES
(1, 'admin1', 'scrypt:32768:8:1$JiKr2aZRs3MODjBQ$7295bb28627afaeafa6515b540f24a7a0ffdffd9abf288518eb75a223ca76c02fca4199ec497e30aa84c5d3adeef659e6ad0563267a9086d952a44c8e457e638', 'admin', 0),
(2, 'nathanielken', 'scrypt:32768:8:1$Ro7GiHO4FghCv1NL$5c192b258ede5993e5e49de016a5815f1785962c1e940d5853706166799ddffe45231146087aef9489602d87d419adb5863c262f8c66e8c0815b09a369174943', 'pengguna', 2023000001),
(3, 'sari', 'scrypt:32768:8:1$B7wIEr2s3XcfAeEZ$2b2872a9313b43586ad54263c7962b5d5929f7c6a915e7fe6f1a940eb12e99945d0d87cd3b38774072f6eefb6125b3b779e488ca9f150365cb1f60e04ef47006', 'pengguna', 2023000006),
(4, 'fajarnug', 'scrypt:32768:8:1$P9PXT7Qe1k8pUY0H$8e7ae18265995fee66969aa6b566e26817ecebdc8232aff72ceced82c79d2180c340faaaf08798eaac37f61db64bb1974cd8670161a68d4ab748791deb22f0f0', 'pengguna', 2023000009),
(5, 'rianbgs', 'scrypt:32768:8:1$HLskBn4eMFtTtAu4$f7879eb9e5aae6c4eedde9fe50e5277b3589e789b3068f4a7cf56e26666c0629463a50206fa71140fc75b02d6f4c7b9d505409eb9727bcf373700d6c4017797e', 'pengguna', 2023000014),
(6, 'andi', 'scrypt:32768:8:1$jkKnhHeFTeEgFKEv$14f6ef01d15ab0e78192e331d670137ed1de1df7a0f02f7d2432f5dbb8e053bcc130775e105b9874bd78fa6122a04ff82fc31bdd84ec85805575e26d7b390cfa', 'pengguna', 2023000017),
(7, 'siti', 'scrypt:32768:8:1$lYQoiHBlEZYf2r90$c24fea6bbdb44619dde05579755f87398635e3c8f2b9253edf18d69af2900f3dfb6233774a78d10ea889095dfd0059780a2619699b4da359cb44fff3f189f520', 'pengguna', 2023000002),
(8, 'alif', 'scrypt:32768:8:1$NwhqM5JMzNTvkmGw$3366cf02f227cd8646dbf9997a07586cada095644730c94d671686bd8e6965d5479139ca0298a2f0d5fad2a26f53b8a7df0efa34377ccb85cec6efe310aea36c', 'pengguna', 2023000003),
(9, 'riniokta', 'scrypt:32768:8:1$DTwPcg9rSzPkGpD0$3e48409ca9a8a1f68f08c75dd5b51f310cc28da1b7fed9b2a95369576e05c761ef16587b3d3f02a71507a29f1e2b89f65dd3916b2ea5bba45374efa11e48e74d', 'pengguna', 2023000010),
(10, 'hendra', 'scrypt:32768:8:1$nXKuEr7bCDLlHwCS$1ffa7b09592b5d32646d1489cad52488acf8e80fa85d601e500026bdbab5d82da65eae17e057e1955bf42d843ef7428e4ce6ccbcda28b75acdfea5f684318eef', 'pengguna', 2023000011),
(11, 'arif', 'scrypt:32768:8:1$jigFpcFp83kCLALs$1cd1a34093d335ea2bc0ef797212a2df731e3bd48eac920f3a720d1864285179db26b78e3e05157d19c1f8bf727276e0ff79dcd3064c7824d5353be559586b77', 'pengguna', 2023000013),
(12, 'zidan', 'scrypt:32768:8:1$FqaxA6ct1Y8nvk8g$dc48e8d8d42036713e6d6454a9bf21c6e50ecc533044731a9184dd9a03718ec4ea10e7b84861be200980202a7c4475681a44f3ddd8346bac37ffa11b070fe817', 'pengguna', 2023000016),
(13, 'gian', 'scrypt:32768:8:1$VQIpUV9TILSCUxnL$3895645428f9459b190724f3d2d56d53d25fe5fe964b9051788704f880390ae1cd10f5045463faba5794d46f7262f2a08a9d1459c76a74f6cc0b572d83def5b8', 'pengguna', 2023000020),
(14, 'agnia', 'scrypt:32768:8:1$a8a1LsqUPwzhcOEu$7ce6aa3f4895f1b24c4e6207dd7c357e169c6d2da599555622705b1dd5576c4877204031afd89ccb41832dc8c21141486c0759df8037b4d485ec4a7c7e782e9d', 'pengguna', 2023000007),
(15, 'maya', 'scrypt:32768:8:1$2Ggei4bshvfP69S1$34cec08a814b113aa0630bc97f8898fb58ab7f2ea1819e9b3376078f8c605ec416e1b8fb74722a419bdc38f605248449da1328ef32bbe557f4b2716c1228d030', 'pengguna', 2023000015),
(16, 'marisa', 'scrypt:32768:8:1$6Zi3b6bqTou6SUug$a271b012b922aa02fa902a5caa53efbf8f51c660fb0390fad6b9f3905b5c4778bb9d62f3e4971cc0bd755887c9faea0d9eb4c32d88b3cc8d582a4819ab05abfa', 'pengguna', 2023000018),
(17, 'fina', 'scrypt:32768:8:1$JMLsarUto8aEMA6u$3b783d6e50dc8a7fd6f1f9691e838758a2ef9581c67f6339c32f83bdc12dac052c1293b7f9dcf53d6d9793a0bf58fba3391e130cb64f90ee780c6859c587345c', 'pengguna', 2023000019),
(18, 'dinda', 'scrypt:32768:8:1$4QLEgUPyF09fGGDx$3be98afb97d7abdda18d51a289b61d2dfa2cd98d3bed10770f2958729b3cc20403c0a549ee1a243bf08955d61d02957446fa180e25bc425dea2e9ef698928348', 'pengguna', 2023000004),
(19, 'agus', 'scrypt:32768:8:1$42ZSzUUHiZYXDLyz$d80f83c0e88d39d2e750e9353a00cd4a8ade8130913c213fb0b3fef344905e24c17959b9ca87eb249d28874fc4329f3afff3c94e6353815fb8e0f419b68f7771', 'pengguna', 2023000008),
(20, 'rizky', 'scrypt:32768:8:1$70TTUTZojKq8x0rT$25beec635e2af11c2ba876fc5c4857e544d67e0508dfb24001567af906d5cf622e2a1e156697b7cb1516e43be8e726e370e91096cff36a596709730857c3e8e6', 'pengguna', 2023000005),
(21, 'nadia', 'scrypt:32768:8:1$lKS18m5lbtabYq8U$4f3c95a6b022c4f51a2f57588bdeb2c3c4ffcc2be17a985cd29d60a4d4d4462c0476465f61b725a0384eece87b225e17840327dd53012df1c732deb9de078646', 'pengguna', 2023000012);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daftar_alumni`
--
ALTER TABLE `daftar_alumni`
  ADD PRIMARY KEY (`nim`),
  ADD KEY `id_prodi` (`id_prodi`),
  ADD KEY `id_fakultas` (`id_fakultas`);

--
-- Indexes for table `daftar_fakultas`
--
ALTER TABLE `daftar_fakultas`
  ADD PRIMARY KEY (`id_fakultas`);

--
-- Indexes for table `daftar_prodi`
--
ALTER TABLE `daftar_prodi`
  ADD PRIMARY KEY (`id_prodi`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `nim` (`nim`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daftar_fakultas`
--
ALTER TABLE `daftar_fakultas`
  MODIFY `id_fakultas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `daftar_prodi`
--
ALTER TABLE `daftar_prodi`
  MODIFY `id_prodi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `daftar_alumni`
--
ALTER TABLE `daftar_alumni`
  ADD CONSTRAINT `fk_alumni_fakultas` FOREIGN KEY (`id_fakultas`) REFERENCES `daftar_fakultas` (`id_fakultas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_alumni_prodi` FOREIGN KEY (`id_prodi`) REFERENCES `daftar_prodi` (`id_prodi`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
