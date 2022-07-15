CREATE TABLE [dbo].[peppa]
(
	[idnum] INT NOT NULL PRIMARY KEY , 
    [name] VARCHAR(50) NOT NULL, 
    [location] VARCHAR(50) NOT NULL
);
GO
INSERT INTO dbo.peppa ([idnum], [name], [location])
VALUES 
(1, 'Nico', 'Rizal'),
(2, 'Jam', 'Au'),
(3, 'Rutie', 'Batangas'),
(4, 'Gra', 'Pasig');
GO
