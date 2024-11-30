use master
GO
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'THUVIEN')
BEGIN
    DROP DATABASE THUVIEN;
END
GO

--Tao CSDL
create database THUVIEN
GO
use THUVIEN
GO
CREATE TABLE themuon (
    maTheMuon VARCHAR(10) PRIMARY KEY,
    ngayHetHan VARCHAR(15),
    trangThai INT ,
    maKichHoat VARCHAR(10),
    maNguoiMuon VARCHAR(10)
);

CREATE TABLE nguoimuon (
    maNguoiMuon VARCHAR(10) PRIMARY KEY,
    tenTaiKhoan VARCHAR(20),
    mssv VARCHAR(8),
    soTienDatCoc INT ,
    giaiDoanHoc VARCHAR(15),
    trangThai INT
);

CREATE TABLE taikhoan (
    tenTaiKhoan VARCHAR(20) PRIMARY KEY,
    matKhau VARCHAR(20),
    ten VARCHAR(45),
    gioiTinh VARCHAR(3),
    email VARCHAR(50),
    soDienThoai VARCHAR(15)
);

CREATE TABLE thuthu (
    maThuThu VARCHAR(10) PRIMARY KEY,
    tenTaiKhoan VARCHAR(20),
    ngaySinh VARCHAR(10)
);

CREATE TABLE thongtinmuontrasach (
    maThongTinMuonTraSach VARCHAR(15) PRIMARY KEY,
    ngayDangKy VARCHAR(10),
    hanTra VARCHAR(10),
    trangThai VARCHAR(15),
    maNguoiMuon VARCHAR(15),
    tienDatCoc INT 
);

CREATE TABLE chitietmuonsach (
    maThongTinMuonSach VARCHAR(15) PRIMARY KEY,
    maBanSaoSach VARCHAR(10),
    trangThai INT,
    ngayMuon VARCHAR(45),
    ngayTra VARCHAR(45),
    tienPhat INT,
    lyDoPhat VARCHAR(200)
);

CREATE TABLE nhaphathanh (
    maNhaPhatHanh INT  PRIMARY KEY,
    tenNhaPhatHanh VARCHAR(45)
);

CREATE TABLE bansaosach (
    maSach VARCHAR(6),
    maBanSao VARCHAR(10) PRIMARY KEY,
    soThuTu INT ,
    loaiBanSao INT ,
    gia INT ,
    trangThai INT ,
    xoa INT 
);

CREATE TABLE sach (
    maSach VARCHAR(6) PRIMARY KEY,
    tenSach VARCHAR(45),
    maNhaPhatHanh INT ,
    isbn VARCHAR(13)
);

CREATE TABLE chitiettacgia (
    maSach VARCHAR(6),
    maTacGia INT ,
    PRIMARY KEY (maSach, maTacGia)
);

CREATE TABLE tacgia (
    maTacGia INT  PRIMARY KEY,
    tenTacGia VARCHAR(45)
);
-- Sử dụng cơ sở dữ liệu thu_vien
USE THUVIEN;

-- Chèn dữ liệu vào bảng themuon
INSERT INTO themuon (maTheMuon, ngayHetHan, trangThai, maKichHoat, maNguoiMuon)
VALUES 
('TM001', '2024-12-31', 1, 'MKH001', 'NM001'),
('TM002', '2025-01-15', 1, 'MKH002', 'NM002');

-- Chèn dữ liệu vào bảng nguoimuon
INSERT INTO nguoimuon (maNguoiMuon, tenTaiKhoan, mssv, soTienDatCoc, giaiDoanHoc, trangThai)
VALUES 
('NM001', 'tk001', '12345678', 1000000, 'K54', 1),
('NM002', 'tk002', '87654321', 1500000, 'K55', 1);

-- Chèn dữ liệu vào bảng taikhoan
INSERT INTO taikhoan (tenTaiKhoan, matKhau, ten, gioiTinh, email, soDienThoai)
VALUES 
('tk001', 'pass001', 'Nguyen Van A', 'M', 'a@example.com', '0123456789'),
('tk002', 'pass002', 'Tran Thi B', 'F', 'b@example.com', '0987654321');

-- Chèn dữ liệu vào bảng thuthu
INSERT INTO thuthu (maThuThu, tenTaiKhoan, ngaySinh)
VALUES 
('TT001', 'tk003', '1980-01-01'),
('TT002', 'tk004', '1975-05-20');

-- Chèn dữ liệu vào bảng thongtinmuontrasach
INSERT INTO thongtinmuontrasach (maThongTinMuonTraSach, ngayDangKy, hanTra, trangThai, maNguoiMuon, tienDatCoc)
VALUES 
('MT001', '2024-11-01', '2024-12-01', 'DangMuon', 'NM001', 200000),
('MT002', '2024-12-01', '2025-01-01', 'DaTra', 'NM002', 300000);

-- Chèn dữ liệu vào bảng chitietmuonsach
INSERT INTO chitietmuonsach (maThongTinMuonSach, maBanSaoSach, trangThai, ngayMuon, ngayTra, tienPhat, lyDoPhat)
VALUES 
('CTMS001', 'BS001', 1, '2024-11-01', '2024-12-01', 50000, 'Quá hạn'),
('CTMS002', 'BS002', 0, '2024-12-01', '2024-12-25', 0, '');

-- Chèn dữ liệu vào bảng nhaphathanh
INSERT INTO nhaphathanh (maNhaPhatHanh, tenNhaPhatHanh)
VALUES 
(1, 'Nha Xuat Ban Tre'),
(2, 'Nha Xuat Ban Giao Duc');

-- Chèn dữ liệu vào bảng bansaosach
INSERT INTO bansaosach (maSach, maBanSao, soThuTu, loaiBanSao, gia, trangThai, xoa)
VALUES 
('S001', 'BS001', 1, 1, 100000, 1, 0),
('S002', 'BS002', 1, 2, 120000, 1, 0);

-- Chèn dữ liệu vào bảng sach
INSERT INTO sach (maSach, tenSach, maNhaPhatHanh, isbn)
VALUES 
('S001', 'Lap trinh C', 1, '9781234567890'),
('S002', 'Cau truc du lieu', 2, '9780987654321');

-- Chèn dữ liệu vào bảng chitiettacgia
INSERT INTO chitiettacgia (maSach, maTacGia)
VALUES 
('S001', 1),
('S002', 2);

-- Chèn dữ liệu vào bảng tacgia
INSERT INTO tacgia (maTacGia, tenTacGia)
VALUES 
(1, 'Nguyen Nhat Anh'),
(2, 'Nguyen Van B');
