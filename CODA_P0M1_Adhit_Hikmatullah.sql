/*
=================================================
Milestone 1

Nama  : Adhit Hikmatullah
Batch : CODA-RMT-010

Program ini dibuat sebagai database dari data web scraping yang sebelumnya sudah dilakukan.
=================================================
*/

---Buat Database---
CREATE DATABASE m1phase0;

--Table Data Buku
CREATE TABLE data_buku(
id SERIAL Primary Key,
nama_buku VARCHAR (255),
penulis VARCHAR (100),
detail_produk VARCHAR (50),
harga_lama INTEGER,
harga_diskon INTEGER,
tanggal_terbit VARCHAR (50)
)

--Cek Tabel
SELECT * FROM data_buku;

--Drop Tabel
DROP TABLE data_buku;

--Copy Tabel, Menambahkan data dari file csv
COPY data_buku(id, nama_buku, penulis, detail_produk, harga_lama, harga_diskon, tanggal_terbit)
FROM 'C:\temp\CODA_P0M1_Adhit_Hikmatullah.csv'
DELIMITER ','
CSV HEADER;

---Melakukan Normalisasi---

--Membuat id penulis
CREATE TABLE new_penulis(
id SERIAL Primary Key,
penulis VARCHAR (100)
)

--Membuat id detail buku
CREATE TABLE new_detail_buku(
id SERIAL Primary Key,
detail_produk VARCHAR (50)
)

--Menggabungkan data-data sebelumnya
CREATE TABLE new_data_buku(
id SERIAL Primary Key,
nama_buku VARCHAR (255),
id_penulis INTEGER REFERENCES new_penulis(id),
id_detail_buku INTEGER REFERENCES new_detail_buku(id),
harga_lama INTEGER,
harga_diskon INTEGER,
tanggal_terbit VARCHAR (50)
)

SELECT * FROM new_data_buku;