create database BANDOAN2

use BANDOAN2

create table Loaidoan(
MaLoai int Identity(1,1) not null primary key,
TenLoai nvarchar(50) not null
);
create table doan(
Madoan int IDENTITY(1,1) NOT NULL primary key,
MaLoai int,
Tendoan nvarchar(250) not null,
Anh varchar(1000),
SoLuong int,
Mota ntext,
NgayTao datetime,
FOREIGN KEY (MaLoai) REFERENCES Loaidoan (MaLoai) ON DELETE CASCADE ON UPDATE CASCADE,
);
select * from doan
select * from NhaCungCap

create table KhachHang(
MaKhachHang int identity(1,1) not null primary key,
TenKhachHang nvarchar(200),
SoDienThoai varchar(20),
DiaChi nvarchar(500),
Email varchar(50),
Anh varchar(1000),
);

create table NhanVien(
MaNhanVien int identity(1,1) primary key not null,
TenNhanVien nvarchar(100),
SoDienThoai varchar(20),
DiaChi nvarchar(100), 
Email varchar(50),
Anh nvarchar(500),
);

create table NhaCungCap(
MaNhaCungCap int primary key not null,
TenNhaCungCap nvarchar(200),
DiaChi nvarchar(200),
SoDienThoai varchar(20),
);

create table Slide(
MaSlide int identity(1,1) not null primary key,
Anh varchar(500),
Link varchar(500),
);


create table UserGroup(
MaUserGroup int identity(1,1) not null primary key,
TenQuyen nvarchar(50),

);

create table LienHe(
MaLienHe int identity(1,1) not null primary key,
Hoten nvarchar(100),
Sdt nchar(20),
Email varchar(100),
Diachi nvarchar(200),
Tieude nvarchar(500),
Noidung nvarchar(1000),
);

create table HoaDonNhap(
MaHoaDonNhap int identity(1,1) not null primary key,
MaNhaCungCap int ,
NgayNhap datetime, 
ThanhTien float,

FOREIGN KEY (MaNhaCungCap) REFERENCES NhaCungCap (MaNhaCungCap) ON DELETE CASCADE ON UPDATE CASCADE,
);

create table ChiTietHoaDonNhap(
MaChiTietHoaDonNhap int identity(1,1) not null primary key,
MaHoaDonNhap int,
Madoan int,
DonGia float,
SoLuong int,
FOREIGN KEY (MaHoaDonNhap) REFERENCES HoaDonNhap (MaHoaDonNhap) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Madoan) REFERENCES doan (Madoan) ON DELETE CASCADE ON UPDATE CASCADE,
);

create table HoaDonBan(
MaHoaDonBan int identity(1,1) not null primary key,
MaKhachHang int,
NgayBan datetime,
ThanhTien float,
FOREIGN KEY (MaKhachHang) REFERENCES KhachHang (MaKhachHang) ON DELETE CASCADE ON UPDATE CASCADE,

);
create table ChiTietHoaDonBan(
MaChiTietHoaDonBan int identity(1,1) not null primary key,
MaHoaDonBan int,
Madoan int,
SoLuong int, 
GiaBan float,
FOREIGN KEY (MaHoaDonBan) REFERENCES HoaDonBan (MaHoaDonBan) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Madoan) REFERENCES doan (Madoan) ON DELETE CASCADE ON UPDATE CASCADE,

);

create table ChiTietAnhdoan(
MaChiTietAnhdoan int identity(1,1) not null primary key,
Madoan int,
Anh varchar(500),
FOREIGN KEY (Madoan) REFERENCES doan (Madoan) ON DELETE CASCADE ON UPDATE CASCADE,
);

create table DonHang(
MaDonHang int identity(1,1) not null primary key,
MaKhachHang int,
NgayDat datetime,
TrangThai bit,
FOREIGN KEY (MaKhachHang) REFERENCES KhachHang (MaKhachHang) ON DELETE CASCADE ON UPDATE CASCADE,

);

create table ChiTietDonHang(
MaChiTietDonHang int identity(1,1) not null primary key,
MaDonHang int,
Madoan int,
SoLuong int, 
GiaBan float,
FOREIGN KEY (MaDonHang) REFERENCES DonHang (MaDonHang) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Madoan) REFERENCES doan (Madoan) ON DELETE CASCADE ON UPDATE CASCADE,
);



create table TaiKhoan(
MaTaiKhoan int identity(1,1) not null primary key,
TaiKhoan varchar(100),
MatKhau varchar(100),
MaKhachHang int,
TrangThai bit,
MaUserGroup int,
FOREIGN KEY (MaKhachHang) REFERENCES KhachHang (MaKhachHang) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (MaUserGroup) REFERENCES UserGroup (MaUserGroup) ON DELETE CASCADE ON UPDATE CASCADE,
);


create table Thongtindoan(
Mathongtindoan int identity(1,1) not null primary key,
Madoan int, 
Anh varchar(500),
FOREIGN KEY (Madoan) REFERENCES doan (Madoan) ON DELETE CASCADE ON UPDATE CASCADE,
);
drop table Thongtindoan


create table BinhLuan(
MaBinhLuan int identity(1,1) not null primary key,
MaKhachHang int,
Madoan int,
NoiDung ntext,
NgayGio datetime,
FOREIGN KEY (MaKhachHang) REFERENCES KhachHang (MaKhachHang) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Madoan) REFERENCES doan (Madoan) ON DELETE CASCADE ON UPDATE CASCADE,

);

create table GiaBan(
MaGiadoan int identity(1,1) not null primary key,
Madoan int,
NgayBatDau datetime,
NgayKetThuc datetime,
Gia float,
FOREIGN KEY (Madoan) REFERENCES doan (Madoan) ON DELETE CASCADE ON UPDATE CASCADE,
);

create table Kho(
MaKho int identity(1,1) not null primary key,
TenKho nvarchar(500),
DiaChi nvarchar(500),
);

create table ChiTietKho(
MaChiTietKho int identity(1,1) not null primary key,
Madoan int,
MaKho int,
SoLuong int,
FOREIGN KEY (Madoan) REFERENCES doan (Madoan) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (MaKho) REFERENCES Kho (MaKho) ON DELETE CASCADE ON UPDATE CASCADE,
);

--Chèn dữ liệu
INSERT INTO Loaidoan (TenLoai) VALUES (N'Đồ ăn mặn');
INSERT INTO Loaidoan (TenLoai) VALUES (N'Đồ ăn ngọt');
INSERT INTO Loaidoan (TenLoai) VALUES (N'Đồ ăn chín');
select * from Loaidoan

INSERT INTO doan (MaLoai, Tendoan, Anh, SoLuong, Mota, NgayTao) 
VALUES (1, N'Cánh gà rán', 'canhga.jpg', 100, N'Đồ ăn mặn ngon', GETDATE());
INSERT INTO doan (MaLoai, Tendoan, Anh, SoLuong, Mota, NgayTao) 
VALUES (2, N'Bánh ngọt', 'banhngot.jpg', 150, N'Đồ ăn ngọt ngon', GETDATE());
INSERT INTO doan (MaLoai, Tendoan, Anh, SoLuong, Mota, NgayTao) 
VALUES (3, N'Bánh cay', 'banhcay.jpg', 200, N'Đồ ăn cay', GETDATE());

INSERT INTO KhachHang (TenKhachHang, SoDienThoai, DiaChi, Email, Anh) 
VALUES (N'Đỗ Mạnh Cường', '0123456789', N'13 Đường Trần Hưng Đạo', 'domanhcuong@gmail.com', 'khachhang1.jpg');
INSERT INTO KhachHang (TenKhachHang, SoDienThoai, DiaChi, Email, Anh) 
VALUES (N'Đặng Nhật Duy', '0987654321', N'23 Đường Cầu Giaáy', 'dangnhatduyb@gmail.com', 'khachhang2.jpg');
INSERT INTO KhachHang (TenKhachHang, SoDienThoai, DiaChi, Email, Anh) 
VALUES (N'Đỗ Như Thành', '0242141522', N'45 Đường Nguyễn Huệ', 'donhuthanh@gmail.com', 'khachhang3.jpg');

INSERT INTO NhanVien (TenNhanVien, SoDienThoai, DiaChi, Email, Anh) 
VALUES (N'Lò Văn Hạnh', '01253252235', '27 Điện Biên', 'lovanhanh@gmail.com', 'nhanvien1.jpg');
INSERT INTO NhanVien (TenNhanVien, SoDienThoai, DiaChi, Email, Anh) 
VALUES (N'Bảo Anh', '092532321245', '89 Hưng Yên', 'buithibaoanh@gmail.com', 'nhanvien2.jpg');
INSERT INTO NhanVien (TenNhanVien, SoDienThoai, DiaChi, Email, Anh) 
VALUES (N'Đỗ Hồng Việt', '0925323435', '89 Hưng Yên', 'dohongviet@gmail.com', 'nhanvien3.jpg');

INSERT INTO NhaCungCap (MaNhaCungCap, TenNhaCungCap, DiaChi, SoDienThoai) 
VALUES (1,'MiXi Food', N'Hà Nội', '0343363223');
INSERT INTO NhaCungCap (MaNhaCungCap,TenNhaCungCap, DiaChi, SoDienThoai) 
VALUES (2,'Foody', N'Thái Bình', '075327436');
INSERT INTO NhaCungCap (MaNhaCungCap,TenNhaCungCap, DiaChi, SoDienThoai) 
VALUES (3,'Koobie', N'Hàn Quốc', '0383782653');
select * from NhaCungCap

INSERT INTO Slide (Anh, Link) VALUES ('path_to_image1.jpg', 'link_to_slide1');
INSERT INTO Slide (Anh, Link) VALUES ('path_to_image2.jpg', 'link_to_slide2');
INSERT INTO Slide (Anh, Link) VALUES ('path_to_image3.jpg', 'link_to_slide3');

INSERT INTO UserGroup (TenQuyen) VALUES ('Quyền 1');
INSERT INTO UserGroup (TenQuyen) VALUES ('Quyền 2');

INSERT INTO LienHe (Hoten, Sdt, Email, Diachi, Tieude, Noidung)
VALUES (N'Đào Quốc Hiệu', '014352352352', 'daoquochieu@example.com', N'Hưng Yên', N'Chào Bạn', 'Cung cấp thông tin đồ ăn');
INSERT INTO LienHe (Hoten, Sdt, Email, Diachi, Tieude, Noidung)
VALUES (N'Hoàng Ngọc Hiệp', '0353635262', 'hoangngochiep@example.com', N'Hải Dương', N'Chào Bạn', 'Nguyên liệu làm đồ ăn');
INSERT INTO LienHe (Hoten, Sdt, Email, Diachi, Tieude, Noidung)
VALUES (N'Trần Văn Bo', '0351241241', 'tranvanbo@example.com', N'Hải Dương', N'Chào Bạn', 'Hạn sử dụng của đồ ăn');

INSERT INTO HoaDonNhap (MaNhaCungCap, NgayNhap, ThanhTien)
VALUES (1, '2023-10-02 14:30:00', 1500.50);
INSERT INTO HoaDonNhap (MaNhaCungCap, NgayNhap, ThanhTien)
VALUES (2, '2023-10-03 10:15:00', 2000.75);
INSERT INTO HoaDonNhap (MaNhaCungCap, NgayNhap, ThanhTien)
VALUES (3, '2023-10-04 10:20:00', 2000.80);

INSERT INTO ChiTietHoaDonNhap (MaHoaDonNhap, Madoan, DonGia, SoLuong)
VALUES (1, 1, 100.50, 5);
INSERT INTO ChiTietHoaDonNhap (MaHoaDonNhap, Madoan, DonGia, SoLuong)
VALUES (2, 2, 150.75, 4);
INSERT INTO ChiTietHoaDonNhap (MaHoaDonNhap, Madoan, DonGia, SoLuong)
VALUES (3, 3, 150.80, 3);

INSERT INTO HoaDonBan (MaKhachHang, NgayBan, ThanhTien)
VALUES (1, '2023-10-04 11:45:00', 1200.25);
INSERT INTO HoaDonBan (MaKhachHang, NgayBan, ThanhTien)
VALUES (2, '2023-10-05 09:30:00', 1800.50);
INSERT INTO HoaDonBan (MaKhachHang, NgayBan, ThanhTien)
VALUES (3, '2023-10-05 09:25:00', 1800.40);

INSERT INTO ChiTietHoaDonBan (MaHoaDonBan, Madoan, SoLuong, GiaBan)
VALUES (1, 1, 2, 250.00);
INSERT INTO ChiTietHoaDonBan (MaHoaDonBan, Madoan, SoLuong, GiaBan)
VALUES (2, 2, 3, 300.00);
INSERT INTO ChiTietHoaDonBan (MaHoaDonBan, Madoan, SoLuong, GiaBan)
VALUES (3, 3, 4, 400.00)

INSERT INTO ChiTietAnhdoan (Madoan, Anh)
VALUES (1, 'duongdananh1.jpg');
INSERT INTO ChiTietAnhdoan (Madoan, Anh)
VALUES (2, 'duongdananh2.jpg');
INSERT INTO ChiTietAnhdoan (Madoan, Anh)
VALUES (3, 'duongdananh3.jpg');

INSERT INTO DonHang (MaKhachHang, NgayDat, TrangThai)
VALUES (1, '2023-10-06 16:45:00', 1);
INSERT INTO DonHang (MaKhachHang, NgayDat, TrangThai)
VALUES (2, '2023-10-07 14:20:00', 1);
INSERT INTO DonHang (MaKhachHang, NgayDat, TrangThai)
VALUES (3, '2023-10-08 14:22:00', 1);

INSERT INTO ChiTietDonHang (MaDonHang, Madoan, SoLuong, GiaBan)
VALUES (1, 1, 2, 200.00);
INSERT INTO ChiTietDonHang (MaDonHang, Madoan, SoLuong, GiaBan)
VALUES (2, 2, 3, 250.00);
INSERT INTO ChiTietDonHang (MaDonHang, Madoan, SoLuong, GiaBan)
VALUES (3, 3, 4, 260.00);

INSERT INTO TaiKhoan (TaiKhoan, MatKhau, MaKhachHang, TrangThai, MaUserGroup)
VALUES ('cinzi', '123', 1, 1, 1);
INSERT INTO TaiKhoan (TaiKhoan, MatKhau, MaKhachHang, TrangThai, MaUserGroup)
VALUES ('cin', '123', 2, 1, 2);



INSERT INTO Thongtindoan (Madoan, Anh)
VALUES (1, 'canhga.jpg');
INSERT INTO Thongtindoan (Madoan, Anh)
VALUES (2, 'banhngot.jpg');
INSERT INTO Thongtindoan (Madoan, Anh)
VALUES (3, 'banhcay.jpg');

select * from Thongtindoan

INSERT INTO BinhLuan (MaKhachHang, Madoan, NoiDung)
VALUES (1, 1, N'Bình luận cho đồ ăn đẹp quá!');
INSERT INTO BinhLuan (MaKhachHang, Madoan, NoiDung)
VALUES (2, 2, N'Đồ ăn ngon, giá hợp lý!');
INSERT INTO BinhLuan (MaKhachHang, Madoan, NoiDung)
VALUES (3, 3, N'Đồ ăn ngon, giá hợp lý!');

INSERT INTO GiaBan (Madoan, NgayBatDau, NgayKetThuc, Gia)
VALUES (1, '2023-10-5 08:00:00', '2023-10-12 23:59:59', 150.00);
INSERT INTO GiaBan (Madoan, NgayBatDau, NgayKetThuc, Gia)
VALUES (2, '2023-10-06 08:00:00', '2023-10-12 23:59:59', 180.00);
INSERT INTO GiaBan (Madoan, NgayBatDau, NgayKetThuc, Gia)
VALUES (3, '2023-10-07 08:00:00', '2023-10-12 23:59:59', 180.00);

INSERT INTO Kho (TenKho, DiaChi)
VALUES ('Kho Đồ Ăn', N'Hà Nội');
INSERT INTO Kho (TenKho, DiaChi)
VALUES ('Kho Đồ Ăn ', N'Hưng Yên');
INSERT INTO Kho (TenKho, DiaChi)
VALUES ('Kho Đồ Ăn', N'Hải Phòng');

INSERT INTO ChiTietKho (Madoan, MaKho, SoLuong)
VALUES (1, 1, 100);
INSERT INTO ChiTietKho (Madoan, MaKho, SoLuong)
VALUES (2, 2, 150);
INSERT INTO ChiTietKho (Madoan, MaKho, SoLuong)
VALUES (3, 3, 160);













--Thủ tục--
--Loại đồ ăn
create procedure lsp_getall
as
	begin
		select * from Loaidoan
	end;
go
lsp_getall

create procedure [dbo].[lsp_get-by-id](@MaLoai int)
as
	begin
		select *
		from Loaidoan
		Where MaLoai = @MaLoai
	end;
go


create procedure lsp_create(@TenLoai nvarchar(50))
as 
	begin
		INSERT INTO Loaidoan(TenLoai)
                VALUES (@TenLoai);
        SELECT '';
	end;
go 

create procedure lsp_update(
@MaLoai int,
@TenLoai nvarchar(50)
)
as
	begin
		Update  Loaidoan 
	  set  
	  TenLoai = IIf(@TenLoai is Null, TenLoai, @TenLoai)
	  Where MaLoai = @MaLoai
      
	  SELECT '';
    END;
go

create procedure lsp_delete(@MaLoai int)
as
	begin
		delete from Loaidoan
		where MaLoai = @MaLoai
	end;
go
exec lsp_delete
@MaLoai=7;

select * from Loaidoan

--đồ ăn

CREATE PROCEDURE doan_create 
	
(@MaLoai int,
@Tendoan nvarchar(250),
@Anh varchar(1000),
@SoLuong int,
@Mota ntext
)
as 
	begin
		Insert into doan(MaLoai, Tendoan, Anh, SoLuong, MoTa, NgayTao )
		values (@MaLoai, @Tendoan, @Anh, @SoLuong, @Mota, GETDATE());
	end;
go


CREATE PROCEDURE doan_update 
	
(@Madoan int,
@MaLoai int,
@Tendoan nvarchar(250),
@Anh varchar(1000),
@SoLuong int,
@Mota ntext
)
as 
	begin
		Update  doan 
	  set  
	  MaLoai = IIf(@MaLoai is Null, MaLoai, @MaLoai),
	  Tendoan = @Tendoan,
	  Anh = IIf(@Anh is Null, Anh, @Anh),
	  SoLuong = IIf(@SoLuong is Null, SoLuong, @SoLuong),
	  Mota = IIF(@Mota is null, Mota, @Mota),
	  NgayTao = GETDATE()
	  Where Madoan = @Madoan
      
	  SELECT '';
    END;
go


CREATE PROCEDURE doan_delete
(@Madoan int)
as
	begin
		Delete from doan
		where Madoan = @Madoan
	end;
go
select * from doan
---nhà cung cấp
CREATE PROCEDURE Ncc_create 
	
(@MaNhaCungCap int,
@TenNhaCungCap nvarchar(200),
@DiaChi nvarchar (200),
@SoDienThoai varchar (20)
)
as 
	begin
		Insert into NhaCungCap(MaNhaCungCap, TenNhaCungCap,DiaChi,SoDienThoai)
		values (@MaNhaCungCap, @TenNhaCungCap, @DiaChi, @SoDienThoai);
	end;
go

exec Ncc_create
@MaNhaCungCap=3,
@TenNhaCungCap='ABC',
@DiaChi='Hung yen',
@SoDienThoai=019399312;

select * from NhaCungCap
select * from doan
select * from Loaidoan


CREATE PROCEDURE Ncc_update 
(@MaNhaCungCap int,
@TenNhaCungCap nvarchar(200),
@DiaChi nvarchar (200),
@SoDienThoai varchar (20)
)
as 
	begin
		Update  NhaCungCap
	  set  
	  MaNhaCungCap = IIf(@MaNhaCungCap is Null, MaNhaCungCap, @MaNhaCungCap),
	  TenNhaCungCap = @TenNhaCungCap,
	  DiaChi = IIf(@DiaChi is Null, DiaChi, @DiaChi),
	  SoDienThoai = IIf(@SoDienThoai is Null, SoDienThoai, @SoDienThoai)
	  Where MaNhaCungCap = @MaNhaCungCap
      
	  SELECT '';
    END;
go



CREATE PROCEDURE Ncc_delete
(@MaNhaCungCap int)
as
	begin
		Delete from NhaCungCap
		where MaNhaCungCap = @MaNhaCungCap
	end;
go
EXEC Ncc_delete
@MaNhaCungCap=2;
select * from doan
select * from NhaCungCap

create procedure Ncc_getall
as
	begin
		select * from NhaCungCap
	end;
go
Ncc_getall

create procedure [dbo].[Ncc_get-by-id](@MaNhaCungCap int)
as
	begin
		select * from NhaCungCap
		Where MaNhaCungCap = @MaNhaCungCap
	end;
go
exec [Ncc_get-by-id]
@MaNhaCungCap=1;

-- sản phẩm mới về
create PROCEDURE doan_moinhat
(@Soluong int)
AS
BEGIN
    SELECT TOP(@Soluong) sp.Madoan ,sp.Tendoan, g.Gia 
    FROM doan as sp inner join GiaBan as g on sp.Madoan = g.Madoan inner join Thongtindoan as ttda on sp.Madoan = ttda.Madoan 
    ORDER BY NgayTao desc
END	
EXEC doan_moinhat @Soluong = '3'



--sản phẩm bán chạy
create procedure doan_banchay
(@soluong int)
as
	begin
		select top (@soluong) sp.Madoan, sp.Tendoan, sp.Anh, sum(cthdb.SoLuong) as SoLuongDaBan , g.Gia 
		from doan as sp inner join ChiTietHoaDonBan as cthdb on sp.Madoan = cthdb.Madoan  inner join GiaBan as g on sp.Madoan = g.Madoan inner join Thongtindoan as ttda on sp.Madoan = ttda.Madoan 
		group by sp.Madoan, sp.Tendoan, sp.Anh, g.Gia
		order by SoLuongDaBan desc
	end;
go
EXEC doan_banchay @Soluong ='3'

--sản phẩm nhiều người mua
create procedure doan_oder
(@Sl int)
as 
	begin
		select top (@Sl) sp.Madoan, sp.Tendoan, g.Gia, 
		SUM(dh.Soluong) as SoLuongDatHang 
		from doan as sp inner join ChiTietDonHang as dh on sp.Madoan = dh.Madoan inner join GiaBan as g on sp.Madoan = g.Madoan inner join Thongtindoan as ttda on sp.Madoan = ttda.Madoan 
		group by sp.Madoan, sp.Tendoan,g.gia
		order by sum(dh.Soluong) desc 
	end;
go
EXEC doan_oder @Soluong=' 8'

--All Slider
create procedure slide_getall
as
	begin
		select * from Slide
	end
go



-- lấy sản phẩm theo mã san pham
create procedure doan_get_by_id
(@Madoan int)
as
begin
	Select * 
		from doan 
		where Madoan =@Madoan
end;
go
doan_get_by_id 2

-- lấy sản phẩm theo loại san pham
create procedure doan_theoloai
(@MaLoai int)
as
	begin
		Select sp.Madoan ,sp.Tendoan, sp.Anh,sp.Mota,g.Gia
		from doan as sp inner join Thongtindoan as tt 
		on sp.Madoan = tt.Madoan inner join GiaBan as g 
		on sp.Madoan=g.Madoan
		where MaLoai = @MaLoai
	end;
go

-- lấy ra tất cả san pham
create procedure doan_getAll
as
	begin
		select * from doan
	end;
go
 doan_getAll

 -- tim kiem san pham 
create procedure doan_search
(@page_index  INT  = 1, 
@page_size   INT   = 10,
@Tendoan Nvarchar(250)   = null,
@Madoan int  = null,
@TenLoai Nvarchar(250) = null,
@option varchar(50)  = null,
@FromPrice float =  null,
@ToPrice float = null
)
as
	begin
		DECLARE @RecordCount BIGINT;
        IF(@page_size <> 0) --nếu page_size != 0
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER( --ROW_NUMBER()nghĩa là gán một con số tăng tuần tự cho mỗi bản ghi theo thứ tự của Tendanhmuc, bắt đầu từ 1. 
                              ORDER BY 
							  CASE 
							       WHEN  @option = 'TEN' THEN sp.Tendoan
							  END ASC)) AS RowNumber, 
								sp.Madoan,
							   sp.MaLoai,
							   sp.Tendoan,
							   sp.Anh,
							   sp.SoLuong,
							   sp.Mota
                        INTO #Results1
                        FROM doan AS sp left join GiaBan as gb on sp.Madoan = gb.Madoan
						inner join Loaidoan as lsp on lsp.MaLoai = sp.MaLoai

					    WHERE  (@Tendoan is null Or sp.Tendoan like N'%'+@Tendoan+'%') and						
						(@Madoan is null or sp.Madoan = @Madoan) and
						(@TenLoai is null or lsp.TenLoai like N'%'+@TenLoai+'%') and
						(@FromPrice is null or @ToPrice is null  Or (gb.Gia >= @FromPrice and gb.Gia <= @ToPrice));



                        SELECT @RecordCount = COUNT(*)
                        FROM #Results1;

                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results1
                        WHERE ROWNUMBER BETWEEN(@page_index - 1) * @page_size + 1 AND(((@page_index - 1) * @page_size + 1) + @page_size) - 1
                              OR @page_index = -1;
                        DROP TABLE #Results1; 
						
            END;
		ELSE
            BEGIN
                SET NOCOUNT ON;
                        SELECT(ROW_NUMBER() OVER( --ROW_NUMBER()nghĩa là gán một con số tăng tuần tự cho mỗi bản ghi theo thứ tự của Tendanhmuc, bắt đầu từ 1. 
                              ORDER BY 
							  CASE 
							       WHEN  @option = 'TEN' THEN sp.Tendoan
							  END ASC)) AS RowNumber, 
								sp.Madoan,
							   sp.MaLoai,
							   sp.Tendoan,
							   sp.Anh,
							   sp.SoLuong,
							   sp.Mota
                        INTO #Results2
                        FROM doan AS sp left join GiaBan as gb on sp.Madoan = gb.Madoan
						inner join Loaidoan as lsp on lsp.MaLoai = sp.MaLoai

					    WHERE  (@Tendoan is null Or sp.Tendoan like N'%'+@Tendoan+'%') and						
						(@Madoan is null or sp.Madoan = @Madoan) and
						(@TenLoai is null or lsp.TenLoai like N'%'+@TenLoai+'%') and
						(@FromPrice is null or @ToPrice is null  Or (gb.Gia >= @FromPrice and gb.Gia <= @ToPrice));
                     
                        SELECT @RecordCount = COUNT(*)
                        FROM #Results2;
                        SELECT *, 
                               @RecordCount AS RecordCount
                        FROM #Results2;
                        DROP TABLE #Results2;
        END;
    END;
GO


doan_search @page_index = 1, @page_size = 10,@FromPrice = 9000000, @ToPrice = 15000000
go
doan_search @page_index = 1, @page_size = 10,@TenLoai='đồ ăn mặn'
go
doan_search @page_index = 1, @page_size = 10,@Tendoan='cánh gà rán '
go
