USE [master]
GO
CREATE DATABASE [ASM_JAVA5]

USE [ASM_JAVA5]
GO

-- Table: Accounts
CREATE TABLE [dbo].[Accounts] (
    [Username] NVARCHAR(50) NOT NULL PRIMARY KEY,
    [Password] NVARCHAR(50) NOT NULL,
    [Fullname] NVARCHAR(50) NOT NULL,
    [Email] NVARCHAR(50) NOT NULL,
    [Photo] NVARCHAR(50) NOT NULL,
    [Activated] BIT NOT NULL,
    [Admin] BIT NOT NULL
);

-- Table: Categories
CREATE TABLE [dbo].[Categories] (
    [Id] CHAR(4) NOT NULL PRIMARY KEY,
    [Name] NVARCHAR(50) NOT NULL,
    [is_delete] BIT NOT NULL
);

-- Table: Products
CREATE TABLE [dbo].[Products] (
    [Id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [Name] NVARCHAR(50) NOT NULL,
    [Image] NVARCHAR(MAX) NULL,
    [Price] FLOAT NOT NULL,
    [create_date] DATE NOT NULL,
    [Quantity] INT NOT NULL,
    [category_id] CHAR(4) NOT NULL,
    [is_delete] BIT NOT NULL,
    FOREIGN KEY ([category_id]) REFERENCES [dbo].[Categories]([Id])
);

-- Table: Orders
CREATE TABLE [dbo].[Orders] (
    [Id] BIGINT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [Username] NVARCHAR(50) NOT NULL,
    [create_date] DATE NOT NULL,
    [Address] NVARCHAR(100) NOT NULL,
    [total] FLOAT NOT NULL,
    [status] BIT NOT NULL,
    FOREIGN KEY ([Username]) REFERENCES [dbo].[Accounts]([Username])
);

-- Table: Order_Details
CREATE TABLE [dbo].[Order_Details] (
    [Id] BIGINT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [order_id] BIGINT NOT NULL,
    [product_id] INT NOT NULL,
    [Price] FLOAT NULL,
    [Quantity] INT NULL,
    FOREIGN KEY ([order_id]) REFERENCES [dbo].[Orders]([Id]),
    FOREIGN KEY ([product_id]) REFERENCES [dbo].[Products]([Id])
);

-- Table: Carts
CREATE TABLE [dbo].[Carts] (
    [username] NVARCHAR(50) NOT NULL,
    [product_id] INT NOT NULL,
    [quantity] INT NULL,
    PRIMARY KEY ([username], [product_id]),
    FOREIGN KEY ([username]) REFERENCES [dbo].[Accounts]([Username]),
    FOREIGN KEY ([product_id]) REFERENCES [dbo].[Products]([Id])
);
-- Insert accounts
INSERT INTO [dbo].[Accounts] 
VALUES  
('NV001', '123456', N'Nguyễn Anh Khoa', 'khoanaps39026@gmail.com', 'blank.jpg', 1, 1),
('NV002', '123456', N'Vũ Quang Trung', 'trungvqps39100@gmail.com', 'blank.jpg', 1, 0),
('NV003', '123456', N'Trần Thị Thùy Tiên', 'tientttps39307@gmail.com', 'blank.jpg', 1, 1),
('NV004', '123456', N'Trần Tuấn Anh', 'anhtts39946@gmail.com', 'blank.jpg', 1, 0),
('NV005', '123456', N'Nguyễn Tấn Lực', 'lucnguyen0562@gmail.com', 'blank.jpg', 0, 0);
-- Insert into carts
SET IDENTITY_INSERT [dbo].[Products] ON;
INSERT INTO [dbo].[Carts] VALUES (N'NV002', 19, 1);

SET IDENTITY_INSERT [dbo].[Products] OFF;
GO

-- Insert categories
INSERT INTO [dbo].[Categories] VALUES 
(N'ca01', N'Áo Thun', 0),
(N'ca02', N'Áo Khoác', 0),
(N'ca03', N'Áo Polo', 0),
(N'ca04', N'Áo Sơ Mi', 0),
(N'ca05', N'Quần Dài', 0),
(N'ca06', N'Quần Shorts', 0),
(N'ca07', N'Quần Jeans', 0);

-- Insert order details
SET IDENTITY_INSERT [dbo].[Order_Details] ON;
INSERT INTO [dbo].[Order_Details] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES 
(1, 1, 5, 165000, 1),
(2, 1, 7, 159000, 1),
(3, 1, 8, 159000, 1),
(4, 2, 10, 132000, 1),
(5, 2, 11, 129000, 1),
(6, 3, 15, 175000, 2),
(7, 6, 20, 325000, 1),
(8, 7, 20, 325000, 1),
(9, 7, 36, 75000, 1),
(10, 8, 29, 69000, 1),
(11, 8, 30, 63000, 1),
(12, 8, 31, 29000, 1),
(13, 8, 42, 99000, 1),
(14, 8, 43, 127000, 1),
(15, 8, 44, 139000, 1),
(16, 8, 45, 239000, 6),
(17, 8, 46, 105000, 1);

SET IDENTITY_INSERT [dbo].[Order_Details] OFF;


-- Insert orders
SET IDENTITY_INSERT [dbo].[Orders] ON;

INSERT INTO [dbo].[Orders] ([Id], [Username], [create_date], [Address], [total], [status]) VALUES 
(1, N'NV001', '2025-02-18', N'965 Quang Trung', 483000, 1),
(2, N'NV002', '2025-02-18', N'Gò Vấp', 261000, 0),
(3, N'NV001', '2025-02-18', N'965 Quang Trung', 350000, 1),
(6, N'NV001', '2025-02-21', N'965/45/14 Quang Trung HC', 325000, 0),
(7, N'NV001', '2025-02-21', N'965/45/14 Quang Trung HC', 400000, 0),
(8, N'NV001', '2025-02-22', N'965/45/14 Quang Trung HC', 2065000, 0);


SET IDENTITY_INSERT [dbo].[Orders] OFF;


-- Insert products
SET IDENTITY_INSERT [dbo].[Products] ON;
INSERT INTO [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES
-- Áo Thun (ca01)
(1, N'Áo Thun Basic Nam', N'aothun_basic1.webp,aothun_basic2.webp,aothun_basic3.webp,aothun_basic4.webp', 165000, CAST(N'2023-05-01' AS Date), 100, N'ca01', 0),
(2, N'Áo Thun Basic Nữ', N'aothun1.webp,aothun2.webp,aothun3.webp,aothun4.webp', 170000, CAST(N'2023-05-02' AS Date), 150, N'ca01', 0),
(3, N'Áo Thun In Hình Độc', N'aothun_in_hinh1.webp,aothun_in_hinh2.webp,aothun_in_hinh3.webp,aothun_in_hinh4.webp', 185000, CAST(N'2023-05-03' AS Date), 120, N'ca01', 0),
(4, N'Áo Thun In Hình Năng Động', N'aothun_in_1.webp,aothun_in_2.webp,aothun_in_3.webp,aothun_in_4.webp', 190000, CAST(N'2023-05-04' AS Date), 130, N'ca01', 0),
(5, N'Áo Thun Tay Lỡ', N'aothun_5_1.webp,aothun_5_2.webp,aothun_5_3.webp,aothun_5_4.webp', 175000, CAST(N'2023-05-05' AS Date), 110, N'ca01', 0),
(6, N'Áo Thun Cổ Tròn', N'aothun_6_1.webp,aothun_6_2.webp,aothun_6_3.webp,aothun_6_4.webp', 180000, CAST(N'2023-05-06' AS Date), 140, N'ca01', 0),
(7, N'Áo Thun Tay Ngắn', N'aothun_7_1.webp,aothun_7_2.webp,aothun_7_3.webp,aothun_7_4.webp', 200000, CAST(N'2023-05-07' AS Date), 150, N'ca01', 0),
(8, N'Áo Thun Màu Pastel', N'aothun_8_1.webp,aothun_8_2.webp,aothun_8_3.webp,aothun_8_4.webp', 190000, CAST(N'2023-05-08' AS Date), 135, N'ca01', 0),

-- Áo Khoác (ca02)
(9, N'Áo Khoác Gió Nam', N'aokhoac_9_1.webp,aokhoac_9_2.webp,aokhoac_9_3.webp,aokhoac_9_4.webp', 355000, CAST(N'2023-05-09' AS Date), 200, N'ca02', 0),
(10, N'Áo Khoác Gió Nữ', N'aokhoac_10_1.webp,aokhoac_10_2.webp,aokhoac_10_3.webp,aokhoac_10_4.webp', 360000, CAST(N'2023-05-10' AS Date), 180, N'ca02', 0),
(11, N'Áo Khoác Nỉ Nam', N'aokhoac_11_1.webp,aokhoac_11_2.webp,aokhoac_11_3.webp,aokhoac_11_4.webp', 450000, CAST(N'2023-05-11' AS Date), 160, N'ca02', 0),
(12, N'Áo Khoác Nỉ Nữ', N'aokhoac_12_1.webp,aokhoac_12_2.webp,aokhoac_12_3.webp,aokhoac_12_4.webp', 460000, CAST(N'2023-05-12' AS Date), 150, N'ca02', 0),
(13, N'Áo Khoác Bomber', N'aokhoac_13_1.webp,aokhoac_13_2.webp,aokhoac_13_3.webp,aokhoac_13_4.webp', 500000, CAST(N'2023-05-13' AS Date), 140, N'ca02', 0),
(14, N'Áo Khoác Da', N'aokhoac_14_1.webp,aokhoac_14_2.webp,aokhoac_14_3.webp,aokhoac_14_4.webp', 600000, CAST(N'2023-05-14' AS Date), 80, N'ca02', 0),
(15, N'Áo Khoác Dù', N'aokhoac_15_1.webp,aokhoac_15_2.webp,aokhoac_15_3.webp,aokhoac_15_4.webp', 380000, CAST(N'2023-05-15' AS Date), 90, N'ca02', 0),

-- Áo Polo (ca03)
(16, N'Áo Polo Cổ Bẻ Nam', N'aopolo_16_1.webp,aopolo_16_2.webp,aopolo_16_3.webp,aopolo_16_4.webp', 220000, CAST(N'2023-05-16' AS Date), 120, N'ca03', 0),
(17, N'Áo Polo Cổ Bẻ Nữ', N'aopolo_17_1.webp,aopolo_17_2.webp,aopolo_17_3.webp,aopolo_17_4.webp', 225000, CAST(N'2023-05-17' AS Date), 130, N'ca03', 0),
(18, N'Áo Polo Trơn Nam', N'aopolo_18_1.webp,aopolo_18_2.webp,aopolo_18_3.webp,aopolo_18_4.webp', 200000, CAST(N'2023-05-18' AS Date), 110, N'ca03', 0),
(19, N'Áo Polo Trơn Nữ', N'aopolo_19_1.webp,aopolo_19_2.webp,aopolo_19_3.webp,aopolo_19_4.webp', 205000, CAST(N'2023-05-19' AS Date), 115, N'ca03', 0),
(20, N'Áo Polo Kẻ Sọc', N'aopolo_20_1.webp,aopolo_20_2.webp,aopolo_20_3.webp,aopolo_20_4.webp', 210000, CAST(N'2023-05-20' AS Date), 100, N'ca03', 0),
(21, N'Áo Polo Kẻ Ngang', N'aopolo_21_1.webp,aopolo_21_2.webp,aopolo_21_3.webp,aopolo_21_4.webp', 215000, CAST(N'2023-05-21' AS Date), 120, N'ca03', 0),
(22, N'Áo Polo Dài Tay', N'aopolo_22_1.webp,aopolo_22_2.webp,aopolo_22_3.webp,aopolo_22_4.webp', 240000, CAST(N'2023-05-22' AS Date), 110, N'ca03', 0),

-- Áo Sơ Mi (ca04)
(23, N'Áo Sơ Mi Trắng', N'aosomi_23_1.webp,aosomi_23_2.webp,aosomi_23_3.webp,aosomi_23_4.webp', 299000, CAST(N'2023-05-23' AS Date), 90, N'ca04', 0),
(24, N'Áo Sơ Mi Kẻ', N'aosomi_24_1.webp,aosomi_24_2.webp,aosomi_24_3.webp,aosomi_24_4.webp', 280000, CAST(N'2023-05-24' AS Date), 85, N'ca04', 0),
(25, N'Áo Sơ Mi Cổ Đức', N'aosomi_25_1.webp,aosomi_25_2.webp,aosomi_25_3.webp,aosomi_25_4.webp', 320000, CAST(N'2023-05-25' AS Date), 75, N'ca04', 0),
(26, N'Áo Sơ Mi Họa Tiết', N'aosomi_26_1.webp,aosomi_26_2.webp,aosomi_26_3.webp,aosomi_26_4.webp', 310000, CAST(N'2023-05-26' AS Date), 70, N'ca04', 0),
(27, N'Áo Sơ Mi Dài Tay', N'aosomi_27_1.webp,aosomi_27_2.webp,aosomi_27_3.webp,aosomi_27_4.webp', 330000, CAST(N'2023-05-27' AS Date), 65, N'ca04', 0),
(28, N'Áo Sơ Mi Kẻ Ô', N'aosomi_28_1.webp,aosomi_28_2.webp,aosomi_28_3.webp,aosomi_28_4.webp', 295000, CAST(N'2023-05-28' AS Date), 80, N'ca04', 0),

-- Quần Dài (ca05)
(29, N'Quần Dài Jeans Nam', N'quandai_29_1.webp,quandai_29_2.webp,quandai_29_3.webp,quandai_29_4.webp', 350000, CAST(N'2023-05-29' AS Date), 75, N'ca05', 0),
(30, N'Quần Dài Jeans Nữ', N'quandai_30_1.webp,quandai_30_2.webp,quandai_30_3.webp,quandai_30_4.webp', 360000, CAST(N'2023-05-30' AS Date), 70, N'ca05', 0),
(31, N'Quần Dài Chất Mềm', N'quandai_31_1.webp,quandai_31_2.webp,quandai_31_3.webp,quandai_31_4.webp', 400000, CAST(N'2023-06-01' AS Date), 60, N'ca05', 0),
(32, N'Quần Dài Thể Thao', N'quandai_32_1.webp,quandai_32_2.webp,quandai_32_3.webp,quandai_32_4.webp', 370000, CAST(N'2023-06-02' AS Date), 65, N'ca05', 0),
(33, N'Quần Dài Form Rộng', N'quandai_33_1.webp,quandai_33_2.webp,quandai_33_3.webp,quandai_33_4.webp', 380000, CAST(N'2023-06-03' AS Date), 50, N'ca05', 0),

-- Quần Shorts (ca06)
(34, N'Quần Shorts Nam', N'quanshort_34_1.webp,quanshort_34_2.webp,quanshort_34_3.webp,quanshort_34_4.webp', 180000, CAST(N'2023-06-04' AS Date), 150, N'ca06', 0),
(35, N'Quần Shorts Nữ', N'quanshort_35_1.webp,quanshort_35_2.webp,quanshort_35_3.webp,quanshort_35_4.webp', 170000, CAST(N'2023-06-05' AS Date), 140, N'ca06', 0),
(36, N'Quần Shorts Thể Thao', N'quanshort_36_1.jpg,quanshort_36_2.jpg,quanshort_36_3.jpg,quanshort_36_4.jpg', 190000, CAST(N'2023-06-06' AS Date), 130, N'ca06', 0),
(37, N'Quần Shorts Jean', N'quanshort_37_1.jpg,quanshort_37_2.jpg,quanshort_37_3.jpg,quanshort_37_4.jpg', 195000, CAST(N'2023-06-07' AS Date), 125, N'ca06', 0),
(38, N'Quần Shorts Chất Liệu Mềm', N'quanshort_38_1.jpg,quanshort_38_2.jpg,quanshort_38_3.jpg,quanshort_38_4.jpg', 180000, CAST(N'2023-06-08' AS Date), 120, N'ca06', 0),

-- Quần Jeans (ca07)
(39, N'Quần Jeans Ôm', N'quan_jeans_39_1.jpg,quan_jeans_39_2.jpg,quan_jeans_39_3.jpg,quan_jeans_39_4.jpg', 400000, CAST(N'2023-06-09' AS Date), 80, N'ca07', 0),
(40, N'Quần Jeans Rách', N'quan_jeans_40_1.jpg,quan_jeans_40_2.jpg,quan_jeans_40_3.jpg,quan_jeans_40_4.jpg', 420000, CAST(N'2023-06-10' AS Date), 70, N'ca07', 0),
(41, N'Quần Jeans Dài', N'quan_jeans_41_1.jpg,quan_jeans_41_2.jpg,quan_jeans_41_3.jpg,quan_jeans_41_4.jpg', 410000, CAST(N'2023-06-11' AS Date), 75, N'ca07', 0),
(42, N'Quần Jeans Nam', N'quan_jeans_42_1.jpg,quan_jeans_42_2.jpg,quan_jeans_42_3.jpg,quan_jeans_42_4.jpg', 430000, CAST(N'2023-06-12' AS Date), 65, N'ca07', 0),
(43, N'Quần Jeans Nữ', N'quan_jeans_43_1.jpg,quan_jeans_43_2.jpg,quan_jeans_43_3.jpg,quan_jeans_43_4.jpg', 440000, CAST(N'2023-06-13' AS Date), 60, N'ca07', 0),

-- Áo Thun (ca01) (additional entries)
(44, N'Áo Thun Tay Dài', N'aothun_44_1.jpg,aothun_44_2.jpg,aothun_44_3.jpg,aothun_44_4.jpg', 200000, CAST(N'2023-06-14' AS Date), 150, N'ca01', 0),
(45, N'Áo Thun In Logo', N'aothun_45_1.jpg,aothun_45_2.jpg,aothun_45_3.jpg,aothun_45_4.jpg', 175000, CAST(N'2023-06-15' AS Date), 130, N'ca01', 0),
(46, N'Áo Thun Chất Liệu Mát', N'aothun_46_1.jpg,aothun_46_2.jpg,aothun_46_3.jpg,aothun_46_4.jpg', 190000, CAST(N'2023-06-16' AS Date), 125, N'ca01', 0),

-- Áo Khoác (ca02) (additional entries)
(47, N'Áo Khoác Kaki', N'aokhoac_kaki_47_1.jpg,aokhoac_kaki_47_2.jpg,aokhoac_kaki_47_3.jpg,aokhoac_kaki_47_4.jpg', 500000, CAST(N'2023-06-17' AS Date), 70, N'ca02', 0),
(48, N'Áo Khoác Tản Nhiệt', N'aokhoac_tan_nhiet_48_1.jpg,aokhoac_tan_nhiet_48_2.jpg,aokhoac_tan_nhiet_48_3.jpg,aokhoac_tan_nhiet_48_4.jpg', 800000, CAST(N'2023-06-18' AS Date), 50, N'ca02', 0),

-- Áo Polo (ca03) (additional entries)
(49, N'Áo Polo Chất Liệu Mát', N'aopolo_49_1.jpg,aopolo_49_2.jpg,aopolo_49_3.jpg,aopolo_49_4.jpg', 210000, CAST(N'2023-06-19' AS Date), 125, N'ca03', 0),
(50, N'Áo Polo In Hình', N'aopolo_50_1.jpg,aopolo_50_2.jpg,aopolo_50_3.jpg,aopolo_50_4.jpg', 230000, CAST(N'2023-06-20' AS Date), 115, N'ca03', 0),
(51, N'Áo Polo Dài Tay', N'aopolo_51_1.jpg,aopolo_51_2.webp,aopolo_51_3.jpg,aopolo_51_4.jpg', 240000, CAST(N'2023-06-21' AS Date), 110, N'ca03', 0),

(52, N'Áo Khoác Nữ Cổ Cao', N'aokhoac_nu_co_cao_52_1.jpg,aokhoac_nu_co_cao_52_2.jpg,aokhoac_nu_co_cao_52_3.jpg,aokhoac_nu_co_cao_52_4.jpg', 500000, CAST(N'2023-06-22' AS Date), 65, N'ca02', 0),
(53, N'Quần Dài Nữ', N'quandai_nu_53_1.jpg,quandai_nu_53_2.jpg,quandai_nu_53_3.jpg,quandai_nu_53_4.jpg', 380000, CAST(N'2023-06-23' AS Date), 60, N'ca05', 0),
(54, N'Quần Shorts Nam Thể Thao', N'quanshort_nam_the_thao_54_1.webp,quanshort_nam_the_thao_54_2.webp,quanshort_nam_the_thao_54_3.webp,quanshort_nam_the_thao_54_4.webp', 190000, CAST(N'2023-06-24' AS Date), 130, N'ca06', 0),
(55, N'Quần Jeans Rách Nữ', N'quan_jeans_rach_nu_55_1.webp,quan_jeans_rach_nu_55_2.webp,quan_jeans_rach_nu_55_3.webp,quan_jeans_rach_nu_55_4.webp', 440000, CAST(N'2023-06-25' AS Date), 55, N'ca07', 0),
(56, N'Áo Sơ Mi Nữ Cổ Tròn', N'aosomi_nu_co_tron_56_1.webp,aosomi_nu_co_tron_56_2.webp,aosomi_nu_co_tron_56_3.webp,aosomi_nu_co_tron_56_4.webp', 300000, CAST(N'2023-06-26' AS Date), 85, N'ca04', 0),
(57, N'Áo Thun Ngắn Tay', N'aothun_ngan_tay_57_1.webp,aothun_ngan_tay_57_2.webp,aothun_ngan_tay_57_3.webp,aothun_ngan_tay_57_4.webp', 175000, CAST(N'2023-06-27' AS Date), 145, N'ca01', 0),
(58, N'Áo Polo Cổ V', N'aopolo_co_v_58_1.webp,aopolo_co_v_58_2.webp,aopolo_co_v_58_3.webp,aopolo_co_v_58_4.webp', 225000, CAST(N'2023-06-28' AS Date), 120, N'ca03', 0),
(59, N'Quần Dài Chất Liệu Thun', N'quandai_thun_59_1.webp,quandai_thun_59_2.webp,quandai_thun_59_3.webp,quandai_thun_59_4.webp', 390000, CAST(N'2023-06-29' AS Date), 70, N'ca05', 0),
(60, N'Quần Shorts Jean Nữ', N'quanshort_jean_nu_60_1.webp,quanshort_jean_nu_60_2.webp,quanshort_jean_nu_60_3.webp,quanshort_jean_nu_60_4.webp', 195000, CAST(N'2023-06-30' AS Date), 125, N'ca06', 0),
(61, N'Áo Khoác Thể Thao', N'aokhoac_the_thao_61_1.webp,aokhoac_the_thao_61_2.webp,aokhoac_the_thao_61_3.webp,aokhoac_the_thao_61_4.webp', 450000, CAST(N'2023-07-01' AS Date), 70, N'ca02', 0),
(62, N'Áo Sơ Mi Nam Công Sở', N'aosomi_nam_cong_so_62_1.webp,aosomi_nam_cong_so_62_2.webp,aosomi_nam_cong_so_62_3.webp,aosomi_nam_cong_so_62_4.webp', 320000, CAST(N'2023-07-02' AS Date), 75, N'ca04', 0),
(63, N'Quần Dài Fom Slim', N'quandai_fom_slim_63_1.webp,quandai_fom_slim_63_2.webp,quandai_fom_slim_63_3.webp,quandai_fom_slim_63_4.webp', 410000, CAST(N'2023-07-03' AS Date), 65, N'ca05', 0),
(64, N'Áo Thun Chống Nắng', N'aothun_chong_nang_64_1.webp,aothun_chong_nang_64_2.webp,aothun_chong_nang_64_3.webp,aothun_chong_nang_64_4.webp', 200000, CAST(N'2023-07-04' AS Date), 150, N'ca01', 0),
(65, N'Áo Khoác Cách Điệu', N'aokhoac_cach_dieu_65_1.webp,aokhoac_cach_dieu_65_2.webp,aokhoac_cach_dieu_65_3.webp,aokhoac_cach_dieu_65_4.webp', 550000, CAST(N'2023-07-05' AS Date), 60, N'ca02', 0),
(66, N'Áo Polo Kẻ Sọc Nữ', N'aopolo_ke_nu_66_1.webp,aopolo_ke_nu_66_2.webp,aopolo_ke_nu_66_3.webp,aopolo_ke_nu_66_4.webp', 225000, CAST(N'2023-07-06' AS Date), 130, N'ca03', 0),
(67, N'Quần Jeans Dài Nam', N'quan_jeans_dai_nam_67_1.webp,quan_jeans_dai_nam_67_2.webp,quan_jeans_dai_nam_67_3.webp,quan_jeans_dai_nam_67_4.webp', 450000, CAST(N'2023-07-07' AS Date), 70, N'ca07', 0),
(68, N'Quần Shorts Nữ Họa Tiết', N'quanshort_nu_hoa_tiet_68_1.webp,quanshort_nu_hoa_tiet_68_2.webp,quanshort_nu_hoa_tiet_68_3.webp,quanshort_nu_hoa_tiet_68_4.webp', 180000, CAST(N'2023-07-08' AS Date), 140, N'ca06', 0),
(69, N'Áo Sơ Mi Nam Họa Tiết', N'aosomi_nam_hoa_tiet_69_1.webp,aosomi_nam_hoa_tiet_69_2.webp,aosomi_nam_hoa_tiet_69_3.webp,aosomi_nam_hoa_tiet_69_4.webp', 300000, CAST(N'2023-07-09' AS Date), 80, N'ca04', 0),
(70, N'Quần Dài Nữ Form Rộng', N'quandai_nu_form_rong_70_1.webp,quandai_nu_form_rong_70_2.webp,quandai_nu_form_rong_70_3.webp,quandai_nu_form_rong_70_4.webp', 370000, CAST(N'2023-07-10' AS Date), 65, N'ca05', 0);

SET IDENTITY_INSERT [dbo].[Products] OFF;