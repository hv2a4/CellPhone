USE [db_phone]
GO
/****** Object:  Table [dbo].[ADDRESS]    Script Date: 5/30/2024 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADDRESS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_USER] [nvarchar](255) NULL,
	[PROVINCE] [int] NULL,
	[DISTRICT] [int] NULL,
	[WARD] [nvarchar](225) NULL,
	[PROVINCE_NAME] [nvarchar](40) NULL,
	[DISTRICT_NAME] [nvarchar](40) NULL,
	[WARD_NAME] [nvarchar](40) NULL,
	[ADDRESS] [nvarchar](225) NULL,
	[SHIPPING_FEE] FLOAT NULL
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BATTERY_TYPE]    Script Date: 5/30/2024 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BATTERY_TYPE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BRAND]    Script Date: 5/30/2024 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BRAND](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CART]    Script Date: 5/30/2024 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CART](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_USER] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CART_ITEM]    Script Date: 5/30/2024 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CART_ITEM](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_VARIANT] [int] NULL,
	[ID_CART] [int] NULL,
	[QUANTITY] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORY]    Script Date: 5/30/2024 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORY](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHARGING_PORT]    Script Date: 5/30/2024 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHARGING_PORT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COLOR]    Script Date: 5/30/2024 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COLOR](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DISCOUNT_CODE]    Script Date: 5/30/2024 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DISCOUNT_CODE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_RANK] [int] NULL,
	[CODE] [varchar](255) NULL,
	[START_DATE] [datetime] NULL,
	[EXPIRY_DATE] [datetime] NULL,
	[PERCENTAGE] [float] NULL,
	[MINIMUM] [float] NULL,
	[QUANTITY] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DISCOUNT_PRODUCT]    Script Date: 5/30/2024 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DISCOUNT_PRODUCT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DISCOUNT_PERCENTAGE] [float] NULL,
	[START_DATE] [datetime] NULL,
	[EXPIRY_DATE] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GRAPHICS_CHIP]    Script Date: 5/30/2024 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRAPHICS_CHIP](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HEADPHONE_JACK]    Script Date: 5/30/2024 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HEADPHONE_JACK](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IMAGE]    Script Date: 5/30/2024 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IMAGE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_PHONE] [int] NULL,
	[IMAGE] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INVOICE]    Script Date: 5/30/2024 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INVOICE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_STATUS] [int] NULL,
	[ID_ORDER] [int] NULL,
	[CREATE_AT] [datetime] NULL,
	[UPDATE_AT] [datetime] NULL,
	[TOTAL_AMOUNT] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDER]    Script Date: 5/30/2024 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_USER] [nvarchar](255) NULL,
	[ID_STATUS] [int] NULL,
	[ADDRESS] [nvarchar](255) NULL,
	[ID_PAYMENT_METHOD] [int] NULL,
	[ID_DISCOUNT_CODE] [int] NULL,
	[TOTAL_DISCOUNT] [float] NULL,
	[TOTAL_AMOUNT] [float] NULL,
	[NOTE] [nvarchar](255) NULL,
	[REASON] [nvarchar](255) NULL,
	[CREATE_AT] [datetime] NULL,
	[UPDATE_AT] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDER_ITEM]    Script Date: 5/30/2024 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDER_ITEM](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_VARIANT] [int] NULL,
	[ID_ORDER] [int] NULL,
	[PRICE] [float] NULL,
	[QUANTITY] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PAYMENT_METHOD]    Script Date: 5/30/2024 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAYMENT_METHOD](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](225) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHONE]    Script Date: 5/30/2024 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHONE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_BRAND] [int] NULL,
	[ID_SYSTEM] [int] NULL,
	[ID_CHARGING_PORT] [int] NULL,
	[ID_HEADPHONE_JACK] [int] NULL,
	[ID_BATTERY_TYPE] [int] NULL,
	[ID_SCREEN] [int] NULL,
	[ID_GRAPHICS] [int] NULL,
	[ID_CATEGORY] [int] NULL,
	[NAME] [nvarchar](50) NULL,
	[CONNECTION] [nvarchar](50) NULL,
	[DESCRIPTION] [nvarchar](225) NULL,
	[SCREEN_SIZE] [float] NULL,
	[PROCESSOR] [nvarchar](255) NULL,
	[RAM] [float] NULL,
	[SELFIE_CAMERA] [int] NULL,
	[MAIN_CAMERA] [int] NULL,
	[BATTERY_CAPACITY] [int] NULL,
	[IS_DELETE] [bit] NULL,
	[CREATE_AT] [datetime] NULL,
	[UPDATE_AT] [datetime] NULL,
	[LENGTH] [float] NULL,
	[WIDTH] [float] NULL,
	[HEIGHT] [float] NULL,
	[WEIGHT] [float] NULL,
	[SCREEN_RESOLUTION] [nvarchar](225) NULL,
	[REFRESH_RATE] [int] NULL,
	[MAXIMUM_BRIGHTNESS] [int] NULL,
	[VIDEO_RECORDING] [nvarchar](50) NULL,
	[CPU_SPEED] [float] NULL,
	[IMAGE] [nvarchar](225) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RANK]    Script Date: 5/30/2024 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RANK](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RATING]    Script Date: 5/30/2024 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RATING](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_PHONE] [int] NULL,
	[ID_USER] [nvarchar](255) NULL,
	[CONTENT] [nvarchar](50) NULL,
	[STARS] [int] NULL,
	[CREATE_AT] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SCREEN_RESOLUTION]    Script Date: 5/30/2024 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SCREEN_RESOLUTION](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STATUS_INVOICE]    Script Date: 5/30/2024 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STATUS_INVOICE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STATUS_ORDER]    Script Date: 5/30/2024 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STATUS_ORDER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[STATUS] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STORAGE]    Script Date: 5/30/2024 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STORAGE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GB] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SYSTEM]    Script Date: 5/30/2024 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYSTEM](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SYSTEM] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USER]    Script Date: 5/30/2024 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER](
	[USERNAME] [nvarchar](255) NOT NULL,
	[ID_RANK] [int] NULL,
	[PASSWORD] [nvarchar](50) NULL,
	[EMAIL] [nvarchar](50) NULL,
	[ROLE] [bit] NULL,
	[CREATE_AT] [datetime] NULL,
	[UPDATE_AT] [datetime] NULL,
	[STATUS] [bit] NULL,
	[AVATAR] [nvarchar](225) NULL,
	[FULLNAME] [nvarchar](40) NULL,
	[GENDER] [nvarchar](50) NULL,
	[PHONE_NUMBER] [varchar](12) NULL,
	[INCORRECT_PASSWORD] int null,
	[CLOCKDOWN_PERIOD] [datetime] NULL
PRIMARY KEY CLUSTERED 
(
	[USERNAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VARIANT]    Script Date: 5/30/2024 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VARIANT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_PHONE] [int] NULL,
	[ID_COLOR] [int] NULL,
	[ID_STORAGE] [int] NULL,
	[ID_DISCOUNT_PRODUCT] [int] NULL,
	[QUANTITY] [int] NULL,
	[PRICE] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WIRELESS_CHARGING_TECHNOLOGY]    Script Date: 5/30/2024 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WIRELESS_CHARGING_TECHNOLOGY](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WP]    Script Date: 5/30/2024 10:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WP](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_PHONE] [int] NULL,
	[ID_WCT] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ADDRESS]  WITH CHECK ADD  CONSTRAINT [FK_ADDRESS_USER] FOREIGN KEY([ID_USER])
REFERENCES [dbo].[USER] ([USERNAME])
GO
ALTER TABLE [dbo].[ADDRESS] CHECK CONSTRAINT [FK_ADDRESS_USER]
GO
ALTER TABLE [dbo].[CART]  WITH CHECK ADD  CONSTRAINT [FK_CART_USER] FOREIGN KEY([ID_USER])
REFERENCES [dbo].[USER] ([USERNAME])
GO
ALTER TABLE [dbo].[CART] CHECK CONSTRAINT [FK_CART_USER]
GO
ALTER TABLE [dbo].[CART_ITEM]  WITH CHECK ADD  CONSTRAINT [FK_CART_ITEM_CART] FOREIGN KEY([ID_CART])
REFERENCES [dbo].[CART] ([ID])
GO
ALTER TABLE [dbo].[CART_ITEM] CHECK CONSTRAINT [FK_CART_ITEM_CART]
GO
ALTER TABLE [dbo].[CART_ITEM]  WITH CHECK ADD  CONSTRAINT [FK_CART_ITEM_VARIANT] FOREIGN KEY([ID_VARIANT])
REFERENCES [dbo].[VARIANT] ([ID])
GO
ALTER TABLE [dbo].[CART_ITEM] CHECK CONSTRAINT [FK_CART_ITEM_VARIANT]
GO
ALTER TABLE [dbo].[DISCOUNT_CODE]  WITH CHECK ADD  CONSTRAINT [FK_RANK_DISCOUNT_CODE] FOREIGN KEY([ID_RANK])
REFERENCES [dbo].[RANK] ([ID])
GO
ALTER TABLE [dbo].[DISCOUNT_CODE] CHECK CONSTRAINT [FK_RANK_DISCOUNT_CODE]
GO
ALTER TABLE [dbo].[IMAGE]  WITH CHECK ADD  CONSTRAINT [FK_IMAGE_PHONE] FOREIGN KEY([ID_PHONE])
REFERENCES [dbo].[PHONE] ([ID])
GO
ALTER TABLE [dbo].[IMAGE] CHECK CONSTRAINT [FK_IMAGE_PHONE]
GO
ALTER TABLE [dbo].[INVOICE]  WITH CHECK ADD  CONSTRAINT [FK_INVOICE_ORDER] FOREIGN KEY([ID_ORDER])
REFERENCES [dbo].[ORDER] ([ID])
GO
ALTER TABLE [dbo].[INVOICE] CHECK CONSTRAINT [FK_INVOICE_ORDER]
GO
ALTER TABLE [dbo].[INVOICE]  WITH CHECK ADD  CONSTRAINT [FK_INVOICE_STATUS_INVOICE] FOREIGN KEY([ID_STATUS])
REFERENCES [dbo].[STATUS_INVOICE] ([ID])
GO
ALTER TABLE [dbo].[INVOICE] CHECK CONSTRAINT [FK_INVOICE_STATUS_INVOICE]
GO
ALTER TABLE [dbo].[ORDER]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_DISCOUNT_CODE] FOREIGN KEY([ID_DISCOUNT_CODE])
REFERENCES [dbo].[DISCOUNT_CODE] ([ID])
GO
ALTER TABLE [dbo].[ORDER] CHECK CONSTRAINT [FK_ORDER_DISCOUNT_CODE]
GO
ALTER TABLE [dbo].[ORDER]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_PAYMENT_METHOD] FOREIGN KEY([ID_PAYMENT_METHOD])
REFERENCES [dbo].[PAYMENT_METHOD] ([ID])
GO
ALTER TABLE [dbo].[ORDER] CHECK CONSTRAINT [FK_ORDER_PAYMENT_METHOD]
GO
ALTER TABLE [dbo].[ORDER]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_STATUS_ORDER] FOREIGN KEY([ID_STATUS])
REFERENCES [dbo].[STATUS_ORDER] ([ID])
GO
ALTER TABLE [dbo].[ORDER] CHECK CONSTRAINT [FK_ORDER_STATUS_ORDER]
GO
ALTER TABLE [dbo].[ORDER]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_USERS] FOREIGN KEY([ID_USER])
REFERENCES [dbo].[USER] ([USERNAME])
GO
ALTER TABLE [dbo].[ORDER] CHECK CONSTRAINT [FK_ORDER_USERS]
GO
ALTER TABLE [dbo].[ORDER_ITEM]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_ITEM_ORDER] FOREIGN KEY([ID_ORDER])
REFERENCES [dbo].[ORDER] ([ID])
GO
ALTER TABLE [dbo].[ORDER_ITEM] CHECK CONSTRAINT [FK_ORDER_ITEM_ORDER]
GO
ALTER TABLE [dbo].[ORDER_ITEM]  WITH CHECK ADD  CONSTRAINT [FK_ORDER_ITEM_VARIANT] FOREIGN KEY([ID_VARIANT])
REFERENCES [dbo].[VARIANT] ([ID])
GO
ALTER TABLE [dbo].[ORDER_ITEM] CHECK CONSTRAINT [FK_ORDER_ITEM_VARIANT]
GO
ALTER TABLE [dbo].[PHONE]  WITH CHECK ADD  CONSTRAINT [FK_PHONE_BATTERY_TYPE] FOREIGN KEY([ID_BATTERY_TYPE])
REFERENCES [dbo].[BATTERY_TYPE] ([ID])
GO
ALTER TABLE [dbo].[PHONE] CHECK CONSTRAINT [FK_PHONE_BATTERY_TYPE]
GO
ALTER TABLE [dbo].[PHONE]  WITH CHECK ADD  CONSTRAINT [FK_PHONE_BRAND] FOREIGN KEY([ID_BRAND])
REFERENCES [dbo].[BRAND] ([ID])
GO
ALTER TABLE [dbo].[PHONE] CHECK CONSTRAINT [FK_PHONE_BRAND]
GO
ALTER TABLE [dbo].[PHONE]  WITH CHECK ADD  CONSTRAINT [FK_PHONE_CATEGORY] FOREIGN KEY([ID_CATEGORY])
REFERENCES [dbo].[CATEGORY] ([ID])
GO
ALTER TABLE [dbo].[PHONE] CHECK CONSTRAINT [FK_PHONE_CATEGORY]
GO
ALTER TABLE [dbo].[PHONE]  WITH CHECK ADD  CONSTRAINT [FK_PHONE_CHARGING_PORT] FOREIGN KEY([ID_CHARGING_PORT])
REFERENCES [dbo].[CHARGING_PORT] ([ID])
GO
ALTER TABLE [dbo].[PHONE] CHECK CONSTRAINT [FK_PHONE_CHARGING_PORT]
GO
ALTER TABLE [dbo].[PHONE]  WITH CHECK ADD  CONSTRAINT [FK_PHONE_GRAPHICS_CHIP] FOREIGN KEY([ID_GRAPHICS])
REFERENCES [dbo].[GRAPHICS_CHIP] ([ID])
GO
ALTER TABLE [dbo].[PHONE] CHECK CONSTRAINT [FK_PHONE_GRAPHICS_CHIP]
GO
ALTER TABLE [dbo].[PHONE]  WITH CHECK ADD  CONSTRAINT [FK_PHONE_HEADPHONE_JACK] FOREIGN KEY([ID_HEADPHONE_JACK])
REFERENCES [dbo].[HEADPHONE_JACK] ([ID])
GO
ALTER TABLE [dbo].[PHONE] CHECK CONSTRAINT [FK_PHONE_HEADPHONE_JACK]
GO
ALTER TABLE [dbo].[PHONE]  WITH CHECK ADD  CONSTRAINT [FK_PHONE_SCREEN_RESOLUTION] FOREIGN KEY([ID_SCREEN])
REFERENCES [dbo].[SCREEN_RESOLUTION] ([ID])
GO
ALTER TABLE [dbo].[PHONE] CHECK CONSTRAINT [FK_PHONE_SCREEN_RESOLUTION]
GO
ALTER TABLE [dbo].[PHONE]  WITH CHECK ADD  CONSTRAINT [FK_PHONE_SYSTEM] FOREIGN KEY([ID_SYSTEM])
REFERENCES [dbo].[SYSTEM] ([ID])
GO
ALTER TABLE [dbo].[PHONE] CHECK CONSTRAINT [FK_PHONE_SYSTEM]
GO
ALTER TABLE [dbo].[RATING]  WITH CHECK ADD  CONSTRAINT [FK_RATING_PHONE] FOREIGN KEY([ID_PHONE])
REFERENCES [dbo].[PHONE] ([ID])
GO
ALTER TABLE [dbo].[RATING] CHECK CONSTRAINT [FK_RATING_PHONE]
GO
ALTER TABLE [dbo].[RATING]  WITH CHECK ADD  CONSTRAINT [FK_RATING_USER] FOREIGN KEY([ID_USER])
REFERENCES [dbo].[USER] ([USERNAME])
GO
ALTER TABLE [dbo].[RATING] CHECK CONSTRAINT [FK_RATING_USER]
GO
ALTER TABLE [dbo].[USER]  WITH CHECK ADD  CONSTRAINT [FK_USER_RANK] FOREIGN KEY([ID_RANK])
REFERENCES [dbo].[RANK] ([ID])
GO
ALTER TABLE [dbo].[USER] CHECK CONSTRAINT [FK_USER_RANK]
GO
ALTER TABLE [dbo].[VARIANT]  WITH CHECK ADD  CONSTRAINT [FK_VARIANT_COLOR] FOREIGN KEY([ID_COLOR])
REFERENCES [dbo].[COLOR] ([ID])
GO
ALTER TABLE [dbo].[VARIANT] CHECK CONSTRAINT [FK_VARIANT_COLOR]
GO
ALTER TABLE [dbo].[VARIANT]  WITH CHECK ADD  CONSTRAINT [FK_VARIANT_DISCOUNT_PRODUCT] FOREIGN KEY([ID_DISCOUNT_PRODUCT])
REFERENCES [dbo].[DISCOUNT_PRODUCT] ([ID])
GO
ALTER TABLE [dbo].[VARIANT] CHECK CONSTRAINT [FK_VARIANT_DISCOUNT_PRODUCT]
GO
ALTER TABLE [dbo].[VARIANT]  WITH CHECK ADD  CONSTRAINT [FK_VARIANT_PHONE] FOREIGN KEY([ID_PHONE])
REFERENCES [dbo].[PHONE] ([ID])
GO
ALTER TABLE [dbo].[VARIANT] CHECK CONSTRAINT [FK_VARIANT_PHONE]
GO
ALTER TABLE [dbo].[VARIANT]  WITH CHECK ADD  CONSTRAINT [FK_VARIANT_STORAGE] FOREIGN KEY([ID_STORAGE])
REFERENCES [dbo].[STORAGE] ([ID])
GO
ALTER TABLE [dbo].[VARIANT] CHECK CONSTRAINT [FK_VARIANT_STORAGE]
GO
ALTER TABLE [dbo].[WP]  WITH CHECK ADD  CONSTRAINT [FK_WP_PHONE] FOREIGN KEY([ID_PHONE])
REFERENCES [dbo].[PHONE] ([ID])
GO
ALTER TABLE [dbo].[WP] CHECK CONSTRAINT [FK_WP_PHONE]
GO
ALTER TABLE [dbo].[WP]  WITH CHECK ADD  CONSTRAINT [FK_Wp_WIRELESS_CHARGING_TECHNOLOGY] FOREIGN KEY([ID_WCT])
REFERENCES [dbo].[WIRELESS_CHARGING_TECHNOLOGY] ([ID])
GO
ALTER TABLE [dbo].[WP] CHECK CONSTRAINT [FK_Wp_WIRELESS_CHARGING_TECHNOLOGY]
GO

/*THÊM DỮ LIỆU HEADPHONE_JACK*/

INSERT INTO [dbo].[HEADPHONE_JACK] ([NAME]) 
VALUES	('TS'),
		('TRS'),
		('TRRS');

/*THÊM DỮ LIỆU MÀU*/
INSERT INTO [dbo].[COLOR] ([NAME])
VALUES 
(N'Trắng'),
(N'Đen'),
(N'Đỏ'),
(N'Lam'),
(N'Xanh'),
(N'Vàng'),
(N'Cam'),
(N'Tím'),
(N'Hồng'),
(N'Nâu'),
(N'Xám'),
(N'Bạc'),
(N'Vàng'),
(N'Lục'),
(N'Chàm')

/*THÊM DỮ LIỆU STORAGE*/
INSERT INTO [dbo].[STORAGE] ([GB])
VALUES (32),
(64),
(128),
(256),
(512),
(1024)

/*THÊM DỮ LIỆU DISCOUNT_PRODUCT*/
INSERT INTO [dbo].[DISCOUNT_PRODUCT] ([DISCOUNT_PERCENTAGE], [START_DATE], [EXPIRY_DATE])
VALUES (10, '2024-06-01', '2024-06-30'),
(5, '2024-07-01', '2025-07-31'),
(10, '2024-08-01', '2025-08-31'),
(15, '2024-09-01', '2025-09-30'),
(20, '2024-10-01', '2025-10-31'),
(12, '2024-11-01', '2025-11-30'),
(18, '2024-12-01', '2025-12-31'),
(22, '2025-01-01', '2024-01-31'),
(8, '2025-02-01', '2025-02-28'),
(16, '2025-03-01', '2025-03-31');

/*THÊM DỮ LIỆU TRẠNG THÁI HÓA ĐƠN*/
INSERT INTO [dbo].[STATUS_INVOICE] ([NAME])
VALUES (N'Đã thanh toán'),
(N'Chưa thanh toán'),
(N'Đã hủy')

/*THÊM DỮ LIỆU BẬC HẠNG */
INSERT INTO [dbo].[RANK] ([NAME])
VALUES (N'Người mới'),
(N'Đồng'),
(N'Bạc'),
(N'Vàng'),
(N'Kim cương');

/*THÊM DỮ LIỆU MÃ GIẢM GIÁ */
INSERT INTO [dbo].[DISCOUNT_CODE] ([ID_RANK], [CODE], [START_DATE], [EXPIRY_DATE], [PERCENTAGE], [MINIMUM], [QUANTITY])
VALUES (1, 'CODE1', '2024-06-01', '2024-06-30', 10, 0, 50),
(2, 'CODE2', '2024-05-01', '2024-07-31', 15, 150000, 100),
(3, 'CODE3', '2024-05-01', '2024-08-31', 20, 200000, 200),
(1, 'CODE4', '2024-05-01', '2024-09-30', 25, 250000, 150),
(2, 'CODE5', '2024-03-01', '2024-10-31', 30, 300000, 100),
(3, 'CODE6', '2024-01-01', '2024-11-30', 10, 100000, 50);

/*THÊM DỮ LIỆU CỔNG SẠC*/
INSERT INTO [dbo].[CHARGING_PORT] ([NAME])
VALUES (N'USB Type-A'),
(N'USB Type-C'),
(N'Micro USB'),
(N'Lightning'),
(N'MagSafe'),
(N'Wireless'),
(N'Power Delivery'),
(N'Qi'),
(N'USB Type-B'),
(N'Thunderbolt');

/*THÊM DỮ LIỆU HỆ THỐNG*/
INSERT INTO [dbo].[SYSTEM] ([SYSTEM])
VALUES 
(N'iOS'),
(N'Android')

/*THÊM DỮ LIỆU HÃNG*/
INSERT INTO [dbo].[BRAND] ([NAME])
VALUES 
(N'Huawei'),
(N'Apple'),
(N'Samsung'),
(N'LG'),
(N'Xiaomi'),
(N'Nokia'),
(N'Lenovo'),
(N'Oppo'),
(N'Vivo'),
(N'Realme')

/*THÊM DỮ LIỆU LOẠI PIN ĐIỆN THOẠI*/
INSERT INTO [dbo].[BATTERY_TYPE] ([NAME])
VALUES (N'Li-po'),
(N'Li-ion');

/*THÊM DỮ LIỆU CÔNG NGHỆ SẠC*/
INSERT INTO [dbo].[WIRELESS_CHARGING_TECHNOLOGY] ([NAME])
VALUES (N'Qi'),
(N'Sạc nhanh'),
(N'Sạc không dây'),
(N'USB-C'),
(N'VOOC'),
(N'Wireless PowerShare');

/*THÊM DỮ LIỆU MÀNG HÌNH*/
INSERT INTO [dbo].[SCREEN_RESOLUTION] ([NAME])
VALUES (N'HD'),
(N'Full HD'),
(N'Quad HD'),
(N'4K UHD');

/*THÊM DỮ LIỆU CHIP ĐỒ HỌA*/
INSERT INTO [dbo].[GRAPHICS_CHIP] ([NAME])
VALUES (N'Adreno 650'),
(N'Mali-G78 MP14'),
(N'Apple A14 Bionic'),
(N'Exynos 2100'),
(N'Kirin 9000'),
(N'Snapdragon 888');

/*THÊM DỮ LIỆU TRẠNG THÁI ĐƠN HÀNG */
INSERT INTO [dbo].[STATUS_ORDER] ([STATUS])
VALUES 
(N'Hoàn thành'),
(N'Chờ xác nhận'),
(N'Đã xác nhận'),
(N'Giao hàng'),
(N'Trả hàng'),
(N'Hủy'),
(N'Chờ xác nhận trả'),
(N'Giao trả')
;

/*THÊM DỮ LIỆU PHƯƠNG THỨC THANH TOÁN*/
INSERT INTO [dbo].[PAYMENT_METHOD] ([NAME])
VALUES (N'Thanh toán khi nhận hàng'),
(N'Thanh toán online');

/*THÊM DỮ LIỆU USER*/
INSERT INTO [dbo].[USER] ([USERNAME], [ID_RANK], [PASSWORD], [EMAIL], [ROLE], [CREATE_AT], [UPDATE_AT], [STATUS], [AVATAR], [FULLNAME], [GENDER], [PHONE_NUMBER], [INCORRECT_PASSWORD])
VALUES
('sachanphuoc', 1, 'sachanhuocpw', 'phuocscpc06456@fpt.edu.vn', 1, GETDATE(), GETDATE(), 1, 'avatar1.jpg', N'Sa Chấn Phước', 'NAM', N'0234567890', 0),
('nguyenvana1', 5, 'nguyenvana1pw', 'nguyenvana1@email.com', 0, GETDATE(), GETDATE(), 1, 'avatar1.jpg', N'Nguyễn Văn A 1', 'NAM', N'0234567891', 0),
('nguyenvanb2', 4, 'nguyenvanb2pw', 'nguyenvanb2@email.com', 1, GETDATE(), GETDATE(), 0, 'avatar2.jpg', N'Nguyễn Văn B 2', 'NAM', N'0234567892', 0),
('tranthic3', 3, 'tranthic3pw', 'tranthic3@email.com', 0, GETDATE(), GETDATE(), 0, 'avatar3.jpg', N'Trần Thị C 3', N'NỮ', N'0234567893', 0),
('ledinh4', 3, 'ledinh4pw', 'ledinh4@email.com', 1, GETDATE(), GETDATE(), 1, 'avatar4.jpg', N'Lê Đình 4', 'NAM', N'0234567894', 0),
('hoangthid5', 2, 'hoangthid5pw', 'hoangthid5@email.com', 0, GETDATE(), GETDATE(), 1, 'avatar5.jpg', N'Hoàng Thị D 5', N'NỮ', N'0234567895', 0),
('ngocdung6', 2, 'ngocdung6pw', 'ngocdung6@email.com', 0, GETDATE(), GETDATE(), 1, 'avatar6.jpg', N'Ngọc Dung 6', N'NỮ', N'0234567896', 0),
('lehong7', 5, 'lehong7pw', 'lehong7@email.com', 0, GETDATE(), GETDATE(), 1, 'avatar7.jpg', N'Lê Hồng 7', 'NAM', N'0234567897', 0),
('nguyenyen8', 1, 'nguyenyen8pw', 'nguyenyen8@email.com', 0, GETDATE(), GETDATE(), 1, 'avatar8.jpg', N'Nguyễn Yến 8', N'NỮ', N'0234567898', 0),
('tranvan9', 1, 'tranvan9pw', 'tranvan9@email.com', 0, GETDATE(), GETDATE(), 1, 'avatar9.jpg', N'Trần Văn 9', 'NAM', N'0234567899', 0),
('dinhthuong10', 1, 'dinhthuong10pw', 'dinhthuong10@email.com', 0, GETDATE(), GETDATE(), 1, 'avatar10.jpg', N'Đình Thượng 10', 'NAM', N'0234567800', 0),
('leminhchau11', 1, 'leminhchau11pw', 'leminhchau11@email.com', 0, GETDATE(), GETDATE(), 1, 'avatar11.jpg', N'Lê Minh Châu 11', 'NAM', N'0234567801', 0),
('nguyenduong12', 1, 'nguyenduong12pw', 'nguyenduong12@email.com', 0, GETDATE(), GETDATE(), 1, 'avatar12.jpg', N'Nguyễn Dương 12', 'NAM', N'0234567802', 0),
('phanminhhieu13', 1, 'phanminhhieu13pw', 'phanminhhieu13@email.com', 1, GETDATE(), GETDATE(), 1, 'avatar13.jpg', N'Phan Minh Hiếu 13', 'NAM', N'0234567803', 0),
('lekhanhlinh14', 1, 'lekhanhlinh14pw', 'lekhanhlinh14@email.com', 1, GETDATE(), GETDATE(), 1, 'avatar14.jpg', N'Lê Khánh Linh 14', N'NỮ', N'0234567804', 0),
('nguyenthingoc15', 1, 'nguyenthingoc15pw', 'nguyenthingoc15@email.com', 1, GETDATE(), GETDATE(), 1, 'avatar15.jpg', N'Nguyễn Thị Ngọc 15', N'NỮ', N'0234567805', 0);

/*THÊM DỮ LIỆU CART*/
INSERT INTO [dbo].[CART] ([ID_USER])
VALUES
('nguyenvana1'),
('nguyenvanb2'),
('tranthic3'),
('ledinh4'),
('hoangthid5'),
('ngocdung6'),
('lehong7'),
('nguyenyen8'),
('tranvan9'),
('dinhthuong10'),
('leminhchau11'),
('nguyenduong12'),
('phanminhhieu13'),
('lekhanhlinh14'),
('nguyenthingoc15');

/*THÊM DỮ LIỆU ADRESS*/
INSERT INTO [dbo].[ADDRESS] ([ID_USER], [ADDRESS])
VALUES
('nguyenvana1', '123 ABC Street, City A'),
('nguyenvanb2', '456 XYZ Avenue, City B'),
('tranthic3', '789 PQR Road, City C'),
('ledinh4', '321 LMN Lane, City D'),
('hoangthid5', '654 DEF Boulevard, City E'),
('ngocdung6', '987 GHI Drive, City F'),
('lehong7', '654 DEF Boulevard, City E'),
('nguyenyen8', '987 GHI Drive, City F'),
('tranvan9', '321 LMN Lane, City D'),
('dinhthuong10', '123 ABC Street, City A'),
('leminhchau11', '456 XYZ Avenue, City B'),
('nguyenduong12', '789 PQR Road, City C'),
('phanminhhieu13', '987 GHI Drive, City F'),
('lekhanhlinh14', '654 DEF Boulevard, City E'),
('nguyenthingoc15', '321 LMN Lane, City D');

/*THÊM DỮ LIỆU ĐƠN HÀNG*/
INSERT INTO [dbo].[ORDER] ([ID_USER], [ID_STATUS], [ADDRESS], [ID_PAYMENT_METHOD], [TOTAL_DISCOUNT], [TOTAL_AMOUNT], [NOTE], [CREATE_AT], [UPDATE_AT])
VALUES
('nguyenvana1', 1, 1, 1, 1, 9000000.0, 'Order note 1', GETDATE(), GETDATE()),
('nguyenvanb2', 1, 2, 1, 1, 9500000.0, 'Order note 2', GETDATE(), GETDATE()),
('nguyenvana1', 7, 1, 1, 1, 9000000.0, 'Order note 1', GETDATE(), GETDATE()),
('nguyenvanb2', 7, 2, 1, 1, 9500000.0, 'Order note 2', GETDATE(), GETDATE()),
('tranthic3', 2, 3, 1, 1, 8500000.0, 'Order note 3', GETDATE(), GETDATE()),
('ledinh4', 2, 4, 1, 1, 8000000.0, 'Order note 4', GETDATE(), GETDATE()),
('hoangthid5', 2, 5, 1, 1, 7500000.0, 'Order note 5', GETDATE(), GETDATE()),
('ngocdung6', 2, 6, 1, 1, 7000000.0, 'Order note 6', GETDATE(), GETDATE()),
('lehong7', 6, 7, 1, 1, 6500000.0, 'Order note 7', GETDATE(), GETDATE()),
('nguyenyen8', 5, 8, 1, 1, 6000000.0, 'Order note 8', GETDATE(), GETDATE()),
('tranvan9', 6, 9, 1, 1, 5500000.0, 'Order note 9', GETDATE(), GETDATE()),
('dinhthuong10', 5, 10, 1, 1, 5000000.0, 'Order note 10', GETDATE(), GETDATE()),
('leminhchau11', 1, 11, 1, 1, 9000000.0, 'Order note 11', GETDATE(), GETDATE()),
('nguyenduong12', 7, 12, 1, 1, 9500000.0, 'Order note 12', GETDATE(), GETDATE()),
('phanminhhieu13', 2, 13, 1, 1, 8500000.0, 'Order note 13', GETDATE(), GETDATE()),
('lekhanhlinh14', 2, 14, 1, 1, 8000000.0, 'Order note 14', GETDATE(), GETDATE());

/*THÊM DỮ LIỆU DANH MỤC*/
INSERT INTO [dbo].[CATEGORY] ([NAME])
VALUES
(N'MỚI'),
(N'BÁN CHẠY'),
(N'GIẢM GIÁ'),
(N'HOT'),
(N'BÁN CHẠY NHẤT')
;

/*THÊM DỮ LIỆU PHONE*/
INSERT INTO [dbo].[PHONE] ([ID_BRAND], [ID_SYSTEM], [ID_CHARGING_PORT], [ID_HEADPHONE_JACK], [ID_BATTERY_TYPE], [ID_SCREEN], [ID_GRAPHICS], [ID_CATEGORY], [NAME], [CONNECTION], [DESCRIPTION], [SCREEN_SIZE], [PROCESSOR], [RAM], [SELFIE_CAMERA], [MAIN_CAMERA], [BATTERY_CAPACITY], [IS_DELETE], [CREATE_AT], [UPDATE_AT], [LENGTH], [WIDTH], [HEIGHT], [WEIGHT], [SCREEN_RESOLUTION], [REFRESH_RATE], [MAXIMUM_BRIGHTNESS], [VIDEO_RECORDING], [CPU_SPEED],[IMAGE])
VALUES
(2, 1, 2, 1, 1, 1, 1, 1, 'Iphone 15 Pro Max', 'Wifi, 3G, 4G, 5G, Bluetooth', 'Phone description 1', 6.2, 'Snapdragon 845', 4, 16, 12, 4000, 0, GETDATE(), GETDATE(), 150, 70, 8, 180, '1080x2340', 60, 500, '4K', 2.8,'image1.jpg'),
(3, 2, 10, 2, 2, 2, 2,1, 'Samsung Galaxy S23 FE', 'Wifi, 3G, 4G, 5G, Bluetooth', 'Phone description 2', 6.5, 'Exynos 9820', 6, 20, 48, 4500, 0, GETDATE(), GETDATE(), 160, 75, 9, 190, '1440x3040', 90, 600, '8K', 3.2,'image6.jpg'),
(2, 1, 5, 3, 1, 3, 3,1, 'Iphone 15', 'Wifi, 3G, 4G, 5G, Bluetooth', 'Phone description 3', 6.7, 'Apple A14 Bionic', 8, 25, 64, 5000, 0, GETDATE(), GETDATE(), 170, 80, 10, 200, '1668x2388', 120, 700, '4K', 2.5,'image11.jpg'),
(2, 1, 4, 2, 1, 4, 4,1, 'Iphone 14 Pro', 'Wifi, 3G, 4G, Bluetooth', 'Phone description 4', 6.4, 'Kirin 980', 6, 32, 40, 4200, 0, GETDATE(), GETDATE(), 155, 72, 8.5, 185, '1080x2400', 90, 550, '8K', 2.7,'image16.jpg'),
(8, 2, 7, 1, 1, 1, 5,5, 'Reno8 T', 'Wifi, 3G, 4G, 5G, Bluetooth', 'Phone description 5', 6.1, 'Snapdragon 888', 8, 20, 64, 4700, 0, GETDATE(), GETDATE(), 158, 74, 8.2, 192, '1440x3200', 120, 650, '4K', 3.0,'image21.jpg'),
(3, 2, 4, 3, 2, 2, 4,1, 'Samsung Galaxy S30', 'NFC, Wifi, 3G, 4G, 5G, Bluetooth', 'Phone description 9', 6.2, 'Kirin 970', 4, 16, 20, 3800, 0, GETDATE(), GETDATE(), 150, 70, 8, 180, '1080x2340', 60, 500, '4K', 2.4,'image26.jpg'),
(5, 2, 5, 1, 1, 3, 5,2, 'Nokia ong', 'Wifi, 3G, 4G, Bluetooth', 'Phone description 10', 6.3, 'Snapdragon 765G', 6, 24, 64, 4200, 0, GETDATE(), GETDATE(), 155, 72, 8.5, 185, '1080x2400', 90, 550, '8K', 2.6,'image31.jpg'),
(6, 2, 4, 3, 2, 2, 3,3, 'Nokia vang', 'NFC, Wifi, 3G, 4G, 5G, Bluetooth', 'Phone description 9', 6.2, 'Kirin 970', 4, 16, 20, 3800, 0, GETDATE(), GETDATE(), 150, 70, 8, 180, '1080x2340', 60, 500, '4K', 2.4,'image35.jpg'),
(3, 2, 2, 1, 1, 1, 1, 4, 'Samsung Galaxy S23 Ultra', 'Wifi, 3G, 4G, 5G, Bluetooth', 'Phone description 1', 6.2, 'Snapdragon 845', 4, 16, 12, 4000, 0, GETDATE(), GETDATE(), 150, 70, 8, 180, '1080x2340', 60, 500, '4K', 2.8,'image2.jpg'),
(3, 2, 10, 2, 2, 2, 2, 2, 'Samsung M54', 'Wifi, 3G, 4G, 5G, Bluetooth', 'Phone description 2', 6.5, 'Exynos 9820', 6, 20, 48, 4500, 0, GETDATE(), GETDATE(), 160, 75, 9, 190, '1440x3040', 90, 600, '8K', 3.2,'image5.jpg'),
(2, 1, 5, 3, 1, 3, 3, 2, 'Iphone X', 'Wifi, 3G, 4G, 5G, Bluetooth', 'Phone description 3', 6.7, 'Apple A14 Bionic', 8, 25, 64, 5000, 0, GETDATE(), GETDATE(), 170, 80, 10, 200, '1668x2388', 120, 700, '4K', 2.5,'image10.jpg'),
(10, 2, 4, 2, 1, 4, 4, 2, 'Realme C60', 'Wifi, 3G, 4G, Bluetooth', 'Phone description 4', 6.4, 'Kirin 980', 6, 32, 40, 4200, 0, GETDATE(), GETDATE(), 155, 72, 8.5, 185, '1080x2400', 90, 550, '8K', 2.7,'image15.jpg'),
(5, 2, 7, 1, 1, 1, 5, 3, 'Xiaomi 14', 'Wifi, 3G, 4G, 5G, Bluetooth', 'Phone description 5', 6.1, 'Snapdragon 888', 8, 20, 64, 4700, 0, GETDATE(), GETDATE(), 158, 74, 8.2, 192, '1440x3200', 120, 650, '4K', 3.0,'image20.jpg'),
(2, 1, 4, 3, 2, 2, 4, 3, 'Iphone 11', 'NFC, Wifi, 3G, 4G, 5G, Bluetooth', 'Phone description 9', 6.2, 'Kirin 970', 4, 16, 20, 3800, 0, GETDATE(), GETDATE(), 150, 70, 8, 180, '1080x2340', 60, 500, '4K', 2.4,'image25.jpg'),
(6, 2, 5, 1, 1, 3, 5, 3, 'Masstel Phím', 'Wifi, 3G, 4G, Bluetooth', 'Phone description 10', 6.3, 'Snapdragon 765G', 6, 24, 64, 4200, 0, GETDATE(), GETDATE(), 155, 72, 8.5, 185, '1080x2400', 90, 550, '8K', 2.6,'image34.jpg'),
(6, 2, 4, 3, 2, 2, 3, 5, 'Nokia 72M', 'NFC, Wifi, 3G, 4G, 5G, Bluetooth', 'Phone description 9', 6.2, 'Kirin 970', 4, 16, 20, 3800, 0, GETDATE(), GETDATE(), 150, 70, 8, 180, '1080x2340', 60, 500, '4K', 2.4,'image33.jpg'),
(10, 2, 5, 3, 1, 3, 3, 4, 'Reami 12', 'Wifi, 3G, 4G, 5G, Bluetooth', 'Phone description 3', 6.7, 'Apple A14 Bionic', 8, 25, 64, 5000, 0, GETDATE(), GETDATE(), 170, 80, 10, 200, '1668x2388', 120, 700, '4K', 2.5,'image9.jpg'),
(10, 2, 4, 2, 1, 4, 4, 4, 'Realmi C67', 'Wifi, 3G, 4G, Bluetooth', 'Phone description 4', 6.4, 'Kirin 980', 6, 32, 40, 4200, 0, GETDATE(), GETDATE(), 155, 72, 8.5, 185, '1080x2400', 90, 550, '8K', 2.7,'image14.jpg'),
(1, 2, 7, 1, 1, 1, 5, 4, 'Reno 10 Pro', 'Wifi, 3G, 4G, 5G, Bluetooth', 'Phone description 5', 6.1, 'Snapdragon 888', 8, 20, 64, 4700, 0, GETDATE(), GETDATE(), 158, 74, 8.2, 192, '1440x3200', 120, 650, '4K', 3.0,'image19.jpg'),
(2, 1, 4, 3, 2, 2, 4, 5, 'Iphone 11', 'NFC, Wifi, 3G, 4G, 5G, Bluetooth', 'Phone description 9', 6.2, 'Kirin 970', 4, 16, 20, 3800, 0, GETDATE(), GETDATE(), 150, 70, 8, 180, '1080x2340', 60, 500, '4K', 2.4,'image24.jpg'),
(9, 2, 5, 1, 1, 3, 5, 5, 'Vivo V30e', 'Wifi, 3G, 4G, Bluetooth', 'Phone description 10', 6.3, 'Snapdragon 765G', 6, 24, 64, 4200, 0, GETDATE(), GETDATE(), 155, 72, 8.5, 185, '1080x2400', 90, 550, '8K', 2.6,'image30.jpg'),
(6, 2, 4, 3, 2, 2, 3, 5, 'Nokia WYS', 'NFC, Wifi, 3G, 4G, 5G, Bluetooth', 'Phone description 9', 6.2, 'Kirin 970', 4, 16, 20, 3800, 0, GETDATE(), GETDATE(), 150, 70, 8, 180, '1080x2340', 60, 500, '4K', 2.4,'image32.jpg');

/*THÊM DỮ LIỆU ĐÁNH GIÁ*/
INSERT INTO [dbo].[RATING] ([ID_PHONE], [ID_USER], [CONTENT], [STARS], [CREATE_AT])
VALUES
(1, 'nguyenvana1', 'Good phone', 4, '2024-05-01'),
(1, 'nguyenvanb2', 'Excellent device', 5, '2024-05-03'),
(2, 'tranthic3', 'Decent performance', 3, '2024-05-02'),
(2, 'ledinh4', 'Great value for money', 4, '2024-05-05'),
(3, 'hoangthid5', 'Impressive camera', 5, '2024-05-04'),
(3, 'ngocdung6', 'Fast and reliable', 4, '2024-05-06'),
(4, 'lehong7', 'Sleek design', 4, '2024-05-07'),
(4, 'nguyenyen8', 'Average battery life', 3, '2024-05-08'),
(5, 'tranvan9', 'Powerful performance', 5, '2024-05-09'),
(5, 'dinhthuong10', 'Good sound quality', 4, '2024-05-10'),
(1, 'leminhchau11', 'Nice display', 4, '2024-05-11'),
(1, 'nguyenduong12', 'Solid build quality', 4, '2024-05-12'),
(2, 'phanminhhieu13', 'Fast charging', 4, '2024-05-13'),
(2, 'lekhanhlinh14', 'Decent camera', 3, '2024-05-14'),
(3, 'nguyenthingoc15', 'Smooth performance', 5, '2024-05-15');

/*THÊM DỮ LIỆU ẢNH*/
INSERT INTO [dbo].[IMAGE] ([ID_PHONE], [IMAGE])
VALUES
(1, 'image1.jpg'),
(1, 'image2.jpg'),
(1, 'image3.jpg'),
(1, 'image4.jpg'),
(1, 'image5.jpg'),
(2, 'image6.jpg'),
(2, 'image7.jpg'),
(2, 'image8.jpg'),
(2, 'image9.jpg'),
(2, 'image10.jpg'),
(3, 'image11.jpg'),
(3, 'image12.jpg'),
(3, 'image13.jpg'),
(3, 'image14.jpg'),
(3, 'image15.jpg'),
(4, 'image16.jpg'),
(4, 'image17.jpg'),
(4, 'image18.jpg'),
(4, 'image19.jpg'),
(4, 'image20.jpg'),
(5, 'image21.jpg'),
(5, 'image22.jpg'),
(5, 'image23.jpg'),
(5, 'image24.jpg'),
(5, 'image25.jpg'),
(6, 'image26.jpg'),
(6, 'image27.jpg'),
(6, 'image28.jpg'),
(6, 'image29.jpg'),
(6, 'image30.jpg'),
(7, 'image31.jpg'),
(7, 'image32.jpg'),
(7, 'image33.jpg'),
(7, 'image34.jpg'),
(7, 'image35.jpg');

/*THÊM DỮ LIỆU WP*/
INSERT INTO [dbo].[WP] ([ID_PHONE], [ID_WCT])
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 1),
(3, 3),
(3, 5),
(4, 1),
(4, 4),
(4, 2),
(5, 5),
(5, 6),
(5, 1),
(6, 2),
(6, 3),
(6, 5),
(7, 2),
(7, 4),
(7, 6);

/*THÊM DỮ LIỆU VARIANT BIẾN THỂ*/
INSERT INTO [dbo].[VARIANT] ([ID_PHONE], [ID_COLOR], [ID_STORAGE], [ID_DISCOUNT_PRODUCT], [QUANTITY], [PRICE])
VALUES
(1, 2, 6, 1, 500, 35000000.00),
(1, 3, 5, 10, 501, 33000000.00),
(1, 1, 4, 2, 520, 30000000.00),
(2, 2, 3, 3, 150, 2000000.00),
(3, 3, 2, 4, 200, 15000000.00),
(3, 3, 1, 5, 180, 14000000.00),
(3, 3, 3, 6, 250, 16000000.00),
(4, 4, 2, 7, 60, 3000000.00),
(4, 4, 4, 8, 40, 2800000.00),
(4, 4, 6, 9, 90, 3200000.00),
(5, 5, 1, 10, 30, 5000000.00),
(5, 5, 2, 1, 500, 4800000.00),
(6, 6, 1, 5, 70, 4000000.00),
(6, 6, 1, 2, 60, 3800000.00),
(7, 2, 2, 9, 120, 1900000.00),
(8, 2, 2, 9, 120, 19000000.00),
(9, 4, 6, 9, 90, 3200000.00),
(10, 4, 4, 8, 40, 2800000.00),
(11, 4, 6, 9, 90, 3200000.00),
(12, 5, 1, 10, 30, 5000000.00),
(13, 5, 2, 1, 30, 4800000.00),
(14, 6, 1, 5, 7, 4000000.00),
(15, 6, 1, 2, 68, 3800000.00),
(16, 2, 3, 3, 159, 2000000.00),
(17, 3, 2, 4, 209, 15000000.00),
(18, 3, 1, 5, 198, 14000000.00),
(19, 3, 3, 6, 295, 16000000.00),
(20, 4, 2, 7, 69, 3000000.00),
(21, 3, 3, 6, 259, 16000000.00),
(22, 4, 2, 7, 69, 3000000.00);

/*THÊM DỮ LIỆU CART_ITEM*/
INSERT INTO [dbo].[CART_ITEM] ([ID_VARIANT], [ID_CART], [QUANTITY])
VALUES
(1, 1, 2),
(2, 1, 1),
(3, 2, 3),
(4, 2, 1),
(5, 3, 2),
(6, 3, 4),
(7, 4, 1),
(8, 4, 3),
(9, 5, 2),
(10, 5, 1),
(11, 6, 4),
(12, 6, 2),
(13, 7, 3),
(14, 7, 1),
(15, 8, 2),
(1, 8, 1),
(1, 9, 3),
(2, 9, 4),
(9, 10, 1),
(2, 10, 2),
(11, 11, 3),
(11, 11, 1),
(11, 12, 2),
(1, 12, 4),
(5, 13, 1),
(9, 13, 3),
(10, 14, 2),
(8, 14, 1),
(9, 15, 4),
(10, 15, 2);

/*THÊM DỮ LIỆU ORDER_ITEM*/
INSERT INTO [dbo].[ORDER_ITEM] ([ID_VARIANT], [ID_ORDER], [PRICE], [QUANTITY])
VALUES
(1, 1, 10000000.00, 2),
(2, 1, 9500000.00, 1),
(3, 2, 10500000.00, 3),
(4, 2, 20000000.00, 1),
(5, 3, 1900000.00, 2),
(6, 3, 15000000.00, 4),
(7, 4, 14000000.00, 1),
(8, 4, 16000000.00, 3),
(9, 5, 30000000.00, 2),
(10, 5, 28000000.00, 1),
(11, 6, 32000000.00, 4),
(12, 6, 50000000.00, 2),
(13, 7, 48000000.00, 3),
(14, 7, 40000000.00, 1),
(15, 8, 38000000.00, 2),
(1, 8, 15000000.00, 1),
(7, 9, 14000000.00, 3),
(8, 9, 20000000.00, 4),
(9, 10, 32000000.00, 1),
(10, 10, 50000000.00, 2),
(4, 11, 48000000.00, 3),
(2, 11, 40000000.00, 1),
(3, 12, 38000000.00, 2),
(4, 12, 1500000000, 4),
(5, 13, 14000000.00, 1),
(6, 13, 2000000000, 3),
(7, 14, 3200000000, 2),
(8, 14, 5000000000, 1),
(9, 15, 4800000000, 4),
(15, 15, 40000000.00, 2);

/*THÊM DỮ LIỆU INVOICE*/
INSERT INTO [dbo].[INVOICE] ([ID_STATUS], [ID_ORDER], [CREATE_AT], [UPDATE_AT], [TOTAL_AMOUNT])
VALUES
(1, 1, '2024-06-14T09:09:09', '2024-06-14T09:09:09', 10000000.00),
(1, 2, '2024-06-02T00:00:00', '2024-06-02T00:00:00', 20000000.00),
(2, 3, '2024-06-03T00:00:00', '2024-06-04T00:00:00', 15000000.00),
(2, 4, '2024-06-04T00:00:00', '2024-06-05T00:00:00', 18000000.00),
(1, 5, '2024-06-05T00:00:00', '2024-06-06T00:00:00', 25000000.00),
(3, 6, '2024-06-06T00:00:00', '2024-06-06T00:00:00', 22000000.00),
(1, 7, '2024-06-07T00:00:00', '2024-06-08T00:00:00', 30000000.00),
(1, 8, '2024-06-08T00:00:00', '2024-06-09T00:00:00', 35000000.00),
(2, 9, '2024-06-09T00:00:00', '2024-06-10T00:00:00', 4000000.00),
(1, 10, '2024-06-10T00:00:00', '2024-06-11T00:00:00', 5000000.00),
(3, 11, '2024-06-11T00:00:00', '2024-06-12T00:00:00', 45000000.00),
(3, 12, '2024-06-12T00:00:00', '2024-06-13T00:00:00', 38000000.00),
(1, 13, '2024-06-13T00:00:00', '2024-06-14T00:00:00', 27000000.00),
(2,14, '2024-06-14T21:09:09', '2024-06-14T21:09:09', 20000000.00),
(1, 15, '2024-06-13T00:00:00', '2024-06-14T00:00:00', 27000000.00),
(2,16, '2024-06-14T21:09:09', '2024-06-14T21:09:09', 20000000.00)
;

/*THỦ TỤC*/
/*THỐNG KÊ BÁN CHẠY*/
	CREATE PROCEDURE GetTop7Phones
	AS
	BEGIN
		SELECT TOP 7 
			phone.ID, 
			(select top 1 [IMAGE] from [IMAGE] where ID_PHONE = phone.id) as img,
			phone.[NAME], 
			brand.[NAME] AS BrandName, 
			phone.SCREEN_SIZE, 
			STORAGE.GB AS StorageGB, 
			phone.BATTERY_CAPACITY, 
			screen_resolution.[NAME] AS ScreenResolution, 
			phone.REFRESH_RATE,
			SUM(ORDER_ITEM.QUANTITY) as totalQuantity
		FROM 
			ORDER_ITEM
		LEFT JOIN 
			variant ON order_item.ID_VARIANT = variant.ID
		LEFT JOIN 
			[ORDER] ON order_item.ID_ORDER = [ORDER].ID
		INNER JOIN 
			phone ON variant.ID_PHONE = phone.ID
		LEFT JOIN 
			brand ON phone.ID_BRAND = brand.ID
		LEFT JOIN 
			screen_resolution ON phone.ID_SCREEN = screen_resolution.ID
		LEFT JOIN 
			STORAGE ON VARIANT.ID_STORAGE = STORAGE.ID
		WHERE 
			[ORDER].ID_STATUS = 1
		GROUP BY 
			 phone.ID,  phone.[NAME], brand.[NAME], phone.SCREEN_SIZE,  STORAGE.GB ,  phone.BATTERY_CAPACITY,  screen_resolution.[NAME], phone.REFRESH_RATE
		ORDER BY 
			SUM(ORDER_ITEM.QUANTITY) DESC;
	END

SELECT * FROM [USER]
SELECT * FROM VARIANT
SELECT * FROM PHONE
SELECT * FROM BRAND
SELECT * FROM DISCOUNT_CODE
SELECT * FROM INVOICE
SELECT * FROM CART
SELECT * FROM [ORDER]
SELECT * FROM STATUS_ORDER
SELECT * FROM STATUS_INVOICE
select * from [ADDRESS]