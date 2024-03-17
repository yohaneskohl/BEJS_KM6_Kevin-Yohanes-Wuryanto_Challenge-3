
--create table bank account--
CREATE TABLE nasabah (
    id_nasabah BIGSERIAL PRIMARY KEY,
    nama VARCHAR(255) NOT NULL,
    nama_ibu VARCHAR(255) NOT NULL,
    alamat VARCHAR(255) NOT NULL,
    KTP VARCHAR(13) NOT NULL,
    kelamin VARCHAR(255) NOT NULL
);

CREATE TABLE akun (
    id_akun BIGSERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    saldo DECIMAL(15, 2) DEFAULT 0,
    no_rek VARCHAR(255) NOT NULL,
    id_nasabah INT NOT NULL
);

CREATE TABLE transaksi (
    id_transaksi BIGSERIAL PRIMARY KEY,
    tanggal DATE NOT NULL,
    jenis_transaksi varchar(255)NOT NULL,
    catatan text NOT NULL,
    id_akun INT NOT NULL
);

--Insert data awal--
-- Insert data into nasabah table
INSERT INTO nasabah (nama, nama_ibu, alamat, KTP, kelamin) 
VALUES 
    ('kevin', 'viny', 'Surabaya', '357001', 'laki-laki'),
    ('yohanes', 'nesy', 'Medan', '357002', 'laki-laki'),
    ('yawa', 'wasy', 'Jakarta', '357003', 'wanita'),
    ('yoko', 'kyosy', 'Sidoarjo', '357004', 'laki-laki'),
    ('bunga', 'berty', 'Malang', '357005', 'wanita');

-- Insert data into akun table
INSERT INTO akun (email, password, saldo, no_rek, id_nasabah)
VALUES 
    ('kevin@gmail.com', 'kevin123', 500000.00, 'R0001', 1),
    ('yohanes@gmail.com', 'yohanes123', 1000000.00, 'R0002', 2),
    ('yawa@gmail.com', 'yawa123', 750000.00, 'R0003', 3),
    ('yoko@gmail.com', 'yoko123', 300000.00, 'R0004', 4),
    ('bunga@gmail.com', 'albert123', 2000000.00, 'R0005', 5);

-- Insert data into transaksi table
INSERT INTO transaksi (tanggal, jenis_transaksi, catatan, id_akun)
VALUES 
    ('2024-03-13', 'deposit', 'Deposito awal', 1),
    ('2024-03-14', 'withdraw', 'Penarikan tunai', 2),
    ('2024-03-15', 'deposit', 'Penyetoran bulanan', 3),
    ('2024-03-16', 'withdraw', 'Pembelian barang', 4),
    ('2024-03-17', 'deposit', 'Gaji masuk', 5);

--Insert Data Baru--
-- Insert data into Nasabah table
INSERT INTO nasabah (nama, nama_ibu, alamat, KTP, kelamin) 
VALUES ('sabrina', 'Sobrono', 'Medan', '357006', 'wanita');

-- Insert data into Akun table
INSERT INTO akun (email, password, saldo, no_rek, id_nasabah)
VALUES ('sabrina@gmail.com', 'sabrina123', 500000.00, 'R0006', 6);

-- Insert data into Transaksi table
INSERT INTO transaksi (tanggal, jenis_transaksi, catatan, id_akun)
VALUES ('2024-03-18', 'deposit', 'Deposito tambahan', 6);

--select table--
-- Select all Nasabah
SELECT * FROM nasabah;

-- Select all Akun
SELECT * FROM akun;

-- Select all Transaksi
SELECT * FROM transaksi;

--update table--
-- Update saldo in Akun table
UPDATE akun 
SET saldo = saldo + 500 
WHERE no_rek = 'R0001';

-- Update nama in Nasabah table
UPDATE nasabah 
SET alamat = 'Batam'
WHERE nama = 'bunga';

-- Delete --
-- Delete Nasabah with specific ID
DELETE FROM nasabah WHERE id_nasabah = 6;

-- Delete Akun with specific ID
DELETE FROM akun WHERE id_akun = 6;

-- Delete Transaksi with specific ID
DELETE FROM transaksi WHERE id_transaksi = 6;

--gabungan--
WITH akun_nasabah AS (
    SELECT akun.id_akun, akun.email, akun.saldo, nasabah.nama
    FROM akun
    INNER JOIN nasabah ON akun.id_nasabah = nasabah.id_nasabah
)
SELECT akun_nasabah.id_akun, akun_nasabah.email, akun_nasabah.nama, akun_nasabah.saldo
FROM akun_nasabah;


