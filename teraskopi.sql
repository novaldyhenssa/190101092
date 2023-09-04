-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Sep 2023 pada 01.48
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_restoran`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_level`
--

CREATE TABLE `tb_level` (
  `id_level` int(11) NOT NULL,
  `nama_level` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_level`
--

INSERT INTO `tb_level` (`id_level`, `nama_level`) VALUES
(1, 'Administrator'),
(4, 'Owner'),
(5, 'Pelanggan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_masakan`
--

CREATE TABLE `tb_masakan` (
  `id_masakan` int(11) NOT NULL,
  `nama_masakan` varchar(150) NOT NULL,
  `harga` varchar(150) NOT NULL,
  `stok` int(11) NOT NULL,
  `status_masakan` varchar(150) NOT NULL,
  `gambar_masakan` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_masakan`
--

INSERT INTO `tb_masakan` (`id_masakan`, `nama_masakan`, `harga`, `stok`, `status_masakan`, `gambar_masakan`) VALUES
(23, 'Vietnam drip', '10000', 56, 'tersedia', 'Vietnam drip.jpg'),
(24, 'V60', '15000', 44, 'tersedia', 'V60.jpg'),
(26, 'Tubruk Susu', '15000', 65, 'tersedia', 'Tubruk Susu.jpg'),
(27, 'Jepanes', '15000', 12, 'tersedia', 'Jepanes.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_order`
--

CREATE TABLE `tb_order` (
  `id_order` int(11) NOT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `id_pengunjung` int(11) NOT NULL,
  `waktu_pesan` datetime NOT NULL,
  `no_meja` int(11) NOT NULL,
  `total_harga` varchar(150) NOT NULL,
  `uang_bayar` varchar(150) DEFAULT NULL,
  `uang_kembali` varchar(150) DEFAULT NULL,
  `status_order` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_order`
--

INSERT INTO `tb_order` (`id_order`, `id_admin`, `id_pengunjung`, `waktu_pesan`, `no_meja`, `total_harga`, `uang_bayar`, `uang_kembali`, `status_order`) VALUES
(28, 1, 44, '2023-09-03 04:07:31', 0, '45000', '55000', '10000', 'sudah bayar');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pesan`
--

CREATE TABLE `tb_pesan` (
  `id_pesan` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_order` int(11) DEFAULT NULL,
  `id_masakan` int(11) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `status_pesan` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_pesan`
--

INSERT INTO `tb_pesan` (`id_pesan`, `id_user`, `id_order`, `id_masakan`, `jumlah`, `status_pesan`) VALUES
(64, 44, 28, 27, 1, 'sudah'),
(65, 44, 28, 24, 2, 'sudah'),
(68, 44, 0, 27, 0, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_stok`
--

CREATE TABLE `tb_stok` (
  `id_stok` int(11) NOT NULL,
  `id_pesan` int(11) NOT NULL,
  `jumlah_terjual` int(11) DEFAULT NULL,
  `status_cetak` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_stok`
--

INSERT INTO `tb_stok` (`id_stok`, `id_pesan`, `jumlah_terjual`, `status_cetak`) VALUES
(1, 46, 1, 'belum cetak'),
(2, 47, 2, 'belum cetak'),
(3, 48, 2, 'belum cetak'),
(4, 49, 1, 'belum cetak'),
(5, 50, 2, 'belum cetak'),
(6, 51, 0, 'belum cetak'),
(7, 52, 0, 'belum cetak'),
(8, 53, 0, 'belum cetak'),
(9, 54, 0, 'belum cetak'),
(10, 55, 0, 'belum cetak'),
(11, 56, 2, 'belum cetak'),
(12, 57, 1, 'belum cetak'),
(13, 58, 6, 'belum cetak'),
(14, 59, 1, 'belum cetak'),
(15, 60, 1, 'belum cetak'),
(16, 61, 2, 'belum cetak'),
(17, 62, 1, 'belum cetak'),
(18, 63, 1, 'belum cetak'),
(19, 64, 1, 'belum cetak'),
(20, 65, 2, 'belum cetak'),
(21, 66, 1, 'belum cetak'),
(22, 67, 1, 'belum cetak'),
(23, 68, 0, 'belum cetak');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `nama_user` varchar(150) NOT NULL,
  `id_level` int(11) NOT NULL,
  `status` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `username`, `password`, `nama_user`, `id_level`, `status`) VALUES
(1, 'admin', 'admin', 'ADMINISTRATOR', 1, 'aktif'),
(44, 'fitri', 'fitri', 'fitri', 5, 'aktif'),
(45, 'Owner', 'Owner', 'Owner', 4, 'aktif'),
(46, 'Pelanngan', 'Pelanngan', 'Pelanngan', 5, 'aktif');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_level`
--
ALTER TABLE `tb_level`
  ADD PRIMARY KEY (`id_level`);

--
-- Indeks untuk tabel `tb_masakan`
--
ALTER TABLE `tb_masakan`
  ADD PRIMARY KEY (`id_masakan`);

--
-- Indeks untuk tabel `tb_order`
--
ALTER TABLE `tb_order`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_admin` (`id_admin`),
  ADD KEY `id_pengunjung` (`id_pengunjung`);

--
-- Indeks untuk tabel `tb_pesan`
--
ALTER TABLE `tb_pesan`
  ADD PRIMARY KEY (`id_pesan`);

--
-- Indeks untuk tabel `tb_stok`
--
ALTER TABLE `tb_stok`
  ADD PRIMARY KEY (`id_stok`);

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `id_level` (`id_level`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_level`
--
ALTER TABLE `tb_level`
  MODIFY `id_level` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tb_masakan`
--
ALTER TABLE `tb_masakan`
  MODIFY `id_masakan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `tb_order`
--
ALTER TABLE `tb_order`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `tb_pesan`
--
ALTER TABLE `tb_pesan`
  MODIFY `id_pesan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT untuk tabel `tb_stok`
--
ALTER TABLE `tb_stok`
  MODIFY `id_stok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`id_level`) REFERENCES `tb_level` (`id_level`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
