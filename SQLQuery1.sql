use master
GO
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'THUVIEN')
BEGIN
    DROP DATABASE THUVIEN;
END
GO

--Tao CSDL
create database THUVIENA
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
