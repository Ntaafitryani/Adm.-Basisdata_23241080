-- Nama : Sinta Putriani
-- NIM : 23241080
-- Kelas : C
-- Modul : Modul 1 Data Definition Langauge

-- Mebuat Database
CREATE DATABASE pti_mart;

-- Menggunakan DATABASE
USE pti_mart;

-- Membuat Tabel
CREATE TABLE pelanggan(
 id_pelanggan int PRIMARY KEY NOT NULL,
 nama_pelanggan VARCHAR(50),
 alamat VARCHAR(100),
 kota VARCHAR (20),
 no_tlp VARCHAR (15)
);

CREATE TABLE produk(
 id_produk int PRIMARY KEY NOT NULL,
 nama_produk VARCHAR (50),
 kategori VARCHAR (20),
 harga int (17),
 stok int (10)
); 
 
-- membuat tabel dengan foreign key
CREATE TABLE transaksi(
 id_transaksi int PRIMARY KEY NOT NULL,
 tgl_transaksi DATE,
 id_produk int,
 id_pelanggan int,
 qty int,
 total_harga int,
 FOREIGN KEY (id_produk) REFERENCES produk (id_produk),
 FOREIGN KEY (id_pelanggan) REFERENCES pelanggan (id_pelanggan)
 );
 
-- mengisi data dalam tabel
INSERT INTO pelanggan(
id_pelanggan, nama_pelanggan, alamat, kota, no_tlp
)VALUES
(234,"Sinta", "JL mdapangga No.243", "Bima", "08266600114"),
(235,"Diah", "Jl Bung harto No.238", "Lombok", "134168251897"),
(236,"Wiwin", "Jl swasembada No.347", "Taliwang", "24616824245"),
(238,"Dila", "Jl selaparang No.675", "Talabiu","1572751638"),
(239,"reski", "Jl bunglon No.650", "Mataram","16418546382");


INSERT INTO produk(
id_produk, nama_produk, kategori, harga, stok
)VALUES
(012,"Mie ayam", "makanan", "15000", "12"),
(013,"Es teh", "minuman", "3000", "23"),
(014,"Es cream", "minuman", "5000", "13"),
(015,"Ayam geprek", "makanan", "10000", "9"),
(016,"Bakso bakar", "makanan", "10000", "17");

-- cek apakah data ada 
SELECT * FROM pelanggan;
SELECT * FROM produk;

-- mengisi data pada tabel yang ada foreign key
INSERT INTO transaksi
 set id_transaksi = 2675,
	 tgl_transaksi = "2025-09-05",
     id_produk = (
     SELECT id_produk FROM produk
     WHERE id_produk = 012),
     id_pelanggan = (234
     SELECT id_pelanggan FROM pelanggan
     WHERE id_pelanggan = 012),
     qty = 1,
     total_harga = (
     SELECT harga FROM produk
     WHERE id_produk = 012) * qty;
     
SELECT * FROM transaksi;
     
 
 