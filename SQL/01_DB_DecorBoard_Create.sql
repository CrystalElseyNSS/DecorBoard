USE [master]
GO

IF db_id('DecorBoard') IS NULL
  CREATE DATABASE [DecorBoard]
GO

USE [DecorBoard]
GO

DROP TABLE IF EXISTS [Item];
DROP TABLE IF EXISTS [Category];
DROP TABLE IF EXISTS [Room];
DROP TABLE IF EXISTS [UserProfile];
GO

CREATE TABLE [UserProfile] (
  [Id] integer PRIMARY KEY IDENTITY (1,1),
  [FirebaseUserId] varchar(50) NOT NULL,
  [FirstName] varchar(25) NOT NULL,
  [LastName] varchar(25) NOT NULL,
  [Email] varchar(50) NOT NULL
  CONSTRAINT UQ_FirebaseUserId UNIQUE(FirebaseUserId)
)
GO

CREATE TABLE [Room] (
  [Id] integer PRIMARY KEY IDENTITY (1,1),
  [UserProfileId] integer NOT NULL,
  [RoomName] varchar(25) NOT NULL,
  [ImageLocation] varchar(50) NOT NULL
  CONSTRAINT [FK_Room_UserProfile] FOREIGN KEY ([UserProfileId]) REFERENCES [UserProfile] ([Id])
)
GO

CREATE TABLE [Category] (
  [Id] integer PRIMARY KEY IDENTITY (1,1),
  [CategoryName] varchar(25) NOT NULL
)
GO

CREATE TABLE [Item] (
  [Id] integer PRIMARY KEY IDENTITY (1,1),
  [CategoryId] integer NOT NULL,
  [RoomId] integer NOT NULL,
  [ItemName] varchar (50) NOT NULL,
  [ImageLocation] varchar(25) NOT NULL,
  [ItemPrice] decimal NOT NULL
  CONSTRAINT [FK_Item_Category] FOREIGN KEY ([CategoryId]) REFERENCES [Category] ([Id])
  CONSTRAINT [FK_Item_Room] FOREIGN KEY ([RoomId]) REFERENCES [Room] ([Id])
)
GO

ALTER TABLE [Room] ADD FOREIGN KEY ([UserProfileId]) REFERENCES [UserProfile] ([Id])
GO

ALTER TABLE [Item] ADD FOREIGN KEY ([CategoryId]) REFERENCES [Category] ([Id])
GO

ALTER TABLE [Item] ADD FOREIGN KEY ([RoomId]) REFERENCES [Room] ([Id])
GO