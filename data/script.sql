USE [PickleBallManagement]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 11/9/2024 8:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](200) NOT NULL,
	[password] [varchar](200) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[status] [bit] NOT NULL,
	[role] [varchar](200) NOT NULL,
	[online] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 11/9/2024 8:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[id] [int] NOT NULL,
	[full_name] [varchar](200) NOT NULL,
	[email] [varchar](200) NOT NULL,
	[phone_number] [varchar](200) NOT NULL,
	[address] [varchar](200) NOT NULL,
	[username] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bag]    Script Date: 11/9/2024 8:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bag](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customerid] [int] NULL,
	[productid] [int] NULL,
	[amount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[base]    Script Date: 11/9/2024 8:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[base](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart]    Script Date: 11/9/2024 8:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart](
	[amount] [int] NOT NULL,
	[item_id] [int] NULL,
	[customer_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category_item]    Script Date: 11/9/2024 8:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category_item](
	[item_category_id] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
	[status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[item_category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 11/9/2024 8:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [varchar](200) NOT NULL,
	[email] [varchar](200) NOT NULL,
	[phone_number] [varchar](200) NOT NULL,
	[address] [varchar](200) NOT NULL,
	[username] [varchar](200) NOT NULL,
	[point] [int] NULL,
	[nickname] [nvarchar](20) NULL,
	[rankid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedbackbase]    Script Date: 11/9/2024 8:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedbackbase](
	[id] [int] NOT NULL,
	[comment] [text] NULL,
	[rating] [int] NULL,
	[date] [datetime] NULL,
	[customerid] [int] NULL,
	[baseid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedbackfield]    Script Date: 11/9/2024 8:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedbackfield](
	[id] [int] NOT NULL,
	[comment] [text] NULL,
	[rating] [int] NULL,
	[date] [datetime] NULL,
	[customerid] [int] NULL,
	[fieldid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[field]    Script Date: 11/9/2024 8:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[field](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[status] [varchar](200) NOT NULL,
	[cost] [int] NOT NULL,
	[viponly] [bit] NOT NULL,
	[baseid] [int] NULL,
	[image] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[friend]    Script Date: 11/9/2024 8:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[friend](
	[customerid] [int] NOT NULL,
	[friendid] [int] NOT NULL,
 CONSTRAINT [friendpk] PRIMARY KEY CLUSTERED 
(
	[customerid] ASC,
	[friendid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[friendrequest]    Script Date: 11/9/2024 8:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[friendrequest](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[senderid] [int] NOT NULL,
	[receiverid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[historypayment]    Script Date: 11/9/2024 8:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historypayment](
	[customerid] [int] NULL,
	[date] [date] NULL,
	[amount] [decimal](11, 2) NOT NULL,
	[type] [varchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[historyrent]    Script Date: 11/9/2024 8:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historyrent](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bookeddate] [datetime] NOT NULL,
	[customerid] [int] NOT NULL,
	[voucher] [varchar](200) NULL,
	[fieldid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[item]    Script Date: 11/9/2024 8:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[item](
	[item_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](255) NULL,
	[image] [nvarchar](255) NULL,
	[quantity] [int] NOT NULL,
	[cost] [float] NOT NULL,
	[status] [bit] NOT NULL,
	[item_category_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[matchplayed]    Script Date: 11/9/2024 8:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[matchplayed](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [datetime] NOT NULL,
	[resultwin] [int] NOT NULL,
	[resultlose] [int] NOT NULL,
	[betpoint] [int] NOT NULL,
	[fieldid] [int] NOT NULL,
	[player1] [int] NOT NULL,
	[player2] [int] NOT NULL,
	[winner] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[membership]    Script Date: 11/9/2024 8:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[membership](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[membershipdetail]    Script Date: 11/9/2024 8:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[membershipdetail](
	[membershipid] [int] NOT NULL,
	[customerid] [int] NOT NULL,
	[expiredate] [datetime] NULL,
	[status] [varchar](200) NULL,
 CONSTRAINT [membershipdetailpk] PRIMARY KEY CLUSTERED 
(
	[membershipid] ASC,
	[customerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 11/9/2024 8:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[content] [ntext] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[image] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notifications]    Script Date: 11/9/2024 8:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notifications](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customerid] [int] NULL,
	[message] [nvarchar](255) NULL,
	[is_read] [bit] NULL,
	[created_at] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/9/2024 8:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[total_price] [float] NOT NULL,
	[status] [bit] NOT NULL,
	[voucher_code] [varchar](200) NULL,
	[created_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/9/2024 8:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[order_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 11/9/2024 8:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customerid] [int] NULL,
	[total] [int] NULL,
	[createdate] [date] NULL,
	[ispayment] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ordersdetail]    Script Date: 11/9/2024 8:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ordersdetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderid] [int] NULL,
	[productid] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 11/9/2024 8:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NULL,
	[image] [nvarchar](255) NULL,
	[cost] [int] NULL,
	[memberid] [int] NULL,
	[amount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rank]    Script Date: 11/9/2024 8:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rank](
	[rankid] [int] IDENTITY(1,1) NOT NULL,
	[rank_name] [varchar](20) NULL,
	[min_point] [int] NULL,
	[img] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[rankid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RankHistory]    Script Date: 11/9/2024 8:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RankHistory](
	[history_id] [int] NOT NULL,
	[customer_id] [int] NULL,
	[rank_id] [int] NULL,
	[change_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[history_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rentfield]    Script Date: 11/9/2024 8:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rentfield](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bookeddate] [datetime] NOT NULL,
	[customerid] [int] NOT NULL,
	[voucher] [varchar](200) NULL,
	[fieldid] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staff]    Script Date: 11/9/2024 8:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](50) NULL,
	[email] [varchar](200) NULL,
	[phonenumber] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[username] [varchar](200) NOT NULL,
	[baseid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[voucher]    Script Date: 11/9/2024 8:05:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[voucher](
	[code] [varchar](200) NOT NULL,
	[expiredate] [datetime] NOT NULL,
	[usecondition] [varchar](200) NULL,
	[quantity] [int] NOT NULL,
	[percent] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password], [created_date], [status], [role], [online]) VALUES (N'3213213', N'concac', CAST(N'2024-10-23T00:00:00.000' AS DateTime), 1, N'customer', 0)
GO
INSERT [dbo].[Account] ([username], [password], [created_date], [status], [role], [online]) VALUES (N'admin', N'123456', CAST(N'2024-10-04T00:00:00.000' AS DateTime), 1, N'admin', 0)
GO
INSERT [dbo].[Account] ([username], [password], [created_date], [status], [role], [online]) VALUES (N'concu', N'123', CAST(N'2024-07-23T00:00:00.000' AS DateTime), 1, N'customer', 1)
GO
INSERT [dbo].[Account] ([username], [password], [created_date], [status], [role], [online]) VALUES (N'customer', N'uA@1YrLGKV', CAST(N'2024-11-06T00:00:00.000' AS DateTime), 1, N'customer', 0)
GO
INSERT [dbo].[Account] ([username], [password], [created_date], [status], [role], [online]) VALUES (N'customer123', N'123456', CAST(N'2024-11-06T00:00:00.000' AS DateTime), 1, N'customer', 0)
GO
INSERT [dbo].[Account] ([username], [password], [created_date], [status], [role], [online]) VALUES (N'customerr', N'123456', CAST(N'2024-11-06T00:00:00.000' AS DateTime), 1, N'customer', 0)
GO
INSERT [dbo].[Account] ([username], [password], [created_date], [status], [role], [online]) VALUES (N'dat020304', N'kien0102', CAST(N'2024-05-23T00:00:00.000' AS DateTime), 0, N'customer', 0)
GO
INSERT [dbo].[Account] ([username], [password], [created_date], [status], [role], [online]) VALUES (N'kien00000', N'kien0102', CAST(N'2024-10-23T00:00:00.000' AS DateTime), 0, N'customer', 0)
GO
INSERT [dbo].[Account] ([username], [password], [created_date], [status], [role], [online]) VALUES (N'kien022225555', N'kien0102', CAST(N'2024-08-23T00:00:00.000' AS DateTime), 1, N'customer', 0)
GO
INSERT [dbo].[Account] ([username], [password], [created_date], [status], [role], [online]) VALUES (N'kien1234', N'kien632004', CAST(N'2024-10-18T00:00:00.000' AS DateTime), 0, N'customer', 0)
GO
INSERT [dbo].[Account] ([username], [password], [created_date], [status], [role], [online]) VALUES (N'kien2004xxxx', N'RLd8KRwcll', CAST(N'2024-11-02T00:00:00.000' AS DateTime), 1, N'Employee', 0)
GO
INSERT [dbo].[Account] ([username], [password], [created_date], [status], [role], [online]) VALUES (N'kien6320', N'202cb962ac59075b964b07152d234b70', CAST(N'2024-09-04T00:00:00.000' AS DateTime), 0, N'customer', 0)
GO
INSERT [dbo].[Account] ([username], [password], [created_date], [status], [role], [online]) VALUES (N'kien632004', N')V=yFT3f#2', CAST(N'2024-11-02T00:00:00.000' AS DateTime), 1, N'Employee', 0)
GO
INSERT [dbo].[Account] ([username], [password], [created_date], [status], [role], [online]) VALUES (N'kienadmin', N'e10adc3949ba59abbe56e057f20f883e', CAST(N'2024-06-04T00:00:00.000' AS DateTime), 0, N'customer', 0)
GO
INSERT [dbo].[Account] ([username], [password], [created_date], [status], [role], [online]) VALUES (N'kiendaukhac0123', N'aEzYcZplbw', CAST(N'2024-11-02T00:00:00.000' AS DateTime), 0, N'Employee', 0)
GO
INSERT [dbo].[Account] ([username], [password], [created_date], [status], [role], [online]) VALUES (N'kienhohohoho', N'123', CAST(N'2024-07-27T00:00:00.000' AS DateTime), 0, N'customer', 0)
GO
INSERT [dbo].[Account] ([username], [password], [created_date], [status], [role], [online]) VALUES (N'kiennthe181232@fpt.edu.vn', N'8b264e6f9ff3ec55675667991f886198', CAST(N'2024-11-05T00:00:00.000' AS DateTime), 1, N'customer', 0)
GO
INSERT [dbo].[Account] ([username], [password], [created_date], [status], [role], [online]) VALUES (N'kientrung2004x', N'kien632004', CAST(N'2024-09-02T00:00:00.000' AS DateTime), 1, N'Employee', 0)
GO
INSERT [dbo].[Account] ([username], [password], [created_date], [status], [role], [online]) VALUES (N'nam10102', N'nam2004', CAST(N'2024-10-30T00:00:00.000' AS DateTime), 1, N'customer', 0)
GO
INSERT [dbo].[Account] ([username], [password], [created_date], [status], [role], [online]) VALUES (N'ninh2222444', N'kien0102', CAST(N'2024-10-23T00:00:00.000' AS DateTime), 1, N'customer', 0)
GO
INSERT [dbo].[Account] ([username], [password], [created_date], [status], [role], [online]) VALUES (N'nopromjsed9998@gmail.com', N'61dc1071c54019099b7e162597adb9d0', CAST(N'2024-11-06T00:00:00.000' AS DateTime), 1, N'customer', 0)
GO
INSERT [dbo].[Account] ([username], [password], [created_date], [status], [role], [online]) VALUES (N'test', N'123456', CAST(N'2024-11-06T00:00:00.000' AS DateTime), 1, N'customer', 0)
GO
INSERT [dbo].[Account] ([username], [password], [created_date], [status], [role], [online]) VALUES (N'thangdxhe', N'SOpNmsMNTP', CAST(N'2024-09-04T00:00:00.000' AS DateTime), 0, N'Employee', 0)
GO
INSERT [dbo].[Account] ([username], [password], [created_date], [status], [role], [online]) VALUES (N'thanglxt', N'pwXMexVpz9', CAST(N'2024-11-04T00:00:00.000' AS DateTime), 0, N'Employee', 0)
GO
INSERT [dbo].[Account] ([username], [password], [created_date], [status], [role], [online]) VALUES (N'tuanha', N'123456', CAST(N'2024-09-05T00:00:00.000' AS DateTime), 1, N'customer', 0)
GO
INSERT [dbo].[Account] ([username], [password], [created_date], [status], [role], [online]) VALUES (N'tuanha0504', N'e10adc3949ba59abbe56e057f20f883e', CAST(N'2024-11-05T00:00:00.000' AS DateTime), 1, N'customer', 0)
GO
INSERT [dbo].[Account] ([username], [password], [created_date], [status], [role], [online]) VALUES (N'tuanha1', N'e10adc3949ba59abbe56e057f20f883e', CAST(N'2024-11-05T00:00:00.000' AS DateTime), 1, N'customer', 0)
GO
INSERT [dbo].[Account] ([username], [password], [created_date], [status], [role], [online]) VALUES (N'tuanha12345', N'123456', CAST(N'2024-11-05T00:00:00.000' AS DateTime), 1, N'customer', 0)
GO
SET IDENTITY_INSERT [dbo].[base] ON 
GO
INSERT [dbo].[base] ([id], [address]) VALUES (3, N'HA Noi')
GO
INSERT [dbo].[base] ([id], [address]) VALUES (4, N'Hoa lac')
GO
INSERT [dbo].[base] ([id], [address]) VALUES (5, N'Dan Phuong')
GO
INSERT [dbo].[base] ([id], [address]) VALUES (6, N'Son Tay')
GO
SET IDENTITY_INSERT [dbo].[base] OFF
GO
SET IDENTITY_INSERT [dbo].[category_item] ON 
GO
INSERT [dbo].[category_item] ([item_category_id], [type], [status]) VALUES (15, N'Vợt Pickleball', 1)
GO
INSERT [dbo].[category_item] ([item_category_id], [type], [status]) VALUES (16, N'Áo Pickleball', 1)
GO
INSERT [dbo].[category_item] ([item_category_id], [type], [status]) VALUES (17, N'Quần Pickleball', 1)
GO
INSERT [dbo].[category_item] ([item_category_id], [type], [status]) VALUES (18, N'Giày Pickleball', 1)
GO
INSERT [dbo].[category_item] ([item_category_id], [type], [status]) VALUES (19, N'Bóng Pickleball', 1)
GO
INSERT [dbo].[category_item] ([item_category_id], [type], [status]) VALUES (20, N'Balo Pickleball', 1)
GO
INSERT [dbo].[category_item] ([item_category_id], [type], [status]) VALUES (21, N'Váy Pickleball', 1)
GO
INSERT [dbo].[category_item] ([item_category_id], [type], [status]) VALUES (22, N'Phụ Kiện Pickleball', 1)
GO
SET IDENTITY_INSERT [dbo].[category_item] OFF
GO
SET IDENTITY_INSERT [dbo].[customer] ON 
GO
INSERT [dbo].[customer] ([id], [full_name], [email], [phone_number], [address], [username], [point], [nickname], [rankid]) VALUES (1, N'kien trung', N'kien632k4@gmail.com', N'0989423251', N'Dan Phuong', N'admin', 0, NULL, 2)
GO
INSERT [dbo].[customer] ([id], [full_name], [email], [phone_number], [address], [username], [point], [nickname], [rankid]) VALUES (2, N'kien kien', N'kientrung@gmail.com', N'0989423251', N'Dan Phuong', N'kienadmin', 0, NULL, 2)
GO
INSERT [dbo].[customer] ([id], [full_name], [email], [phone_number], [address], [username], [point], [nickname], [rankid]) VALUES (3, N'kien dep zaiiiii', N'kientrung22@gmail.com', N'0919427251', N'Dan Phuong', N'kien6320', 0, NULL, 2)
GO
INSERT [dbo].[customer] ([id], [full_name], [email], [phone_number], [address], [username], [point], [nickname], [rankid]) VALUES (4, N'nhu trung kien', N'ki@gmail.com', N'0989423251', N'con cac', N'kien1234', 0, NULL, 1)
GO
INSERT [dbo].[customer] ([id], [full_name], [email], [phone_number], [address], [username], [point], [nickname], [rankid]) VALUES (5, N'Trung Kien', N'conca@gmail.com', N'0989423251', N'con cac', N'3213213', 0, NULL, 2)
GO
INSERT [dbo].[customer] ([id], [full_name], [email], [phone_number], [address], [username], [point], [nickname], [rankid]) VALUES (6, N'Kiennn', N'kientrung22@gmail.com', N'0989423432', N'caccacca', N'concu', 46, N'kien1234', 2)
GO
INSERT [dbo].[customer] ([id], [full_name], [email], [phone_number], [address], [username], [point], [nickname], [rankid]) VALUES (8, N'Kien6320', N'kientru23212222@gmail.com', N'0989423431', N'321321321dsa', N'kien00000', 0, NULL, 2)
GO
INSERT [dbo].[customer] ([id], [full_name], [email], [phone_number], [address], [username], [point], [nickname], [rankid]) VALUES (9, N'Nguyen Van A', N'kientru1522@gmail.com', N'0989333431', N'Dan Phuong', N'kien022225555', 0, NULL, 1)
GO
INSERT [dbo].[customer] ([id], [full_name], [email], [phone_number], [address], [username], [point], [nickname], [rankid]) VALUES (10, N'Nguyen Van B', N'gavailon1522@gmail.com', N'0789333431', N'chim cu gay', N'ninh2222444', 0, NULL, 3)
GO
INSERT [dbo].[customer] ([id], [full_name], [email], [phone_number], [address], [username], [point], [nickname], [rankid]) VALUES (11, N'nguyen tien nam', N'nam1378@gmail.com', N'0294333431', N'chim cu gay', N'dat020304', 0, NULL, 4)
GO
INSERT [dbo].[customer] ([id], [full_name], [email], [phone_number], [address], [username], [point], [nickname], [rankid]) VALUES (13, N'bum bum', N'kiendepzaihoho@gmail.com', N'0989423791', N'Dan phuongw, ha noi, viet nam', N'kienhohohoho', 0, NULL, 2)
GO
INSERT [dbo].[customer] ([id], [full_name], [email], [phone_number], [address], [username], [point], [nickname], [rankid]) VALUES (14, N'Nguyen Nhu Nam', N'nhunam@gmail.com', N'0917385201', N'', N'nam10102', 6184, N'nam2004', 3)
GO
INSERT [dbo].[customer] ([id], [full_name], [email], [phone_number], [address], [username], [point], [nickname], [rankid]) VALUES (15, N'Duong Xuan Thang', N'kientrung@gmail.com', N'0989423251', N'dsadsa', N'tuanha', 500, N'trungkien123', NULL)
GO
INSERT [dbo].[customer] ([id], [full_name], [email], [phone_number], [address], [username], [point], [nickname], [rankid]) VALUES (19, N'Duong Xuan Thang', N'thang0912527403@gmail.com', N'0989423791', N'Dan phuongw, ha noi, viet nam', N'tuanha12345', 0, N'trungkien1234567', NULL)
GO
INSERT [dbo].[customer] ([id], [full_name], [email], [phone_number], [address], [username], [point], [nickname], [rankid]) VALUES (20, N'dâsdsáda', N'kientrung@gmail.com', N'0989423251', N'dsadsa', N'tuanha0504', 0, N'đasadas', NULL)
GO
INSERT [dbo].[customer] ([id], [full_name], [email], [phone_number], [address], [username], [point], [nickname], [rankid]) VALUES (21, N'dsadssdasa', N'thang0912527403@gmail.com', N'0989423791', N'Dan phuongw, ha noi, viet nam', N'tuanha1', 0, N'dsasdsasda', NULL)
GO
INSERT [dbo].[customer] ([id], [full_name], [email], [phone_number], [address], [username], [point], [nickname], [rankid]) VALUES (23, N'Nhu Trung Kien (K18 HL)', N'kiennthe181232@fpt.edu.vn', N'***', N'***', N'kiennthe181232@fpt.edu.vn', 1000, N'trung kien', NULL)
GO
INSERT [dbo].[customer] ([id], [full_name], [email], [phone_number], [address], [username], [point], [nickname], [rankid]) VALUES (24, N'customer', N'haanhtuan0504@gmail.com', N'0989412123', N'Dan phuongw, ha noi, viet nam', N'customer', 1500, N'taikhoancustomer', NULL)
GO
INSERT [dbo].[customer] ([id], [full_name], [email], [phone_number], [address], [username], [point], [nickname], [rankid]) VALUES (25, N'customer', N'haanhtuan0504@gmail.com', N'0989412123', N'Dan phuongw, ha noi, viet nam', N'customer123', 1000, N'taikhoancustomer123', NULL)
GO
INSERT [dbo].[customer] ([id], [full_name], [email], [phone_number], [address], [username], [point], [nickname], [rankid]) VALUES (26, N'Trung Kien Dep Zai', N'kien632k4@gmail.com', N'0989412123', N'Dan phuongw, ha noi, viet nam', N'customerr', 1085, N'custommm', NULL)
GO
INSERT [dbo].[customer] ([id], [full_name], [email], [phone_number], [address], [username], [point], [nickname], [rankid]) VALUES (28, N'Hà Tu?n', N'nopromjsed9998@gmail.com', N'***', N'***', N'nopromjsed9998@gmail.com', 1660, N'Hà Tuấn', NULL)
GO
INSERT [dbo].[customer] ([id], [full_name], [email], [phone_number], [address], [username], [point], [nickname], [rankid]) VALUES (29, N'Nguyen Van Test', N'nguyenvantest@gmail.com', N'0989423281', N'test, pho test, test test', N'test', 682, N'testtest', NULL)
GO
SET IDENTITY_INSERT [dbo].[customer] OFF
GO
SET IDENTITY_INSERT [dbo].[field] ON 
GO
INSERT [dbo].[field] ([id], [status], [cost], [viponly], [baseid], [image]) VALUES (1, N'online', 200, 0, 4, N'https://cdn.shopvnb.com/uploads/images/tin_tuc/cac-loai-san-pickleball-1-1717985159.webp')
GO
INSERT [dbo].[field] ([id], [status], [cost], [viponly], [baseid], [image]) VALUES (2, N'online', 200, 0, 4, N'https://file.hstatic.net/1000341630/file/1_1799610e954e47d8a0aa43d0a70fe4fa.jpg')
GO
INSERT [dbo].[field] ([id], [status], [cost], [viponly], [baseid], [image]) VALUES (3, N'online', 100, 0, 5, N'https://shopvnb.com/uploads/images/tin_tuc/kich-thuoc-san-pickleball-3-1717631144.webp')
GO
INSERT [dbo].[field] ([id], [status], [cost], [viponly], [baseid], [image]) VALUES (4, N'online', 159, 0, 3, N'https://phuqui.vn/uploads/supply/2023/08/29/13_copy_0.jpg')
GO
INSERT [dbo].[field] ([id], [status], [cost], [viponly], [baseid], [image]) VALUES (5, N'online', 299, 0, 3, N'https://hoathinhphatgroup.com/wp-content/uploads/2024/08/thoi-gian-thi-cong-san-pickleball-3.jpg')
GO
INSERT [dbo].[field] ([id], [status], [cost], [viponly], [baseid], [image]) VALUES (8, N'maintenance', 125, 1, 3, N'images/c5.jpg')
GO
INSERT [dbo].[field] ([id], [status], [cost], [viponly], [baseid], [image]) VALUES (11, N'online', 225, 1, 3, N'images/c6.jpg')
GO
INSERT [dbo].[field] ([id], [status], [cost], [viponly], [baseid], [image]) VALUES (17, N'offline', 125, 0, 6, N'images/c5.jpg')
GO
SET IDENTITY_INSERT [dbo].[field] OFF
GO
INSERT [dbo].[friend] ([customerid], [friendid]) VALUES (6, 15)
GO
INSERT [dbo].[friend] ([customerid], [friendid]) VALUES (15, 6)
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (6, CAST(N'2024-11-01' AS Date), CAST(900000.00 AS Decimal(11, 2)), N'point')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (6, CAST(N'2024-11-01' AS Date), CAST(1000000.00 AS Decimal(11, 2)), N'point')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (6, CAST(N'2024-11-01' AS Date), CAST(1000000.00 AS Decimal(11, 2)), N'point')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (6, CAST(N'2024-11-01' AS Date), CAST(1000000.00 AS Decimal(11, 2)), N'point')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (6, CAST(N'2024-11-04' AS Date), CAST(900000.00 AS Decimal(11, 2)), N'point')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (14, CAST(N'2024-11-05' AS Date), CAST(1000000.00 AS Decimal(11, 2)), N'point')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (15, CAST(N'2024-11-05' AS Date), CAST(500000.00 AS Decimal(11, 2)), N'point')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (15, CAST(N'2024-11-05' AS Date), CAST(540000.00 AS Decimal(11, 2)), N'membership')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (15, CAST(N'2024-11-05' AS Date), CAST(99000.00 AS Decimal(11, 2)), N'membership')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (15, CAST(N'2024-11-05' AS Date), CAST(540000.00 AS Decimal(11, 2)), N'membership')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (23, CAST(N'2024-11-05' AS Date), CAST(1000000.00 AS Decimal(11, 2)), N'point')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (23, CAST(N'2024-11-05' AS Date), CAST(1000000.00 AS Decimal(11, 2)), N'membership')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (6, CAST(N'2024-11-06' AS Date), CAST(500000.00 AS Decimal(11, 2)), N'point')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (6, CAST(N'2024-11-06' AS Date), CAST(500000.00 AS Decimal(11, 2)), N'membership')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (6, CAST(N'2024-11-06' AS Date), CAST(99000.00 AS Decimal(11, 2)), N'membership')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (6, CAST(N'2024-11-06' AS Date), CAST(1000000.00 AS Decimal(11, 2)), N'point')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (24, CAST(N'2024-11-06' AS Date), CAST(1000000.00 AS Decimal(11, 2)), N'point')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (24, CAST(N'2024-11-06' AS Date), CAST(1000000.00 AS Decimal(11, 2)), N'membership')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (25, CAST(N'2024-11-06' AS Date), CAST(540000.00 AS Decimal(11, 2)), N'membership')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (25, CAST(N'2024-11-06' AS Date), CAST(1000000.00 AS Decimal(11, 2)), N'point')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (26, CAST(N'2024-11-06' AS Date), CAST(99000.00 AS Decimal(11, 2)), N'membership')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (26, CAST(N'2024-11-06' AS Date), CAST(99000.00 AS Decimal(11, 2)), N'membership')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (26, CAST(N'2024-11-06' AS Date), CAST(540000.00 AS Decimal(11, 2)), N'membership')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (26, CAST(N'2024-11-06' AS Date), CAST(1000000.00 AS Decimal(11, 2)), N'point')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (26, CAST(N'2024-11-06' AS Date), CAST(900000.00 AS Decimal(11, 2)), N'membership')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (28, CAST(N'2024-11-07' AS Date), CAST(1000000.00 AS Decimal(11, 2)), N'point')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (15, CAST(N'2024-11-05' AS Date), CAST(540000.00 AS Decimal(11, 2)), N'membership')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (26, CAST(N'2024-11-06' AS Date), CAST(1000000.00 AS Decimal(11, 2)), N'point')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (28, CAST(N'2024-11-06' AS Date), CAST(1000000.00 AS Decimal(11, 2)), N'point')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (6, CAST(N'2024-11-06' AS Date), CAST(1000000.00 AS Decimal(11, 2)), N'membership')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (6, CAST(N'2024-11-06' AS Date), CAST(1000000.00 AS Decimal(11, 2)), N'point')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (24, CAST(N'2024-11-06' AS Date), CAST(500000.00 AS Decimal(11, 2)), N'point')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (24, CAST(N'2024-11-06' AS Date), CAST(500000.00 AS Decimal(11, 2)), N'membership')
GO
INSERT [dbo].[historypayment] ([customerid], [date], [amount], [type]) VALUES (28, CAST(N'2024-11-06' AS Date), CAST(540000.00 AS Decimal(11, 2)), N'membership')
GO
SET IDENTITY_INSERT [dbo].[historyrent] ON 
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (1, CAST(N'2024-11-05T09:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (2, CAST(N'2024-11-01T08:00:00.000' AS DateTime), 6, NULL, 4)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (3, CAST(N'2024-11-02T14:00:00.000' AS DateTime), 6, NULL, 4)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (4, CAST(N'2024-11-01T17:00:00.000' AS DateTime), 6, NULL, 4)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (5, CAST(N'2024-11-01T19:00:00.000' AS DateTime), 6, NULL, 4)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (6, CAST(N'2024-11-04T09:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (7, CAST(N'2024-11-04T12:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (8, CAST(N'2024-11-05T15:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (9, CAST(N'2024-11-04T16:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (10, CAST(N'2024-11-05T19:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (11, CAST(N'2024-11-04T20:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (12, CAST(N'2024-11-05T07:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (13, CAST(N'2024-11-05T09:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (14, CAST(N'2024-11-04T10:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (15, CAST(N'2024-11-05T11:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (16, CAST(N'2024-11-04T12:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (17, CAST(N'2024-11-05T13:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (18, CAST(N'2024-11-04T14:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (19, CAST(N'2024-11-05T15:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (20, CAST(N'2024-11-04T16:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (21, CAST(N'2024-11-05T17:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (22, CAST(N'2024-11-04T18:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (23, CAST(N'2024-11-05T19:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (24, CAST(N'2024-11-04T20:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (25, CAST(N'2024-11-05T21:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (26, CAST(N'2024-11-04T22:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (27, CAST(N'2024-11-05T07:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (28, CAST(N'2024-11-05T09:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (29, CAST(N'2024-11-04T10:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (30, CAST(N'2024-11-05T11:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (31, CAST(N'2024-11-04T12:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (32, CAST(N'2024-11-05T13:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (33, CAST(N'2024-11-04T14:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (34, CAST(N'2024-11-05T15:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (35, CAST(N'2024-11-04T16:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (36, CAST(N'2024-11-05T17:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (37, CAST(N'2024-11-04T18:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (38, CAST(N'2024-11-05T19:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (39, CAST(N'2024-11-04T20:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (40, CAST(N'2024-11-04T22:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (41, CAST(N'2024-11-06T08:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (42, CAST(N'2024-11-06T08:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (43, CAST(N'2024-11-06T08:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (44, CAST(N'2024-11-06T10:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (45, CAST(N'2024-11-06T10:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (46, CAST(N'2024-11-06T12:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (47, CAST(N'2024-11-06T12:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (48, CAST(N'2024-11-06T12:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (49, CAST(N'2024-11-06T14:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (50, CAST(N'2024-11-06T16:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (51, CAST(N'2024-11-06T14:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (52, CAST(N'2024-11-06T16:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (53, CAST(N'2024-11-06T18:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (54, CAST(N'2024-11-06T18:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (55, CAST(N'2024-11-06T19:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (56, CAST(N'2024-11-06T20:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (57, CAST(N'2024-11-06T20:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (58, CAST(N'2024-11-06T22:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (59, CAST(N'2024-11-06T22:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (60, CAST(N'2024-11-07T07:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (61, CAST(N'2024-11-07T09:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (62, CAST(N'2024-11-07T11:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (63, CAST(N'2024-11-07T07:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (64, CAST(N'2024-11-07T09:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (65, CAST(N'2024-11-07T11:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (66, CAST(N'2024-11-07T09:00:00.000' AS DateTime), 6, NULL, 1)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (67, CAST(N'2024-11-07T10:00:00.000' AS DateTime), 6, NULL, 1)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (68, CAST(N'2024-11-07T08:00:00.000' AS DateTime), 6, NULL, 4)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (69, CAST(N'2024-11-07T13:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (70, CAST(N'2024-11-07T13:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (71, CAST(N'2024-11-07T13:00:00.000' AS DateTime), 6, NULL, 1)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (72, CAST(N'2024-11-07T15:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (73, CAST(N'2024-11-07T15:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (74, CAST(N'2024-11-07T14:00:00.000' AS DateTime), 6, NULL, 4)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (75, CAST(N'2024-11-07T16:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (76, CAST(N'2024-11-07T17:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (77, CAST(N'2024-11-07T19:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (78, CAST(N'2024-11-07T17:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (79, CAST(N'2024-11-07T19:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[historyrent] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (80, CAST(N'2024-11-08T09:00:00.000' AS DateTime), 6, NULL, 4)
GO
SET IDENTITY_INSERT [dbo].[historyrent] OFF
GO
SET IDENTITY_INSERT [dbo].[item] ON 
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (77, N'Vợt Pickleball Arronax C1 16mm', N'- Vợt Pickleball Arronax C1 16mm có độ dày 16mm dành cho lối đánh phòng thủ, kiểm soát toàn diện. Trọng lượng 230 gr là trọng lượng không quá nặng, ít gây áp lực lên cổ tay, phù hợp với người chơi trình độ trung bình, có cổ tay ổn.', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/vot-pickleball-arronax-c1-16mm-xanh-bien_1729821659.webp', 9, 999.99, 1, 15)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (78, N'Vợt Pickleball Adidas Metalbone 13mm', N'- Vợt Pickleball Adidas Metalbone 13mm được thiết kế cho lối chơi kiểm soát toàn diện, phòng thủ phản tạt. Trọng lượng 226 gr / 8 oz là trọng lượng không quá nặng, phù hợp với người chơi có lực cổ tay tầm ổn.', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/vot-pickleball-adidas-metalbone-13mm_1729884366.webp', 15, 89.99, 1, 15)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (79, N'Vợt Pickleball Diadem Edge 18k Speed Pro', N'- Vợt Pickleball Diadem Edge 18k Speed Pro có độ dày 14mm, được thiết kế cho lỗi chơi cân bằng, hơi thiên công với những cú đánh đầy tốc độ và linh hoạt. Trọng lượng 8 oz là trọng lượng trung bình.', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/vot-pickleball-diadem-edge-18k-speed-pro-chinh-hang_1725065769.webp', 49, 19.99, 1, 15)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (80, N'Vợt Pickleball Franklin Signature 16mm', N'- Vợt Pickleball Franklin Signature 16mm được thiết kế có độ dày 16mm, mang đến lối chơi kiểm soát toàn diện, phòng thủ linh hoạt. Trọng lượng 230gr đòi hỏi người chơi có lực cổ tay tốt, trình độ trung bình trở lên.', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/vot-pickleball-franklin-signature-hong-chinh-hang_1730756538.webp', 20, 29.99, 1, 15)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (81, N'Vợt Pickleball Lining Hyperpower 20 Zircon', N'- Vợt Pickleball Lining Hyperpower 20 Zircon được thiết kế có độ dày 13,3 mm, mang lại lối chơi toàn diện, kiểm soát đường bóng 1 cách ổn định. Trọng lượng 220 gr, phù hợp với cả những người chơi có lực cổ tay chưa được tốt, đặc biệt là người mới.', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/vot-pickleball-lining-hyperpower-20-zircon-tim-acpv025-13_1730425779.webp', 9, 999.99, 1, 15)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (82, N'Áo Pickleball Kamito Promatch V3 KMAP241153', N'Áo Pickleball là một trong các dụng cụ thiết yếu trong Pickleball và cũng đóng một vai trò không thể thiếu trong mỗi trận đấu. Áo Pickleball không thoải mái có thể phá vỡ sự tập trung và ảnh hưởng đến chất lượng khi tham gia chơi Pickleball', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/giay-pickleball-diadem-court-burst-womens-trang-xanh-chinh-hang_1727642801.webp', 15, 89.99, 1, 16)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (83, N'Áo Pickleball Kamito Promatch V2 KMAP241152', N'Áo Pickleball là một trong các dụng cụ thiết yếu trong Pickleball và cũng đóng một vai trò không thể thiếu trong mỗi trận đấu. Áo Pickleball không thoải mái có thể phá vỡ sự tập trung và ảnh hưởng đến chất lượng khi tham gia chơi Pickleball', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/ao-pickleball-kamito-promatch-v2-kmap241152-be-chinh-hang_1724376882.webp', 49, 19.99, 1, 16)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (84, N'Áo Pickleball Joola kim cương nữ', N'Áo Pickleball là một trong các dụng cụ thiết yếu trong Pickleball và cũng đóng một vai trò không thể thiếu trong mỗi trận đấu. Áo Pickleball không thoải mái có thể phá vỡ sự tập trung và ảnh hưởng đến chất lượng khi tham gia chơi Pickleball', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/ao-pickleball-joola-kim-cuong-nu-tim-hong_1723490048.webp', 19, 29.99, 1, 16)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (85, N'Áo Pickleball Kamito 01 KMAP244923', N'Áo Pickleball là một trong các dụng cụ thiết yếu trong Pickleball và cũng đóng một vai trò không thể thiếu trong mỗi trận đấu. Áo Pickleball không thoải mái có thể phá vỡ sự tập trung và ảnh hưởng đến chất lượng khi tham gia chơi Pickleball', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/quan-pickleball-kamito-01-kmps242423-xanh-navy-chinh-hang_1730166455.webp', 10, 999.99, 1, 16)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (86, N'Áo Pickleball Kamito 01 KMAP244927', N'Áo Pickleball là một trong các dụng cụ thiết yếu trong Pickleball và cũng đóng một vai trò không thể thiếu trong mỗi trận đấu. Áo Pickleball không thoải mái có thể phá vỡ sự tập trung và ảnh hưởng đến chất lượng khi tham gia chơi Pickleball', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/ao-pickleball-kamito-01-kmap244927-xanh-la-chinh-hang_1730168437.webp', 15, 89.99, 1, 16)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (87, N'Quần Pickleball Kamito 01 KMPS242423', N'Quần Pickleball là một phần quan trọng của trang phục thi đấu và tập luyện, nó không chỉ trở thành sự lựa chọn ưa thích của các vận động viên chuyên nghiệp mà còn mang lại sự thoải mái và tự tin cho người mặc.', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/quan-pickleball-kamito-01-kmps242423-xanh-navy-chinh-hang_1730166455.webp', 50, 19.99, 1, 17)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (88, N'Quần Pickleball Kamito 01 KMPS242450', N'Quần Pickleball là một phần quan trọng của trang phục thi đấu và tập luyện, nó không chỉ trở thành sự lựa chọn ưa thích của các vận động viên chuyên nghiệp mà còn mang lại sự thoải mái và tự tin cho người mặc.', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/quan-pickleball-kamito-01-kmps242450-trang-chinh-hang_1730166203.webp', 20, 29.99, 1, 17)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (89, N'Quần Pickleball Kamito 01 KMPS242441', N'Quần Pickleball là một phần quan trọng của trang phục thi đấu và tập luyện, nó không chỉ trở thành sự lựa chọn ưa thích của các vận động viên chuyên nghiệp mà còn mang lại sự thoải mái và tự tin cho người mặc.', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/giay-pickleball-diadem-court-burst-men-trang-den-chinh-hang_1727642599.webp', 10, 999.99, 1, 17)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (90, N'Quần Pickleball Joola 01 - Đen xanh dương', N'Quần Pickleball là một phần quan trọng của trang phục thi đấu và tập luyện, nó không chỉ trở thành sự lựa chọn ưa thích của các vận động viên chuyên nghiệp mà còn mang lại sự thoải mái và tự tin cho người mặc.', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/quan-pickleball-joola-01-den-xanh-duong_1723491585.webp', 15, 89.99, 1, 17)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (91, N'Quần Pickleball Joola 01 - Đen trắng', N'Quần Pickleball là một phần quan trọng của trang phục thi đấu và tập luyện, nó không chỉ trở thành sự lựa chọn ưa thích của các vận động viên chuyên nghiệp mà còn mang lại sự thoải mái và tự tin cho người mặc.', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/quan-pickleball-joola-01-den-trang_1723491092.webp', 50, 19.99, 1, 17)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (92, N'Giày Pickleball Diadem Court Burst Womens', N'Giày Pickleball là một dụng cụ quan trọng để chơi Pickleball, nó giúp bảo vệ đôi chân của bạn an toàn hơn với những thời điểm di chuyển nhanh với cường độ cao.', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/giay-pickleball-diadem-court-burst-womens-trang-xanh-chinh-hang_1727642801.webp', 20, 29.99, 1, 18)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (93, N'Giày Pickleball Diadem Court Burst Men', N'A high-performance laptop.', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/giay-pickleball-diadem-court-burst-men-trang-den-chinh-hang_1727642599.webp', 10, 999.99, 1, 18)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (94, N'Giày Pickleball Joola', N'A comfortable office chair.', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/giay-pickleball-joola-blue-chinh-hang_1724007022.webp', 15, 89.99, 1, 18)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (95, N'Giày pickleball NikeCourt Air Zoom Vapor 11', N'A stylish cotton t-shirt.', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/giay-pickleball-nikecourt-air-zoom-vapor-11_1718166324.webp', 50, 19.99, 1, 18)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (96, N'Giày pickleball NikeCourt Air Zoom Vapor Pro 2', N'Learn programming with this comprehensive book.', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/giay-pickleball-nikecourt-air-zoom-vapor-pro-2_1718166250.webp', 20, 29.99, 1, 18)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (97, N'Bóng Pickleball Facolos F-Pro (Hộp 3 quả)', N'A high-performance laptop.', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/bong-pickleball-facolos-f-pro-performance-hop-3-qua_1728936015.webp', 10, 999.99, 1, 19)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (98, N'Bóng Pickleball Facolos F-Pro (Hộp 6 quả)', N'A comfortable office chair.', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/bong-pickleball-facolos-f-pro-performance-hop-6-qua_1728935828.webp', 15, 89.99, 1, 19)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (99, N'Bóng thi đấu Pickleball Gamicy (Hộp 3 quả)', N'A stylish cotton t-shirt.', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/bong-thi-dau-pickleball-gamicy-g-pro40l-hop-3-qua_1728682214.webp', 50, 19.99, 1, 19)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (100, N'Bóng Pickleball Gamicy PG26L (Hộp 6 quả)', N'Learn programming with this comprehensive book.', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/bong-pickleball-gamicy-pg26l-indoor-hop-6-qua_1728681710.webp', 20, 29.99, 1, 19)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (101, N'Bóng Pickleball Facolos(Quả)', N'A high-performance laptop.', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/bong-pickleball-facolos-f-pro-performance-qua_1728936258.webp', 10, 999.99, 1, 19)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (102, N'Balo Pickleball Joola Vision II Blue', N'A comfortable office chair.', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/balo-pickleball-joola-vision-ii-blue-chinh-hang_1728502852.webp', 15, 89.99, 1, 20)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (103, N'Balo Pickleball Joola Vision II Black', N'A stylish cotton t-shirt.', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/balo-pickleball-joola-vision-ii-black_1718657847.webp', 50, 19.99, 1, 20)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (104, N'Balo vợt Pickleball Arronax', N'Learn programming with this comprehensive book.', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/balo-vot-pickleball-arronax-den_1723161353.webp', 20, 29.99, 1, 20)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (105, N'Balo vợt Pickleball Arronax', N'A high-performance laptop.', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/balo-vot-pickleball-arronax-do-den_1722881760.webp', 10, 999.99, 1, 20)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (106, N'Balo Pickleball Joola Vision II Deluxe (Black)', N'A comfortable office chair.', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/balo-pickleball-joola-vision-ii-deluxe-black_1718658108.webp', 15, 89.99, 1, 20)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (107, N'Váy Pickleball Kamito 01 KMVS240150', N'A stylish cotton t-shirt.', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/vay-pickleball-kamito-01-kmvs240150-trang-chinh-hang_1730227094.webp', 50, 19.99, 1, 21)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (108, N'Váy Pickleball Kamito 01 KMVS240123', N'Learn programming with this comprehensive book.', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/vay-pickleball-kamito-01-kmvs240123-xanh-navy-chinh-hang_1730226293.webp', 20, 29.99, 1, 21)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (109, N'Quấn cán Pickleball Spikopoll QC1', N'A high-performance laptop.', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/quan-can-pickleball-spikopoll-qc1_1730312328.webp', 10, 999.99, 1, 22)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (110, N'Túi bọc đầu vợt Pickleball Selkirk', N'A comfortable office chair.', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/tui-boc-dau-vot-pickleball-selkirk_1729806853.webp', 15, 89.99, 1, 22)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (111, N'Miếng dán đầu vợt Pickleball Weierfu', N'A stylish cotton t-shirt.', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/mieng-dan-dau-vot-pickleball-weierfu_1729622137.webp', 50, 19.99, 1, 22)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (112, N'Túi đựng vợt Pickleball Taro TR02', N'Learn programming with this comprehensive book.', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/tui-dung-vot-pickleball-taro-tr02_1729104891.webp', 20, 29.99, 1, 22)
GO
INSERT [dbo].[item] ([item_id], [name], [description], [image], [quantity], [cost], [status], [item_category_id]) VALUES (113, N'Túi rút đựng vợt Pickleball Taro TR01', N'A high-performance laptop.', N'https://cdn.shopvnb.com/img/300x300/uploads/gallery/tui-dung-vot-pickleball-taro-tr01_1729104660.webp', 10, 999.99, 1, 22)
GO
SET IDENTITY_INSERT [dbo].[item] OFF
GO
SET IDENTITY_INSERT [dbo].[matchplayed] ON 
GO
INSERT [dbo].[matchplayed] ([id], [date], [resultwin], [resultlose], [betpoint], [fieldid], [player1], [player2], [winner]) VALUES (2, CAST(N'2024-10-25T00:00:00.000' AS DateTime), 21, 10, 1000, 1, 6, 15, 6)
GO
INSERT [dbo].[matchplayed] ([id], [date], [resultwin], [resultlose], [betpoint], [fieldid], [player1], [player2], [winner]) VALUES (3, CAST(N'2024-10-30T00:00:00.000' AS DateTime), 21, 19, 500, 1, 6, 15, 15)
GO
INSERT [dbo].[matchplayed] ([id], [date], [resultwin], [resultlose], [betpoint], [fieldid], [player1], [player2], [winner]) VALUES (4, CAST(N'2024-11-03T00:00:00.000' AS DateTime), 21, 15, 1000, 1, 6, 14, 6)
GO
SET IDENTITY_INSERT [dbo].[matchplayed] OFF
GO
SET IDENTITY_INSERT [dbo].[membership] ON 
GO
INSERT [dbo].[membership] ([id], [type]) VALUES (1, N'silver')
GO
INSERT [dbo].[membership] ([id], [type]) VALUES (2, N'gold')
GO
INSERT [dbo].[membership] ([id], [type]) VALUES (3, N'bronze')
GO
INSERT [dbo].[membership] ([id], [type]) VALUES (4, N'platinum')
GO
INSERT [dbo].[membership] ([id], [type]) VALUES (5, N'diamond')
GO
INSERT [dbo].[membership] ([id], [type]) VALUES (6, N'emerald')
GO
INSERT [dbo].[membership] ([id], [type]) VALUES (7, N'emperor')
GO
SET IDENTITY_INSERT [dbo].[membership] OFF
GO
INSERT [dbo].[membershipdetail] ([membershipid], [customerid], [expiredate], [status]) VALUES (2, 25, NULL, NULL)
GO
INSERT [dbo].[membershipdetail] ([membershipid], [customerid], [expiredate], [status]) VALUES (4, 6, CAST(N'2024-12-06T00:00:00.000' AS DateTime), N'active')
GO
INSERT [dbo].[membershipdetail] ([membershipid], [customerid], [expiredate], [status]) VALUES (4, 14, CAST(N'2025-10-10T00:00:00.000' AS DateTime), N'active')
GO
INSERT [dbo].[membershipdetail] ([membershipid], [customerid], [expiredate], [status]) VALUES (4, 15, CAST(N'2024-12-05T00:00:00.000' AS DateTime), N'inactive')
GO
INSERT [dbo].[membershipdetail] ([membershipid], [customerid], [expiredate], [status]) VALUES (4, 23, NULL, NULL)
GO
INSERT [dbo].[membershipdetail] ([membershipid], [customerid], [expiredate], [status]) VALUES (4, 24, NULL, NULL)
GO
INSERT [dbo].[membershipdetail] ([membershipid], [customerid], [expiredate], [status]) VALUES (4, 26, CAST(N'2025-11-06T00:00:00.000' AS DateTime), N'active')
GO
INSERT [dbo].[membershipdetail] ([membershipid], [customerid], [expiredate], [status]) VALUES (4, 28, CAST(N'2025-05-06T00:00:00.000' AS DateTime), N'active')
GO
SET IDENTITY_INSERT [dbo].[News] ON 
GO
INSERT [dbo].[News] ([id], [title], [content], [created_at], [updated_at], [image]) VALUES (1, N'kien', N'<p>ok ok ok</p>
', CAST(N'2024-10-27T10:33:36.027' AS DateTime), CAST(N'2024-10-27T10:56:53.247' AS DateTime), N'images/news/c1.jpg')
GO
INSERT [dbo].[News] ([id], [title], [content], [created_at], [updated_at], [image]) VALUES (2, N'Thông báo bảo trì hệ thống', N'<p>Bảo tr&igrave; s&acirc;n gi&uacute;p người thu&ecirc; c&oacute; trải nghiệm tốt hơn</p>
', CAST(N'2024-10-27T10:33:36.027' AS DateTime), CAST(N'2024-10-27T11:11:44.957' AS DateTime), N'images/news/c6.jpg')
GO
INSERT [dbo].[News] ([id], [title], [content], [created_at], [updated_at], [image]) VALUES (4, N'Kinh nghiệm cho người mới chơi Pickleball', N'<p><strong>Thu&ecirc; S&acirc;n Pickleball: Lợi &Iacute;ch v&agrave; Kinh Nghiệm Cho Người Mới</strong></p>

<p>Pickleball, một m&ocirc;n thể thao kết hợp giữa tennis, badminton v&agrave; ping-pong, đ&atilde; trở n&ecirc;n phổ biến tr&ecirc;n to&agrave;n thế giới v&agrave; ở Việt Nam. Đối với những ai y&ecirc;u th&iacute;ch sự vận động v&agrave; giao lưu x&atilde; hội, thu&ecirc; s&acirc;n pickleball c&oacute; thể l&agrave; một lựa chọn th&uacute; vị. Dưới đ&acirc;y l&agrave; những lợi &iacute;ch v&agrave; kinh nghiệm khi thu&ecirc; s&acirc;n pickleball m&agrave; bạn c&oacute; thể tham khảo.</p>

<h3>1. Lợi &Iacute;ch Khi Chơi Picklebal</h3>

<ul>
	<li><strong>R&egrave;n Luyện Sức Khỏe</strong>: Pickleball l&agrave; một hoạt động thể chất tuyệt vời gi&uacute;p tăng cường sức bền, linh hoạt v&agrave; phản xạ nhanh.</li>
	<li><strong>Ph&ugrave; Hợp Với Nhiều Độ Tuổi</strong>: Đ&acirc;y l&agrave; m&ocirc;n thể thao dễ học v&agrave; ph&ugrave; hợp với nhiều độ tuổi, từ thanh ni&ecirc;n đến người lớn tuổi.</li>
	<li><strong>Giao Lưu X&atilde; Hội</strong>: Pickleball thường chơi theo cặp, tạo cơ hội gặp gỡ bạn b&egrave; v&agrave; l&agrave;m quen với những người chơi mới.</li>
</ul>

<h3>2. Kinh Nghiệm Khi Thu&ecirc; S&acirc;n Pickleball</h3>

<ul>
	<li><strong>Lựa Chọn Địa Điểm</strong>: Chọn s&acirc;n gần nh&agrave; hoặc nơi bạn cảm thấy thuận tiện nhất. C&aacute;c trung t&acirc;m thể thao lớn hoặc c&aacute;c c&acirc;u lạc bộ thể thao c&oacute; thể c&oacute; s&acirc;n pickleball để thu&ecirc;.</li>
	<li><strong>Gi&aacute; Thu&ecirc;</strong>: Gi&aacute; thu&ecirc; s&acirc;n pickleball thường phụ thuộc v&agrave;o thời gian v&agrave; địa điểm. Đối với giờ cao điểm, gi&aacute; c&oacute; thể cao hơn một ch&uacute;t, trong khi giờ thấp điểm lại c&oacute; gi&aacute; rẻ hơn.</li>
	<li><strong>Thời Gian Thu&ecirc;</strong>: Chọn khung giờ ph&ugrave; hợp, t&ugrave;y v&agrave;o kế hoạch v&agrave; sở th&iacute;ch của bạn. C&oacute; thể chơi v&agrave;o buổi s&aacute;ng sớm hoặc chiều muộn để tr&aacute;nh nắng nếu s&acirc;n ngo&agrave;i trời.</li>
	<li><strong>Trang Bị Thiết Bị</strong>: Đảm bảo bạn c&oacute; vợt, b&oacute;ng v&agrave; trang phục thể thao ph&ugrave; hợp. Một số s&acirc;n cho thu&ecirc; c&oacute; thể cung cấp thiết bị, nhưng bạn c&oacute; thể mang theo đồ ri&ecirc;ng để thuận tiện v&agrave; thoải m&aacute;i hơn.</li>
</ul>

<h3>3. C&aacute;c Địa Điểm Cho Thu&ecirc; S&acirc;n Pickleball Tại Việt Nam</h3>

<ul>
	<li><strong>C&aacute;c C&acirc;u Lạc Bộ Thể Thao</strong>: Nhiều c&acirc;u lạc bộ lớn tại c&aacute;c th&agrave;nh phố lớn như H&agrave; Nội, TP.HCM đ&atilde; bắt đầu cung cấp s&acirc;n cho m&ocirc;n pickleball.</li>
	<li><strong>C&ocirc;ng Vi&ecirc;n Thể Thao C&ocirc;ng Cộng</strong>: Một số c&ocirc;ng vi&ecirc;n đ&atilde; bắt đầu triển khai s&acirc;n pickleball để phục vụ cộng đồng.</li>
</ul>

<h3>4. Lời Khuy&ecirc;n Cho Người Mới Bắt Đầu</h3>

<ul>
	<li><strong>Học C&aacute;c Kỹ Năng Cơ Bản</strong>: Nếu bạn mới chơi, n&ecirc;n học c&aacute;ch cầm vợt, đ&aacute;nh b&oacute;ng cơ bản v&agrave; hiểu luật chơi.</li>
	<li><strong>Tham Gia Cộng Đồng</strong>: H&atilde;y tham gia v&agrave;o c&aacute;c nh&oacute;m chơi pickleball hoặc c&acirc;u lạc bộ để c&oacute; thể chơi thường xuy&ecirc;n v&agrave; cải thiện kỹ năng.</li>
</ul>

<p>Thu&ecirc; s&acirc;n pickleball l&agrave; một c&aacute;ch tuyệt vời để bắt đầu l&agrave;m quen với m&ocirc;n thể thao n&agrave;y. Ch&uacute;c bạn c&oacute; những trải nghiệm th&uacute; vị v&agrave; cải thiện sức khỏe khi tham gia v&agrave;o cộng đồng pickleball!</p>
', CAST(N'2024-10-27T11:14:36.157' AS DateTime), CAST(N'2024-11-01T01:25:56.863' AS DateTime), N'images/news/Snapinsta.app_435696024_18426664984058164_99796886841935928_n_1080.webp')
GO
INSERT [dbo].[News] ([id], [title], [content], [created_at], [updated_at], [image]) VALUES (6, N'Pickleball - từ trò tiêu khiển sau nhà thành môn thể thao gây sốt', N'<p>Ra đời năm 1965, pickleball ph&aacute;t triển mạnh mẽ, trở th&agrave;nh cơn sốt thể thao ở Mỹ trước khi lan tỏa sang hơn 50 quốc gia kh&aacute;c, trong đ&oacute; c&oacute; Việt Nam.</p>

<p>Pickleball được s&aacute;ng tạo bởi Joel Pritchard - cố Hạ nghị sĩ Mỹ, c&ugrave;ng với hai người bạn l&agrave; Bill Bell v&agrave; Barney McCallum. Ban đầu, &yacute; tưởng của họ chỉ đơn giản l&agrave; tạo ra một tr&ograve; chơi vui nhộn để giải tr&iacute; cho gia đ&igrave;nh v&agrave; bạn b&egrave; ở nơi họ sống - đảo Bainbridge, thuộc bang Washington, Mỹ.</p>

<p>Tr&ograve; chơi sau đ&oacute; nhanh ch&oacute;ng lan rộng sang c&aacute;c bang kh&aacute;c ở Mỹ v&agrave; trở th&agrave;nh một m&ocirc;n thể thao phổ biến. Đến 1976, pickleball đ&atilde; c&oacute; luật chơi ch&iacute;nh thức v&agrave; Hiệp hội Pickleball Mỹ được th&agrave;nh lập. Kể từ đ&oacute;, tr&ograve; chơi n&agrave;y đ&atilde; lan rộng ra khắp thế giới. Trong một b&agrave;i viết v&agrave;o th&aacute;ng 7/2022 tr&ecirc;n&nbsp;<em>Gate&#39;s Note</em>, tỷ ph&uacute; Bill Gates cho biết đ&atilde; chơi pickleball suốt 50 năm qua.</p>

<p><a href="javascript:;"><img src="https://i1-thethao.vnecdn.net/2024/08/19/joel-pritchard-pickleball-4-87-1633-5310-1724042759.jpg?w=0&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=tA_LlqzAuwnM11jD1IXvNw" /></a></p>

<p>Pritchard c&ugrave;ng một người bạn, cựu Thống đốc bang Washington chuẩn bị cho một trận pickleball. Ảnh: Pickleball Hall of Fame</p>

<p><a href="javascript:;"><img src="https://i1-thethao.vnecdn.net/2024/08/19/joel-pritchard-pickleball-2-42-7077-1956-1724042759.jpg?w=0&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=DJy6o2ZLP_widcTT0ddL1g" /></a></p>

<p>Cố Hạ nghị sĩ Mỹ Joel Pritchard trong một trận pickleball với bạn b&egrave; ở s&acirc;n sau nh&agrave; năm 1965. Ảnh: Pickleball Hall of Fame</p>

<p><a href="javascript:;"><img src="https://i1-thethao.vnecdn.net/2024/08/19/joel-pritchard-pickleball-3-46-7504-9877-1724042759.jpg?w=0&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=IVonNKG1JxpK54qin0WYgA" /></a></p>

<p>Pritchard chơi đ&aacute;nh đ&ocirc;i c&ugrave;ng vợ, b&agrave; Joan. Ảnh: Pickleball Hall of Fame</p>

<p><a href="javascript:;"><img src="https://i1-thethao.vnecdn.net/2024/08/19/joel-pritchard-pickleball-4-87-1633-5310-1724042759.jpg?w=0&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=tA_LlqzAuwnM11jD1IXvNw" /></a></p>

<p>Pritchard c&ugrave;ng một người bạn, cựu Thống đốc bang Washington chuẩn bị cho một trận pickleball. Ảnh: Pickleball Hall of Fame</p>

<p><a href="javascript:;"><img src="https://i1-thethao.vnecdn.net/2024/08/19/joel-pritchard-pickleball-2-42-7077-1956-1724042759.jpg?w=0&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=DJy6o2ZLP_widcTT0ddL1g" /></a></p>

<p>Cố Hạ nghị sĩ Mỹ Joel Pritchard trong một trận pickleball với bạn b&egrave; ở s&acirc;n sau nh&agrave; năm 1965. Ảnh: Pickleball Hall of Fame</p>

<p><img src="https://i1-thethao.vnecdn.net/2024/08/19/joel-pritchard-pickleball-2-42-7077-1956-1724042759.jpg?w=0&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=DJy6o2ZLP_widcTT0ddL1g" /></p>

<p><img src="https://i1-thethao.vnecdn.net/2024/08/19/joel-pritchard-pickleball-3-46-7504-9877-1724042759.jpg?w=0&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=IVonNKG1JxpK54qin0WYgA" /></p>

<p><img src="https://i1-thethao.vnecdn.net/2024/08/19/joel-pritchard-pickleball-4-87-1633-5310-1724042759.jpg?w=0&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=tA_LlqzAuwnM11jD1IXvNw" /></p>

<p>1&nbsp;/&nbsp;3</p>

<p>T&ecirc;n gọi pickleball cũng ra đời theo c&aacute;ch ngẫu nhi&ecirc;n. Theo lời kể của Joel Pritchard, trong l&uacute;c c&ugrave;ng hai người bạn đang chơi tr&ograve; chơi mới n&agrave;y, con ch&oacute; của &ocirc;ng c&oacute; t&ecirc;n l&agrave; &quot;Pickle&quot; đ&atilde; lấy b&oacute;ng v&agrave; chạy đi. Sau đ&oacute;, cả ba quyết định đặt t&ecirc;n cho tr&ograve; chơi l&agrave; &quot;Pickle&#39;s ball&quot; (b&oacute;ng của Pickle). Dần dần, người Mỹ chỉ gọi n&oacute; l&agrave; pickleball, v&agrave; đ&atilde; trở th&agrave;nh t&ecirc;n gọi ch&iacute;nh thức của m&ocirc;n thể thao n&agrave;y.</p>

<p>Pickleball l&agrave; m&ocirc;n thể thao thi đấu trong nh&agrave; hoặc ngo&agrave;i trời, theo hai thể loại đơn (hai người chơi), hoặc đ&ocirc;i (bốn người chơi) tr&ecirc;n s&acirc;n h&igrave;nh chữ nhật. Người chơi d&ugrave;ng một chiếc vợt mặt nhẵn để đ&aacute;nh một quả b&oacute;ng nhựa rỗng, đục lỗ, qua lưới cao 0,86 m cho đến khi một b&ecirc;n kh&ocirc;ng thể trả b&oacute;ng hoặc phạm luật.</p>

<p>Về cơ bản,&nbsp;<strong>pickleball l&agrave; m&ocirc;n thể thao &quot;lai&quot; giữa c&aacute;c m&ocirc;n tennis, b&oacute;ng b&agrave;n v&agrave; cầu l&ocirc;ng</strong>, v&igrave; người chơi tr&ecirc;n s&acirc;n c&oacute; k&iacute;ch thước tương tự s&acirc;n cầu l&ocirc;ng, d&ugrave;ng vợt phẳng nhỏ hơn vợt tennis nhưng lớn hơn vợt b&oacute;ng b&agrave;n v&agrave; sử dụng tr&aacute;i b&oacute;ng nhỏ, nhẹ hơn b&oacute;ng tennis.</p>

<p>D&ugrave; vậy, n&oacute; cũng c&oacute; một số quy tắc ri&ecirc;ng.</p>

<p><img alt="Vợt và bóng pickleball." src="https://i1-thethao.vnecdn.net/2024/08/19/71Iudck4A4L-AC-SL1500-3863-1724042759.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=8l0Fd2jqKG7yUn9s5P-J_Q" /></p>

<p>Vợt v&agrave; b&oacute;ng pickleball.</p>

<p>Vợt pickleball c&oacute; h&igrave;nh dạng chữ nhật với tay cầm, nhưng k&iacute;ch thước lớn hơn vợt b&oacute;ng b&agrave;n - d&agrave;i tối đa 43,18 cm, với tổng chiều d&agrave;i v&agrave; chiều rộng kh&ocirc;ng được vượt qu&aacute; 60,96 cm. B&oacute;ng thi đấu l&agrave; b&oacute;ng nhựa cứng, đường k&iacute;nh từ 74 - 76 mm, nặng từ 22 - 26 gram, c&oacute; độ nảy thấp hơn b&oacute;ng nỉ trong tennis.</p>

<p>S&acirc;n pickleball c&oacute; k&iacute;ch thước 13,4 m x 6,1 m, rộng tương đương s&acirc;n cầu l&ocirc;ng v&agrave; chỉ bằng một phần tư s&acirc;n tennis (23,77 m x 8,23 m). Một s&acirc;n chuẩn cần c&oacute; kh&ocirc;ng gian an to&agrave;n xung quanh &iacute;t nhất 1,5 m, để đảm bảo an to&agrave;n cho người chơi với tổng diện t&iacute;ch sử dụng khoảng 9,1 m x 18,3 m.</p>

<p>S&acirc;n c&oacute; ba phần, với phần giữa m&agrave;u xanh được chia đ&ocirc;i bởi lưới ngăn. Mỗi b&ecirc;n lưới l&agrave; một khu vực rộng 2,13 m, được gọi l&agrave; khu vực cấm v&ocirc; l&ecirc; (hoặc kitchen), v&agrave; một cầu thủ đứng trong đ&oacute; kh&ocirc;ng được đ&aacute;nh b&oacute;ng cho đến khi b&oacute;ng nảy. Điểm chỉ được t&iacute;nh khi b&oacute;ng ra ngo&agrave;i s&acirc;n, trong đ&oacute; chỉ b&ecirc;n giao b&oacute;ng được ghi điểm.</p>

<p>Độ nảy hạn chế của tr&aacute;i b&oacute;ng, khu vực cấm v&ocirc;-l&ecirc; v&agrave; c&uacute; đ&aacute;nh dưới tay, l&agrave; những c&uacute; giao b&oacute;ng được thực hiện, kết hợp với những c&uacute; đ&aacute;nh mạnh v&agrave; những c&uacute; đập b&oacute;ng tr&ecirc;n cao, tạo cảm gi&aacute;c phấn kh&iacute;ch, năng động cho người chơi. Ngo&agrave;i ra, m&ocirc;n thể thao n&agrave;y cũng ph&ugrave; hợp với nhiều lứa tuổi, tr&igrave;nh độ thể lực v&agrave; c&oacute; chi ph&iacute; ban đầu dễ tiếp cận với số đ&ocirc;ng c&ocirc;ng ch&uacute;ng.</p>

<p><img alt="Các khu vực trên một sân picklball tiêu chuẩn." src="https://i1-thethao.vnecdn.net/2024/08/19/kich-thuoc-san-pickleball-1-17-3094-1814-1724040017.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=eokRr98D9Xbf512A8gx-cw" /></p>

<p>C&aacute;c khu vực tr&ecirc;n một s&acirc;n picklball ti&ecirc;u chuẩn.</p>

<p>Đến 2023, theo số liệu từ&nbsp;<em>Sportico</em>, c&oacute; hơn 13,6 triệu người chơi pickleball ở Mỹ. Theo b&aacute;o c&aacute;o của Hiệp hội Ng&agrave;nh Thể thao v&agrave; Thể h&igrave;nh nước n&agrave;y, đ&acirc;y l&agrave; m&ocirc;n thể thao ph&aacute;t triển nhanh nhất tr&ecirc;n to&agrave;n l&atilde;nh thổ, tăng trưởng li&ecirc;n tục từ mốc 3,5 triệu người chơi năm 2019, v&agrave; đạt mức tăng 52% từ năm 2023.</p>

<p>Từ Mỹ, m&ocirc;n thể thao n&agrave;y lan sang Canada, Australia, Trung Quốc, Ấn Độ v&agrave; khoảng 50 quốc gia kh&aacute;c, nhưng hiện chưa c&oacute; thống k&ecirc; n&agrave;o được xem l&agrave; đầy đủ v&agrave; ch&iacute;nh x&aacute;c nhất về lượng người chơi pickleball tr&ecirc;n khắp thế giới. Trong số c&aacute;c quốc gia mới, Trung Quốc dẫn đầu về tăng trưởng s&acirc;n v&agrave; người chơi, c&oacute; thể đạt tới quy m&ocirc; 10.000 s&acirc;n v&agrave; 100 triệu người chơi đến 2028.</p>

<p>Đến nay đ&atilde; c&oacute; bốn cơ quan quốc tế tự nhận l&agrave; đơn vị quản l&yacute; to&agrave;n cầu về pickleball, gồm Li&ecirc;n đo&agrave;n Pickleball Quốc tế (IPF) ra đời năm 2010, Li&ecirc;n đo&agrave;n Pickleball Thế giới (WPF) năm 2018, Li&ecirc;n đo&agrave;n Pickleball To&agrave;n cầu (GPF) v&agrave; Ủy ban Quốc tế Pickleball (PIC) c&ugrave;ng trong năm 2023. Tuy nhi&ecirc;n, đến th&aacute;ng 8/2024, chưa c&oacute; đơn vị n&agrave;o trong số đ&oacute; được Ủy ban Olympic Quốc tế (IOC) c&ocirc;ng nhận tư c&aacute;ch như b&oacute;ng đ&aacute; (FIFA), b&oacute;ng chuyền (IBF), tennis (ITF), cầu l&ocirc;ng (BWF), b&oacute;ng b&agrave;n (ITTF) hay điền kinh (World Athletics), bơi lội (World Aquatics)...</p>

<p><img alt="Tay vợt đơn nữ số ba thế giới pickleball Anna Leigh Waters trong một trận đấu thuộc PPA Tour. Ảnh: PPA Tour" src="https://i1-thethao.vnecdn.net/2024/08/19/AL1-2-scaled-e1673675903420-1745-1724042760.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=F2PB-Ia8MPagvdNOIvawzQ" /></p>

<p>Tay vợt đơn nữ số ba thế giới pickleball Anna Leigh Waters trong một trận đấu thuộc PPA Tour. Ảnh:&nbsp;<em>PPA Tour</em></p>

<p>Hiện cũng chưa c&oacute; hệ thống thi đấu to&agrave;n cầu n&agrave;o của pickleball. Nhưng ở Mỹ, đ&atilde; c&oacute; một số hệ thống thi đấu chuy&ecirc;n nghiệp m&ocirc;n n&agrave;y như PPA Tour của Hiệp hội Pickleball Nh&agrave; nghề Mỹ, hay MLB - giải pickleball nh&agrave; nghề Mỹ... Theo tạp ch&iacute;&nbsp;<em>Into Pickleball</em>, những người l&agrave;m m&ocirc;n thể thao n&agrave;y đang tham vọng ph&aacute;t triển để đưa pickballe v&agrave;o chương tr&igrave;nh thi đấu ch&iacute;nh thức của Thế vận hội 2032 tại Brisbane, Australia.</p>

<p>Tại Việt Nam, pickleball được du nhập từ 2018, ph&aacute;t triển chủ yếu ở TP HCM trước khi ra H&agrave; Nội v&agrave; trở th&agrave;nh m&ocirc;n thể thao thịnh h&agrave;nh từ khoảng hai năm trở lại đ&acirc;y, với khoảng tr&ecirc;n 10.000 người theo tập, chơi tr&ecirc;n to&agrave;n quốc.</p>
', CAST(N'2024-10-28T09:03:53.400' AS DateTime), CAST(N'2024-10-28T09:04:44.207' AS DateTime), N'images/news/AL1-2-scaled-e1673675903420-1745-1724042760.jpg')
GO
INSERT [dbo].[News] ([id], [title], [content], [created_at], [updated_at], [image]) VALUES (7, N'Kien', N'<p>321321321</p>
', CAST(N'2024-11-08T09:52:47.827' AS DateTime), NULL, N'images/news/')
GO
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[notifications] ON 
GO
INSERT [dbo].[notifications] ([id], [customerid], [message], [is_read], [created_at]) VALUES (1, 15, N'Bạn đã gia hạn thành công gói99 điểm', 0, CAST(N'2024-11-05' AS Date))
GO
INSERT [dbo].[notifications] ([id], [customerid], [message], [is_read], [created_at]) VALUES (2, 15, N'Bạn đã gia hạn thành công gói 54000000 điểm', 0, CAST(N'2024-11-05' AS Date))
GO
INSERT [dbo].[notifications] ([id], [customerid], [message], [is_read], [created_at]) VALUES (3, 15, N'Bạn đã gia hạn thành công gói 54000000 điểm', 0, CAST(N'2024-11-05' AS Date))
GO
INSERT [dbo].[notifications] ([id], [customerid], [message], [is_read], [created_at]) VALUES (5, 23, N'Bạn đã nạp thành công 1000 điểm', 0, CAST(N'2024-11-05' AS Date))
GO
INSERT [dbo].[notifications] ([id], [customerid], [message], [is_read], [created_at]) VALUES (6, 23, N'Bạn đã gia hạn thành công gói 100000000 điểm', 0, CAST(N'2024-11-05' AS Date))
GO
INSERT [dbo].[notifications] ([id], [customerid], [message], [is_read], [created_at]) VALUES (7, 6, N'Bạn đã nạp thành công 500 điểm', 1, CAST(N'2024-11-06' AS Date))
GO
INSERT [dbo].[notifications] ([id], [customerid], [message], [is_read], [created_at]) VALUES (9, 6, N'Bạn đã nạp thành công 900 điểm', 0, CAST(N'2024-11-06' AS Date))
GO
INSERT [dbo].[notifications] ([id], [customerid], [message], [is_read], [created_at]) VALUES (10, 6, N'Bạn đã gia hạn thành công gói 99000', 0, CAST(N'2024-11-06' AS Date))
GO
INSERT [dbo].[notifications] ([id], [customerid], [message], [is_read], [created_at]) VALUES (11, 6, N'Bạn đã nạp thành công 1000 điểm', 0, CAST(N'2024-11-06' AS Date))
GO
INSERT [dbo].[notifications] ([id], [customerid], [message], [is_read], [created_at]) VALUES (12, 6, N'Bạn đã gia hạn thành công gói 1000000', 0, CAST(N'2024-11-06' AS Date))
GO
INSERT [dbo].[notifications] ([id], [customerid], [message], [is_read], [created_at]) VALUES (13, 24, N'Bạn đã nạp thành công 500 điểm', 0, CAST(N'2024-11-06' AS Date))
GO
INSERT [dbo].[notifications] ([id], [customerid], [message], [is_read], [created_at]) VALUES (14, 24, N'Bạn đã gia hạn thành công gói 500000', 0, CAST(N'2024-11-06' AS Date))
GO
INSERT [dbo].[notifications] ([id], [customerid], [message], [is_read], [created_at]) VALUES (15, 24, N'Bạn đã nạp thành công 1000 điểm', 0, CAST(N'2024-11-06' AS Date))
GO
INSERT [dbo].[notifications] ([id], [customerid], [message], [is_read], [created_at]) VALUES (16, 24, N'Bạn đã gia hạn thành công gói 1000000', 0, CAST(N'2024-11-06' AS Date))
GO
INSERT [dbo].[notifications] ([id], [customerid], [message], [is_read], [created_at]) VALUES (17, 25, N'Bạn đã gia hạn thành công gói 540000', 0, CAST(N'2024-11-06' AS Date))
GO
INSERT [dbo].[notifications] ([id], [customerid], [message], [is_read], [created_at]) VALUES (18, 25, N'Bạn đã nạp thành công 1000 điểm', 0, CAST(N'2024-11-06' AS Date))
GO
INSERT [dbo].[notifications] ([id], [customerid], [message], [is_read], [created_at]) VALUES (19, 26, N'Bạn đã gia hạn thành công gói 99000', 1, CAST(N'2024-11-06' AS Date))
GO
INSERT [dbo].[notifications] ([id], [customerid], [message], [is_read], [created_at]) VALUES (20, 26, N'Bạn đã gia hạn thành công gói 99000', 1, CAST(N'2024-11-06' AS Date))
GO
INSERT [dbo].[notifications] ([id], [customerid], [message], [is_read], [created_at]) VALUES (21, 26, N'Bạn đã gia hạn thành công gói 540000', 1, CAST(N'2024-11-06' AS Date))
GO
INSERT [dbo].[notifications] ([id], [customerid], [message], [is_read], [created_at]) VALUES (22, 26, N'Bạn đã nạp thành công 1000 điểm', 0, CAST(N'2024-11-06' AS Date))
GO
INSERT [dbo].[notifications] ([id], [customerid], [message], [is_read], [created_at]) VALUES (23, 26, N'Bạn đã nạp thành công 1000 điểm', 0, CAST(N'2024-11-06' AS Date))
GO
INSERT [dbo].[notifications] ([id], [customerid], [message], [is_read], [created_at]) VALUES (24, 26, N'Bạn đã gia hạn thành công gói 900000', 0, CAST(N'2024-11-06' AS Date))
GO
INSERT [dbo].[notifications] ([id], [customerid], [message], [is_read], [created_at]) VALUES (25, 28, N'Bạn đã nạp thành công 1000 điểm', 1, CAST(N'2024-11-06' AS Date))
GO
INSERT [dbo].[notifications] ([id], [customerid], [message], [is_read], [created_at]) VALUES (26, 28, N'Bạn đã gia hạn thành công gói 540000', 1, CAST(N'2024-11-06' AS Date))
GO
INSERT [dbo].[notifications] ([id], [customerid], [message], [is_read], [created_at]) VALUES (27, 6, N'Bạn đã nạp thành công 1000 điểm', 0, CAST(N'2024-11-06' AS Date))
GO
INSERT [dbo].[notifications] ([id], [customerid], [message], [is_read], [created_at]) VALUES (28, 28, N'Bạn đã nạp thành công 1000 điểm', 0, CAST(N'2024-11-07' AS Date))
GO
SET IDENTITY_INSERT [dbo].[notifications] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 
GO
INSERT [dbo].[Order] ([order_id], [customer_id], [total_price], [status], [voucher_code], [created_date]) VALUES (17, 29, 1019.9799900054932, 0, NULL, CAST(N'2024-11-07T12:51:01.030' AS DateTime))
GO
INSERT [dbo].[Order] ([order_id], [customer_id], [total_price], [status], [voucher_code], [created_date]) VALUES (18, 29, 1049.9699897766113, 0, NULL, CAST(N'2024-11-07T12:51:18.327' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 
GO
INSERT [dbo].[OrderDetail] ([order_detail_id], [order_id], [item_id], [quantity], [price]) VALUES (44, 17, 77, 1, 999.989990234375)
GO
INSERT [dbo].[OrderDetail] ([order_detail_id], [order_id], [item_id], [quantity], [price]) VALUES (45, 17, 79, 1, 19.989999771118164)
GO
INSERT [dbo].[OrderDetail] ([order_detail_id], [order_id], [item_id], [quantity], [price]) VALUES (46, 18, 81, 1, 999.989990234375)
GO
INSERT [dbo].[OrderDetail] ([order_detail_id], [order_id], [item_id], [quantity], [price]) VALUES (47, 18, 83, 1, 19.989999771118164)
GO
INSERT [dbo].[OrderDetail] ([order_detail_id], [order_id], [item_id], [quantity], [price]) VALUES (48, 18, 84, 1, 29.989999771118164)
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 
GO
INSERT [dbo].[orders] ([id], [customerid], [total], [createdate], [ispayment]) VALUES (1, 6, 6000, CAST(N'2024-11-05' AS Date), 1)
GO
INSERT [dbo].[orders] ([id], [customerid], [total], [createdate], [ispayment]) VALUES (2, 6, 14000, CAST(N'2024-11-06' AS Date), 1)
GO
INSERT [dbo].[orders] ([id], [customerid], [total], [createdate], [ispayment]) VALUES (3, 6, 2000, CAST(N'2024-11-06' AS Date), 1)
GO
INSERT [dbo].[orders] ([id], [customerid], [total], [createdate], [ispayment]) VALUES (4, 26, 190, CAST(N'2024-11-06' AS Date), 1)
GO
INSERT [dbo].[orders] ([id], [customerid], [total], [createdate], [ispayment]) VALUES (5, 28, 130, CAST(N'2024-11-07' AS Date), 0)
GO
INSERT [dbo].[orders] ([id], [customerid], [total], [createdate], [ispayment]) VALUES (6, 28, 210, CAST(N'2024-11-07' AS Date), 0)
GO
INSERT [dbo].[orders] ([id], [customerid], [total], [createdate], [ispayment]) VALUES (7, 26, 660, CAST(N'2024-11-08' AS Date), 0)
GO
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[ordersdetail] ON 
GO
INSERT [dbo].[ordersdetail] ([id], [orderid], [productid], [quantity]) VALUES (1, 1, 5, 2)
GO
INSERT [dbo].[ordersdetail] ([id], [orderid], [productid], [quantity]) VALUES (2, 1, 1, 2)
GO
INSERT [dbo].[ordersdetail] ([id], [orderid], [productid], [quantity]) VALUES (3, 1, 4, 2)
GO
INSERT [dbo].[ordersdetail] ([id], [orderid], [productid], [quantity]) VALUES (4, 2, 2, 2)
GO
INSERT [dbo].[ordersdetail] ([id], [orderid], [productid], [quantity]) VALUES (5, 2, 6, 1)
GO
INSERT [dbo].[ordersdetail] ([id], [orderid], [productid], [quantity]) VALUES (6, 2, 5, 2)
GO
INSERT [dbo].[ordersdetail] ([id], [orderid], [productid], [quantity]) VALUES (7, 3, 3, 1)
GO
INSERT [dbo].[ordersdetail] ([id], [orderid], [productid], [quantity]) VALUES (8, 3, 7, 1)
GO
INSERT [dbo].[ordersdetail] ([id], [orderid], [productid], [quantity]) VALUES (9, 4, 1, 1)
GO
INSERT [dbo].[ordersdetail] ([id], [orderid], [productid], [quantity]) VALUES (10, 4, 2, 1)
GO
INSERT [dbo].[ordersdetail] ([id], [orderid], [productid], [quantity]) VALUES (11, 4, 7, 1)
GO
INSERT [dbo].[ordersdetail] ([id], [orderid], [productid], [quantity]) VALUES (12, 5, 2, 1)
GO
INSERT [dbo].[ordersdetail] ([id], [orderid], [productid], [quantity]) VALUES (13, 5, 6, 1)
GO
INSERT [dbo].[ordersdetail] ([id], [orderid], [productid], [quantity]) VALUES (14, 6, 3, 1)
GO
INSERT [dbo].[ordersdetail] ([id], [orderid], [productid], [quantity]) VALUES (15, 6, 19, 1)
GO
INSERT [dbo].[ordersdetail] ([id], [orderid], [productid], [quantity]) VALUES (16, 7, 6, 1)
GO
INSERT [dbo].[ordersdetail] ([id], [orderid], [productid], [quantity]) VALUES (17, 7, 7, 2)
GO
INSERT [dbo].[ordersdetail] ([id], [orderid], [productid], [quantity]) VALUES (18, 7, 2, 1)
GO
INSERT [dbo].[ordersdetail] ([id], [orderid], [productid], [quantity]) VALUES (19, 7, 4, 3)
GO
SET IDENTITY_INSERT [dbo].[ordersdetail] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 
GO
INSERT [dbo].[product] ([id], [name], [image], [cost], [memberid], [amount]) VALUES (1, N'Vợt PickleBall Normal', N'https://th.bing.com/th/id/OIP.g1QK5DqDA8MAoW4ea71B-QHaHa?w=167&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7', 120, 2, 0)
GO
INSERT [dbo].[product] ([id], [name], [image], [cost], [memberid], [amount]) VALUES (2, N'Vợt PickleBall Blue', N'https://th.bing.com/th?id=OIF.HKHAThJbgi69vE%2bGeQIAqA&w=209&h=209&c=7&r=0&o=5&dpr=1.3&pid=1.7', 110, 2, 0)
GO
INSERT [dbo].[product] ([id], [name], [image], [cost], [memberid], [amount]) VALUES (3, N'Vợt PickleBall Black', N'https://th.bing.com/th?id=OIF.Rf2aIpOdr5QNT5FsCJXx%2fg&w=209&h=209&c=7&r=0&o=5&dpr=1.3&pid=1.7', 150, 2, 0)
GO
INSERT [dbo].[product] ([id], [name], [image], [cost], [memberid], [amount]) VALUES (4, N'Vợt Pickle Ball Red', N'https://th.bing.com/th?id=OIF.QwXLJAXly9vj%2bs7lR1uBcw&w=209&h=209&c=7&r=0&o=5&dpr=1.3&pid=1.7', 160, 4, 0)
GO
INSERT [dbo].[product] ([id], [name], [image], [cost], [memberid], [amount]) VALUES (5, N'Vợt PickleBall Violet', N'https://th.bing.com/th/id/OIF.oV48nRmYYaehXtbE3PQQ6w?w=209&h=209&c=7&r=0&o=5&dpr=1.3&pid=1.7', 700, 7, 0)
GO
INSERT [dbo].[product] ([id], [name], [image], [cost], [memberid], [amount]) VALUES (6, N'Bóng PickleBall', N'https://media1.popsugar-assets.com/files/thumbor/8XZbEyktfKOZ3aSMjSwypG8I72c=/fit-in/1584x1348/top/filters:format_auto():upscale()/2022/11/22/736/n/1922729/fa5e5cb359368ae9_big-dill-pickleballs.jpg', 20, 1, 0)
GO
INSERT [dbo].[product] ([id], [name], [image], [cost], [memberid], [amount]) VALUES (7, N'PickleBall Sock', N'https://media1.popsugar-assets.com/files/thumbor/tU2v4jxZyEJQkKtPYGO-tA1tCbY=/fit-in/1358x1550/filters:format_auto():upscale()/2023/06/26/618/n/47139299/bd62bae9f53549f2_socks.jpg', 25, 1, 0)
GO
INSERT [dbo].[product] ([id], [name], [image], [cost], [memberid], [amount]) VALUES (8, N'Mũ Thể Thao', N'https://th.bing.com/th/id/OIP.OzKNcAuq77p0-iNlVXmFpQHaHa?w=194&h=195&c=7&r=0&o=5&dpr=1.3&pid=1.7', 15, 1, 0)
GO
INSERT [dbo].[product] ([id], [name], [image], [cost], [memberid], [amount]) VALUES (9, N'Millie Rose Towels', N'https://media1.popsugar-assets.com/files/thumbor/BPJeLtWPNIueM8HbA7DHLpGDPlY=/fit-in/1584x1864/filters:format_auto():upscale()/2023/06/26/683/n/47139299/a5d17a701226fcea_towel.jpg', 333, 6, 0)
GO
INSERT [dbo].[product] ([id], [name], [image], [cost], [memberid], [amount]) VALUES (15, N'Vợt PickleBall Special', N'https://media1.popsugar-assets.com/files/thumbor/s5eQQ-VOiakBBBrwhe5dM4kgkfI=/fit-in/1358x1348/top/filters:format_auto():upscale()/2023/06/26/657/n/47139299/29f2d1514324bfdb_paddles.jpg', 1000, 7, NULL)
GO
INSERT [dbo].[product] ([id], [name], [image], [cost], [memberid], [amount]) VALUES (19, N'Water Bottle ', N'https://media1.popsugar-assets.com/files/thumbor/4mqPFTGFnK45HZ8z1qtXt4273vY=/fit-in/1584x1860/filters:format_auto():upscale()/2024/10/30/752/n/1922729/f3bab94bbe9eacd2_Screen_Shot_2024-10-30_at_10.03.43_AM.png', 60, 1, NULL)
GO
INSERT [dbo].[product] ([id], [name], [image], [cost], [memberid], [amount]) VALUES (21, N'Vợt PickleBall Hotest', N'https://th.bing.com/th/id/OIP.85hdC4RfFj0h5XKy3mwHjwHaHa?w=208&h=209&c=7&r=0&o=5&dpr=1.3&pid=1.7', 1200, 7, NULL)
GO
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[rank] ON 
GO
INSERT [dbo].[rank] ([rankid], [rank_name], [min_point], [img]) VALUES (1, N'Bronze', 0, N'https://cdn.gameboost.com/article-images/2024-01-24/c7d33a3b-cb24-4fc9-85cc-1cfc9a0e8d17.webp')
GO
INSERT [dbo].[rank] ([rankid], [rank_name], [min_point], [img]) VALUES (2, N'Silver', 100, N'https://cdn.gameboost.com/article-images/2024-01-24/093c5360-2961-41d2-860e-8cac01f070ce.webp')
GO
INSERT [dbo].[rank] ([rankid], [rank_name], [min_point], [img]) VALUES (3, N'Gold', 200, N'https://cdn.gameboost.com/article-images/2024-01-23/a99efb87-378a-4dbc-8745-6248447ca215.webp')
GO
INSERT [dbo].[rank] ([rankid], [rank_name], [min_point], [img]) VALUES (4, N'Platinum', 500, N'https://cdn.gameboost.com/article-images/2024-01-23/0c1c4015-4935-4404-be7c-0b41a8f24327.webp')
GO
INSERT [dbo].[rank] ([rankid], [rank_name], [min_point], [img]) VALUES (5, N'Diamond', 1000, N'https://lolg-cdn.porofessor.gg/img/s/league-icons-v3/160/5.png?v=9')
GO
INSERT [dbo].[rank] ([rankid], [rank_name], [min_point], [img]) VALUES (6, N'Master', 1500, N'https://support-leagueoflegends.riotgames.com/hc/article_attachments/4415908615571')
GO
SET IDENTITY_INSERT [dbo].[rank] OFF
GO
INSERT [dbo].[RankHistory] ([history_id], [customer_id], [rank_id], [change_date]) VALUES (1, 6, 1, CAST(N'2024-10-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[RankHistory] ([history_id], [customer_id], [rank_id], [change_date]) VALUES (2, 6, 2, CAST(N'2024-10-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[RankHistory] ([history_id], [customer_id], [rank_id], [change_date]) VALUES (3, 6, 1, CAST(N'2024-11-03T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[RankHistory] ([history_id], [customer_id], [rank_id], [change_date]) VALUES (4, 6, 2, CAST(N'2024-11-06T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[rentfield] ON 
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (9, CAST(N'2024-11-10T09:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (10, CAST(N'2024-11-08T10:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (13, CAST(N'2024-11-10T13:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (14, CAST(N'2024-11-08T14:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (18, CAST(N'2024-11-08T18:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (22, CAST(N'2024-11-10T20:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (46, CAST(N'2024-11-09T18:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (77, CAST(N'2024-11-09T18:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (85, CAST(N'2024-11-09T12:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (86, CAST(N'2024-11-09T07:00:00.000' AS DateTime), 6, NULL, 2)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (90, CAST(N'2024-11-08T11:00:00.000' AS DateTime), 6, NULL, 1)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (91, CAST(N'2024-11-08T12:00:00.000' AS DateTime), 6, NULL, 1)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (92, CAST(N'2024-11-11T08:00:00.000' AS DateTime), 14, NULL, 2)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (93, CAST(N'2024-11-12T09:00:00.000' AS DateTime), 14, NULL, 2)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (94, CAST(N'2024-11-11T10:00:00.000' AS DateTime), 14, NULL, 2)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (95, CAST(N'2024-11-10T11:00:00.000' AS DateTime), 14, NULL, 5)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (96, CAST(N'2024-11-11T10:00:00.000' AS DateTime), 14, NULL, 5)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (97, CAST(N'2024-11-17T07:00:00.000' AS DateTime), 14, NULL, 4)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (98, CAST(N'2024-11-17T08:00:00.000' AS DateTime), 14, NULL, 4)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (99, CAST(N'2024-11-17T09:00:00.000' AS DateTime), 14, NULL, 4)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (100, CAST(N'2024-11-17T10:00:00.000' AS DateTime), 14, NULL, 4)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (101, CAST(N'2024-11-17T11:00:00.000' AS DateTime), 14, NULL, 4)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (102, CAST(N'2024-11-17T12:00:00.000' AS DateTime), 14, NULL, 4)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (103, CAST(N'2024-11-17T13:00:00.000' AS DateTime), 14, NULL, 4)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (104, CAST(N'2024-11-17T14:00:00.000' AS DateTime), 14, NULL, 4)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (105, CAST(N'2024-11-17T15:00:00.000' AS DateTime), 14, NULL, 4)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (106, CAST(N'2024-11-17T16:00:00.000' AS DateTime), 14, NULL, 4)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (107, CAST(N'2024-11-17T17:00:00.000' AS DateTime), 14, NULL, 4)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (108, CAST(N'2024-11-17T18:00:00.000' AS DateTime), 14, NULL, 4)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (109, CAST(N'2024-11-17T19:00:00.000' AS DateTime), 14, NULL, 4)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (110, CAST(N'2024-11-17T20:00:00.000' AS DateTime), 14, NULL, 4)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (111, CAST(N'2024-11-17T21:00:00.000' AS DateTime), 14, NULL, 4)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (112, CAST(N'2024-11-17T22:00:00.000' AS DateTime), 14, NULL, 4)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (113, CAST(N'2024-11-09T07:00:00.000' AS DateTime), 14, NULL, 4)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (114, CAST(N'2024-11-10T08:00:00.000' AS DateTime), 14, NULL, 4)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (115, CAST(N'2024-11-09T09:00:00.000' AS DateTime), 14, NULL, 4)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (116, CAST(N'2024-11-10T10:00:00.000' AS DateTime), 14, NULL, 4)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (117, CAST(N'2024-11-09T11:00:00.000' AS DateTime), 14, NULL, 4)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (118, CAST(N'2024-11-10T12:00:00.000' AS DateTime), 14, NULL, 4)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (119, CAST(N'2024-11-10T15:00:00.000' AS DateTime), 14, NULL, 4)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (120, CAST(N'2024-11-10T18:00:00.000' AS DateTime), 14, NULL, 4)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (121, CAST(N'2024-11-10T07:00:00.000' AS DateTime), 6, NULL, 1)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (122, CAST(N'2024-11-10T10:00:00.000' AS DateTime), 6, NULL, 1)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (125, CAST(N'2024-11-08T11:00:00.000' AS DateTime), 6, NULL, 4)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (127, CAST(N'2024-11-09T16:00:00.000' AS DateTime), 6, NULL, 4)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (128, CAST(N'2024-11-08T17:00:00.000' AS DateTime), 6, NULL, 4)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (129, CAST(N'2024-11-08T14:00:00.000' AS DateTime), 29, NULL, 4)
GO
INSERT [dbo].[rentfield] ([id], [bookeddate], [customerid], [voucher], [fieldid]) VALUES (130, CAST(N'2024-11-09T14:00:00.000' AS DateTime), 29, NULL, 4)
GO
SET IDENTITY_INSERT [dbo].[rentfield] OFF
GO
SET IDENTITY_INSERT [dbo].[staff] ON 
GO
INSERT [dbo].[staff] ([id], [fullname], [email], [phonenumber], [address], [username], [baseid]) VALUES (7, N'Trung Kien Dep Zai', N'kien632k4@gmail.com', NULL, NULL, N'kien632004', 3)
GO
INSERT [dbo].[staff] ([id], [fullname], [email], [phonenumber], [address], [username], [baseid]) VALUES (9, N'Nhu Trung Kien', N'kientrung2004x@gmail.com', NULL, NULL, N'kientrung2004x', 6)
GO
INSERT [dbo].[staff] ([id], [fullname], [email], [phonenumber], [address], [username], [baseid]) VALUES (12, N'Mr Kien', N'daukhac1234@gmail.com', NULL, NULL, N'kiendaukhac0123', 4)
GO
INSERT [dbo].[staff] ([id], [fullname], [email], [phonenumber], [address], [username], [baseid]) VALUES (13, N'Hello cu', N'concaccon@gmail.com', NULL, NULL, N'kien2004xxxx', 4)
GO
INSERT [dbo].[staff] ([id], [fullname], [email], [phonenumber], [address], [username], [baseid]) VALUES (14, N'Duong Xuan Thang', N'thang09121527403@gmail.com', NULL, NULL, N'thanglxt', 3)
GO
INSERT [dbo].[staff] ([id], [fullname], [email], [phonenumber], [address], [username], [baseid]) VALUES (15, N'Duong Xuan Thang', N'thang0912527403@gmail.com', NULL, NULL, N'thangdxhe', 3)
GO
SET IDENTITY_INSERT [dbo].[staff] OFF
GO
INSERT [dbo].[voucher] ([code], [expiredate], [usecondition], [quantity], [percent]) VALUES (N'3KIHD6U1', CAST(N'2024-11-18T00:00:00.000' AS DateTime), N'Only for rent', 5, 5)
GO
INSERT [dbo].[voucher] ([code], [expiredate], [usecondition], [quantity], [percent]) VALUES (N'74TQFB20', CAST(N'2024-11-18T00:00:00.000' AS DateTime), N'None', 1, 70)
GO
INSERT [dbo].[voucher] ([code], [expiredate], [usecondition], [quantity], [percent]) VALUES (N'7GXSAZ0U', CAST(N'2024-11-18T00:00:00.000' AS DateTime), N'None', 1, 70)
GO
INSERT [dbo].[voucher] ([code], [expiredate], [usecondition], [quantity], [percent]) VALUES (N'GDX7KNYL', CAST(N'2025-02-11T00:00:00.000' AS DateTime), N'None', 15, 20)
GO
INSERT [dbo].[voucher] ([code], [expiredate], [usecondition], [quantity], [percent]) VALUES (N'H5JQP2NP', CAST(N'2024-11-13T00:00:00.000' AS DateTime), N'none', 2, 30)
GO
INSERT [dbo].[voucher] ([code], [expiredate], [usecondition], [quantity], [percent]) VALUES (N'MM4PZ4NJ', CAST(N'2024-11-08T00:00:00.000' AS DateTime), N'None', 10, 10)
GO
INSERT [dbo].[voucher] ([code], [expiredate], [usecondition], [quantity], [percent]) VALUES (N'PWHMMC62', CAST(N'2024-12-03T00:00:00.000' AS DateTime), N'None', 100, 100)
GO
INSERT [dbo].[voucher] ([code], [expiredate], [usecondition], [quantity], [percent]) VALUES (N'ZVPB0EYP', CAST(N'2025-02-11T00:00:00.000' AS DateTime), N'None', 15, 20)
GO
ALTER TABLE [dbo].[Account] ADD  DEFAULT ((0)) FOR [online]
GO
ALTER TABLE [dbo].[customer] ADD  DEFAULT ((0)) FOR [point]
GO
ALTER TABLE [dbo].[Order] ADD  DEFAULT (getdate()) FOR [created_date]
GO
ALTER TABLE [dbo].[admin]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[bag]  WITH CHECK ADD FOREIGN KEY([customerid])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[bag]  WITH CHECK ADD FOREIGN KEY([productid])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[cart]  WITH CHECK ADD FOREIGN KEY([item_id])
REFERENCES [dbo].[item] ([item_id])
GO
ALTER TABLE [dbo].[customer]  WITH CHECK ADD FOREIGN KEY([rankid])
REFERENCES [dbo].[rank] ([rankid])
GO
ALTER TABLE [dbo].[customer]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[feedbackbase]  WITH CHECK ADD FOREIGN KEY([baseid])
REFERENCES [dbo].[base] ([id])
GO
ALTER TABLE [dbo].[feedbackbase]  WITH CHECK ADD FOREIGN KEY([customerid])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[feedbackfield]  WITH CHECK ADD FOREIGN KEY([customerid])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[feedbackfield]  WITH CHECK ADD FOREIGN KEY([fieldid])
REFERENCES [dbo].[field] ([id])
GO
ALTER TABLE [dbo].[field]  WITH CHECK ADD FOREIGN KEY([baseid])
REFERENCES [dbo].[base] ([id])
GO
ALTER TABLE [dbo].[friend]  WITH CHECK ADD FOREIGN KEY([customerid])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[friend]  WITH CHECK ADD FOREIGN KEY([friendid])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[friendrequest]  WITH CHECK ADD FOREIGN KEY([receiverid])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[friendrequest]  WITH CHECK ADD FOREIGN KEY([senderid])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[historypayment]  WITH CHECK ADD FOREIGN KEY([customerid])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[historyrent]  WITH CHECK ADD FOREIGN KEY([fieldid])
REFERENCES [dbo].[field] ([id])
GO
ALTER TABLE [dbo].[historyrent]  WITH CHECK ADD FOREIGN KEY([voucher])
REFERENCES [dbo].[voucher] ([code])
GO
ALTER TABLE [dbo].[item]  WITH CHECK ADD FOREIGN KEY([item_category_id])
REFERENCES [dbo].[category_item] ([item_category_id])
GO
ALTER TABLE [dbo].[matchplayed]  WITH CHECK ADD FOREIGN KEY([fieldid])
REFERENCES [dbo].[field] ([id])
GO
ALTER TABLE [dbo].[matchplayed]  WITH CHECK ADD FOREIGN KEY([player1])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[matchplayed]  WITH CHECK ADD FOREIGN KEY([player2])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[matchplayed]  WITH CHECK ADD FOREIGN KEY([winner])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[membershipdetail]  WITH CHECK ADD FOREIGN KEY([customerid])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[membershipdetail]  WITH CHECK ADD FOREIGN KEY([membershipid])
REFERENCES [dbo].[membership] ([id])
GO
ALTER TABLE [dbo].[notifications]  WITH CHECK ADD FOREIGN KEY([customerid])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([voucher_code])
REFERENCES [dbo].[voucher] ([code])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([item_id])
REFERENCES [dbo].[item] ([item_id])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Order] ([order_id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([customerid])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[ordersdetail]  WITH CHECK ADD FOREIGN KEY([orderid])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[ordersdetail]  WITH CHECK ADD FOREIGN KEY([productid])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([memberid])
REFERENCES [dbo].[membership] ([id])
GO
ALTER TABLE [dbo].[RankHistory]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[RankHistory]  WITH CHECK ADD FOREIGN KEY([rank_id])
REFERENCES [dbo].[rank] ([rankid])
GO
ALTER TABLE [dbo].[rentfield]  WITH CHECK ADD FOREIGN KEY([fieldid])
REFERENCES [dbo].[field] ([id])
GO
ALTER TABLE [dbo].[rentfield]  WITH CHECK ADD FOREIGN KEY([voucher])
REFERENCES [dbo].[voucher] ([code])
GO
ALTER TABLE [dbo].[staff]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[staff]  WITH CHECK ADD  CONSTRAINT [fk_staff_base] FOREIGN KEY([baseid])
REFERENCES [dbo].[base] ([id])
GO
ALTER TABLE [dbo].[staff] CHECK CONSTRAINT [fk_staff_base]
GO
