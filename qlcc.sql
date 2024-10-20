CREATE DATABASE QUANLICHUNGCU
GO
USE QUANLICHUNGCU
GO 
DROP DATABASE QUANLICHUNGCU
CREATE TABLE TaiKhoan (
    TenDangNhap CHAR(10) PRIMARY KEY,
    MatKhau NVARCHAR(255),
    RoleID INT NOT NULL
);
CREATE TABLE NhanVien (
    MaNhanVien CHAR(10) PRIMARY KEY,
    HoTen NVARCHAR(100),
    ChucVu NVARCHAR(50),
    SoDienThoai CHAR(15),
    Email NVARCHAR(100),   
);
DROP table BangLuong
CREATE TABLE BangLuong (
    MaLuong CHAR(10) PRIMARY KEY,
    MaNhanVien CHAR(10),  
    NgayTra Date, 
    LuongCoBan FLOAT, 
	TrangThai nvarchar(50),
	
    FOREIGN KEY (MaNhanVien) REFERENCES NhanVien(MaNhanVien) ON DELETE CASCADE
);
CREATE TABLE CanHo (
    MaCanHo CHAR(10) PRIMARY KEY,
    DienTich DECIMAL(10, 2),
    LoaiCanHo NVARCHAR(50),
    GiaThue decimal,
    TinhTrang NVARCHAR(50)  -- Ví dụ: Trống, Đã bán, Đã cho thuê
);

CREATE TABLE CuDan (
    MaCuDan CHAR(10) PRIMARY KEY,
    HoTen NVARCHAR(100),
    SoDienThoai NVARCHAR(15),
    Email NVARCHAR(100),
    CMND NVARCHAR(12),
    MaCanHo CHAR(10),  
    NgaySinh DATE,
    FOREIGN KEY (MaCanHo) REFERENCES CanHo(MaCanHo) ON DELETE SET NULL
);
Drop table HoaDon
CREATE TABLE HoaDon (
    MaHoaDon CHAR(10) PRIMARY KEY,
    MaCuDan CHAR(10),  
    NgayLap DATE,
    TongTien FLOAT,
    TrangThaiThanhToan NVARCHAR(50),
    FOREIGN KEY (MaCuDan) REFERENCES CuDan(MaCuDan) ON DELETE CASCADE
);
CREATE TABLE HopDong (
    MaHopDong CHAR(10) PRIMARY KEY,
    MaCuDan CHAR(10),  
    MaCanHo CHAR(10),  
    NgayBatDau DATE,
    NgayKetThuc DATE,
    TienThueThang FLOAT,
    DatCoc FLOAT,
    TrangThai NVARCHAR(50),  
    FOREIGN KEY (MaCuDan) REFERENCES CuDan(MaCuDan) ON DELETE CASCADE,
    FOREIGN KEY (MaCanHo) REFERENCES CanHo(MaCanHo) ON DELETE CASCADE
);
DROP TABLE SuCo
CREATE TABLE SuCo (
    MaSuCo CHAR(10) PRIMARY KEY,
    MaCuDan CHAR(10),  
    MoTa NVARCHAR(255),  
    NgayBaoCao DATE,
    TinhTrang NVARCHAR(50),  
    NguoiXuLy NVARCHAR(100),  
    FOREIGN KEY (MaCuDan) REFERENCES CuDan(MaCuDan) ON DELETE CASCADE
);

INSERT INTO TaiKhoan (TenDangNhap, MatKhau, RoleID) VALUES
('admin', '123', 0),
('nv001', '654321', 1), 
('nv002', 'password002', 1);
INSERT INTO NhanVien (MaNhanVien, HoTen, ChucVu, SoDienThoai, Email) VALUES
('NV001', N'Nguyen Van A', N'Lễ Tân', '0123456789', 'nv_a@example.com'),
('NV002', N'Tran Thi B', N'Kế Toán', '0987654321', 'nv_b@example.com');
INSERT INTO CanHo (MaCanHo, DienTich, LoaiCanHo, GiaThue, TinhTrang) VALUES
('CH001', 50.5, N'2 phòng ngủ', 10000000, N' Còn Trống'),
('CH002', 60.0, N'3 phòng ngủ', 15000000, N' Còn Trống'),
('CH003', 45.3, N'1 phòng ngủ', 8000000, N'Còn Trống'),
('CH004', 70.2, N'3 phòng ngủ', 18000000, N'Còn Trống'),
('CH005', 55.5, N'2 phòng ngủ', 12000000, N'Còn Trống'),
('CH006', 48.0, N'1 phòng ngủ', 8500000, N'Còn Trống'),
('CH007', 75.4, N'4 phòng ngủ', 22000000, N'Còn Trống'),
('CH008', 65.0, N'3 phòng ngủ', 16000000, N'Còn Trống'),
('CH009', 52.0, N'2 phòng ngủ', 11000000, N'Còn Trống'),
('CH010', 40.0, N'1 phòng ngủ', 7000000, N'Còn Trống'),
('CH011', 62.5, N'3 phòng ngủ', 14000000, N'Còn Trống'),
('CH012', 58.0, N'2 phòng ngủ', 12500000, N'Còn Trống'),
('CH013', 42.0, N'1 phòng ngủ', 7500000, N'Còn Trống'),
('CH014', 76.3, N'4 phòng ngủ', 23000000, N'Còn Trống'),
('CH015', 68.0, N'3 phòng ngủ', 17000000, N'Còn Trống'),
('CH016', 50.0, N'2 phòng ngủ', 10000000, N'Còn Trống'),
('CH017', 60.5, N'3 phòng ngủ', 15000000, N'Còn Trống'),
('CH018', 49.0, N'1 phòng ngủ', 8500000, N'Còn Trống'),
('CH019', 54.5, N'2 phòng ngủ', 11500000, N'Còn Trống'),
('CH020', 67.0, N'3 phòng ngủ', 16000000, N'Còn Trống'),
('CH021', 78.0, N'4 phòng ngủ', 24000000, N'Còn Trống'),
('CH022', 45.0, N'1 phòng ngủ', 8000000, N'Còn Trống'),
('CH023', 66.0, N'3 phòng ngủ', 16500000, N'Còn Trống'),
('CH024', 53.0, N'2 phòng ngủ', 11200000, N'Còn Trống'),
('CH025', 40.5, N'1 phòng ngủ', 7000000, N'Còn Trống'),
('CH026', 55.0, N'2 phòng ngủ', 11800000, N'Còn Trống'),
('CH027', 70.0, N'3 phòng ngủ', 17500000, N'Còn Trống'),
('CH028', 48.5, N'1 phòng ngủ', 8500000, N'Còn Trống'),
('CH029', 64.0, N'3 phòng ngủ', 15800000, N'Còn Trống'),
('CH030', 72.0, N'3 phòng ngủ', 18000000, N'Còn Trống');

INSERT INTO CuDan (MaCuDan, HoTen, SoDienThoai, Email, CMND, MaCanHo, NgaySinh) VALUES
('CD001', 'Pham Van D', '0123456789', 'cd_d@example.com', '123456789', 'CH001', '1990-05-20'),
('CD002', 'Nguyen Thi A', '0987654321', 'ngthi_a@example.com', '987654321', 'CH002', '1985-07-12');

INSERT INTO HoaDon (MaHoaDon, MaCuDan, NgayLap, TongTien, TrangThaiThanhToan) VALUES
('HD001', 'CD003', '2023-01-15', 1200000, 'Chưa thanh toán'),
('HD002', 'CD002', '2023-02-20', 1500000, 'Chưa thanh toán');

INSERT INTO HopDong (MaHopDong, MaCuDan, MaCanHo, NgayBatDau, NgayKetThuc, TienThueThang, DatCoc, TrangThai) VALUES
('HD001', 'CD001', 'CH001', '2023-02-01', '2024-01-31', 3000000, 1500000, 'Hiệu lực');

INSERT INTO SuCo (MaSuCo, MaCuDan, MoTa, NgayBaoCao, TinhTrang, NguoiXuLy) VALUES
('SC001', 'CD002', N'Điện bị chập', '2023-01-15', N'Đang xử lý', 'NV002');

INSERT INTO BangLuong (MaLuong, MaNhanVien, NgayTra, LuongCoBan, TrangThai) 
VALUES 
('BL002', 'NV002', '2024-10-10', 9000000, N'Chưa Thanh Toán'),
('BL003', 'NV001', '2024-10-15', 8500000, N'Chưa Thanh Toán');



SELECT * FROM TaiKhoan
SELECT * FROM CuDan 
SELECT * FROM CanHo
SELECT * FROM HoaDon
SELECT * FROM HopDong
SELECT * FROM SuCo
SELECT * FROM NhanVien
SELECT * FROM BangLuong





