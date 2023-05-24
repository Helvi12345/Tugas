SELECT * FROM pelanggan;

-- Buat fungsi inputPelanggan()

CREATE FUNCTION inputPelanggan(
  IN kode VARCHAR(10),
  IN nama_pelanggan VARCHAR(45),
  IN jk CHAR(1),
  IN tmp_lahir VARCHAR(30),
  IN tgl_lahir DATE,
  IN email VARCHAR(45),
  IN kartu_id INT
) RETURNS INT
BEGIN
  INSERT INTO pelanggan (kode, nama_pelanggan, jk, tmp_lahir, tgl_lahir, email, kartu_id)
  VALUES (kode, nama_pelanggan, jk, tmlahir, tgl_lahir, email, kartu_id);
  RETURN LAST_INSERT_ID();
END;

-- Panggil fungsi inputPelanggan()

SELECT inputPelanggan('011106', 'fitri', 'P', 'Kendari', '2003-01-01', 'fitri@gmail.com', 1);

-- -----------------------------------------------------------------------------------------

-- Buat fungsi showPelanggan()

CREATE FUNCTION showPelanggan()
RETURNS TABLE
AS
RETURN SELECT * FROM pelanggan;

-- Panggil fungsi showPelanggan()

SELECT * FROM showPelanggan();

-- -----------------------------------------------------------------------------------------

-- Buat fungsi inputProduk()

CREATE FUNCTION inputProduk(
  IN kode VARCHAR(10),
  IN nama_pelanggan VARCHAR(45),
  IN harga_beli DOUBLE,
  IN harga_jual DOUBLE,
  IN stok INT,
  IN min_stok INT,
  IN jenis_produk_id INT
) RETURNS INT
BEGIN
  INSERT INTO produk (kode, nama_pelanggan, harga_beli, harga_jual, stok, min_stok, jenis_produk_id)
  VALUES (kode, nama_pelanggan, harga_beli, harga_jual, stok, min_stok, jenis_produk_id);
  RETURN LAST_INSERT_ID();
END;

-- Panggil fungsi inputProduk()

SELECT inputProduk('PR001', 'Product A', 12000, 20000, 15, 5, 1);

-- -----------------------------------------------------------------------------------------

-- Buat fungsi showProduk()

CREATE FUNCTION showProduk()
RETURNS TABLE
AS
RETURN SELECT * FROM produk;
-- Panggil fungsi showProduk()

SELECT * FROM showProduk();

-- -----------------------------------------------------------------------------------------

-- Buat fungsi totalPesanan()

CREATE FUNCTION totalPesanan(p_pelanggan_id INT)
RETURNS DOUBLE
BEGIN
  DECLARE total_pesanan DOUBLE;
  SELECT SUM(total) INTO total_pesanan FROM pesanan WHERE pelanggan_id = p_pelanggan_id;
  RETURN total_pesanan;
END;

-- Panggil fungsi totalPesanan()

SELECT totalPesanan(1);

-- -----------------------------------------------------------------------------------------

-- Tampilkan seluruh pesanan dari semua pelanggan

SELECT pesanan.id, pesanan.tanggal, pesanan.total, pelanggan.nama_pelanggan, produk.nama
FROM pesanan
JOIN pelanggan ON pesanan.pelanggan_id = pelanggan.id
JOIN produk ON pesanan.produk_id = produk.id;

-- Buat tampilan pesanan_produk_vw

CREATE VIEW pesanan_produk_vw AS
SELECT pesanan.id AS pesanan_id, pesanan.tanggal, pesanan.total, pelanggan.nama AS pelanggan_nama, produk.nama AS produk_nama
FROM pesanan
JOIN pelanggan ON pesanan.pelanggan_id = pelanggan.id
JOIN produk ON pesanan.produk_id = produk.id;

-- Panggil tampilan pesanan_produk_vw

SELECT * FROM pesanan_produk_vw;