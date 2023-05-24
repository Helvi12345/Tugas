SELECT produk.*, jenis_produk.nama AS jenis FROM jenis_produk INNER JOIN produk
ON produk.jenis_produk_id = jenis_produk.id;

-- Menyingkat nama atau membuat aliasnya
SELECT p.*, j.nama AS jenis FROM jenis_produk j INNER JOIN produk p ON p.jenis_produk_id = j.id;

-- -----------------------------------------------------
-- Membuat table view
CREATE VIEW detail_produk_vw AS
SELECT p.*, j.nama AS jenis FROM jenis_produk j INNER JOIN produk p ON p.jenis_produk_id = j.id;

-- Pemanggilan table view yang sudah dibuat
SELECT * FROM detail_produk_vw;
-- -----------------------------------------------------

-- Melihat table view yang pernah dibuat
SHOW FULL TABLES;

SELECT * FROM pesanan;

-- COMMIT mengakhiri transaksi yang sedang terjadi dengan merubah semua pending data menjadi permanen
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO pesanan(tanggal, total, pelanggan_id) VALUES
('2023-02-01', 200000, 1);

COMMIT;
-- -----------------------------------------------------

-- ROLLBACK mengembalikan transaksi kebentuk semula sampai bertemu COMMIT terakhir kali
-- -----------------------------------------------------

START TRANSACTION;

DELETE FROM pesanan;

SELECT * FROM pesanan;

ROLLBACK;
-- -----------------------------------------------------

-- SAVEPOINT menggunakan transaksi dengan memberikan nama pada transaksinya
-- -----------------------------------------------------
START TRANSACTION;

SAVEPOINT update_tanggal;

UPDATE pesanan set tanggal='2023-03-03' WHERE id=4;

SELECT * FROM pesanan;