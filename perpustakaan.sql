-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Bulan Mei 2024 pada 13.16
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_beli`
--

CREATE TABLE `tbl_beli` (
  `nofaktur` varchar(11) NOT NULL,
  `kd_barang` varchar(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `hsatuan` int(11) NOT NULL,
  `jumlah_beli` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `bayar` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `tbl_beli`
--

INSERT INTO `tbl_beli` (`nofaktur`, `kd_barang`, `nama_barang`, `hsatuan`, `jumlah_beli`, `harga`, `bayar`, `kembalian`, `tanggal`) VALUES
('F0001', 'B0002', 'setrika', 670000, 1, 670000, 6000000, 730000, '2018-05-15'),
('F0001', 'B0003', 'televisi', 2300000, 2, 4600000, 6000000, 730000, '2018-05-15'),
('F0002', 'B0005', 'mesin cuci', 5780000, 2, 11560000, 20000000, 40000, '2018-05-15'),
('F0002', 'B0001', 'kulkas', 1500000, 1, 1500000, 20000000, 40000, '2018-05-15'),
('F0002', 'B0003', 'televisi', 2300000, 3, 6900000, 20000000, 40000, '2018-05-15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_buku`
--

CREATE TABLE `tbl_buku` (
  `kode` int(200) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `jenis` varchar(200) NOT NULL,
  `produksi` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_buku`
--

INSERT INTO `tbl_buku` (`kode`, `judul`, `jenis`, `produksi`) VALUES
(2, 'siksa kubur', 'novel', '2024'),
(3, 'kisah rusdi dan amba', 'novel', '2020'),
(5, 'kisakh mu juara fa', 'dokumenter', '2024');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pelanggan`
--

CREATE TABLE `tbl_pelanggan` (
  `id` int(200) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `status` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_pelanggan`
--

INSERT INTO `tbl_pelanggan` (`id`, `nama`, `alamat`, `status`) VALUES
(1, 'sudar', 'balerejo', 'duda anak 3'),
(2, 'hafid', 'jeruk gulung', 'janda anak 3'),
(3, 'fadil', 'plumpung', 'ketua iks');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_sewa`
--

CREATE TABLE `tbl_sewa` (
  `id_sewa` int(11) NOT NULL,
  `no_pelanggan` int(11) DEFAULT NULL,
  `kode_buku` int(11) DEFAULT NULL,
  `tgl_pinjam` date DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `jumlah_buku` int(11) DEFAULT NULL,
  `total_bayar` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_sewa`
--

INSERT INTO `tbl_sewa` (`id_sewa`, `no_pelanggan`, `kode_buku`, `tgl_pinjam`, `tgl_kembali`, `jumlah_buku`, `total_bayar`) VALUES
(1, 1, 2, '2024-05-01', '2024-05-09', 3, 21000.00),
(2, 1, 2, '2024-05-02', '2024-05-30', 1, 10000.00),
(3, 1, 2, '2024-05-01', '2024-05-09', 1, 7000.00);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_buku`
--
ALTER TABLE `tbl_buku`
  ADD PRIMARY KEY (`kode`);

--
-- Indeks untuk tabel `tbl_pelanggan`
--
ALTER TABLE `tbl_pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_sewa`
--
ALTER TABLE `tbl_sewa`
  ADD PRIMARY KEY (`id_sewa`),
  ADD KEY `no_pelanggan` (`no_pelanggan`),
  ADD KEY `kode_buku` (`kode_buku`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_buku`
--
ALTER TABLE `tbl_buku`
  MODIFY `kode` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tbl_pelanggan`
--
ALTER TABLE `tbl_pelanggan`
  MODIFY `id` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tbl_sewa`
--
ALTER TABLE `tbl_sewa`
  MODIFY `id_sewa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_sewa`
--
ALTER TABLE `tbl_sewa`
  ADD CONSTRAINT `tbl_sewa_ibfk_1` FOREIGN KEY (`no_pelanggan`) REFERENCES `tbl_pelanggan` (`id`),
  ADD CONSTRAINT `tbl_sewa_ibfk_2` FOREIGN KEY (`kode_buku`) REFERENCES `tbl_buku` (`kode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
