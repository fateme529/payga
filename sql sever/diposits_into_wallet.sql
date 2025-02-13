USE [payga]
GO

/****** Object:  Table [dbo].[deposits_into_wallet]    Script Date: 2/13/2025 6:40:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[deposits_into_wallet](
	[tracking_code] [int] NOT NULL,
	[id] [int] NOT NULL,
	[amount] [decimal](25, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tracking_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[deposits_into_wallet]  WITH CHECK ADD  CONSTRAINT [fk_deposits_into_wallet_client] FOREIGN KEY([id])
REFERENCES [dbo].[client] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[deposits_into_wallet] CHECK CONSTRAINT [fk_deposits_into_wallet_client]
GO

ALTER TABLE [dbo].[deposits_into_wallet]  WITH CHECK ADD  CONSTRAINT [fk_deposits_into_wallet_transaction] FOREIGN KEY([tracking_code])
REFERENCES [dbo].[bank_transaction] ([tracking_code])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[deposits_into_wallet] CHECK CONSTRAINT [fk_deposits_into_wallet_transaction]
GO


