use master
go

drop DATABASE if exists Java4ASM

go

create database Java4ASM
go

use  Java4ASM
go

create table [user]
(
	id				int				primary key identity,
	username		varchar(10)		unique not null,
	[password]		varchar(10)		not null,
	email			varchar(50)		unique not null,
	isAdmin			bit				not null default 0,
	isActive		bit				not null default 1
)
go

create table video
(
	id				int				primary key identity,
	title			varchar(255)	not null,
	href			varchar(50)		unique not null,
	poster			varchar(255)	null,
	[views]			int				not null default 0,
	shares			int				not null default 0,
	[description]	nvarchar(255)	not null,
	isActive		bit				not null default 1
)
go

create table history
(
	id				int				primary key identity,
	userId			int				foreign key references [user] (id),
	videoId			int				foreign key references video (id),
	viewedDate		datetime		not null default getDate(),
	isLiked			bit				not null default 0,
	likedDate		datetime		null
)
go

insert into [user] (username, [password], email, isAdmin) values
('nghia',		'111',		'nghiahtps20692@fpt.edu.vn',		1),
('bigboss',		'222',		'bigboss@gmail.com',			0)
go

insert into video (title, href, poster, [description]) values

(N'HAIKYUU',			'wzzOOQbGIiI',	'https://img.youtube.com/vi/wzzOOQbGIiI/maxresdefault.jpg',		N'PHIM HOẠT HÌNH THỂ THAO'),
(N'SWALLOW THE STAR',			'pxCC7pyBdcM',	'https://img.youtube.com/vi/pxCC7pyBdcM/maxresdefault.jpg',		N'PHIM THÔN PHỆ TINH KHÔNG'),
(N'KAMEN RIDER BUILD',			'lvvkA34BEnE',	'https://img.youtube.com/vi/lvvkA34BEnE/maxresdefault.jpg',		N'PHIM SIÊU NHÂN XÂY DỰNG'),
(N'ÂM NHẠC GIẢI TRÍ',			'QzdovKFkXSo',	'https://img.youtube.com/vi/QzdovKFkXSo/maxresdefault.jpg',		N'TUYỂN TẬP NHỮNG BÀI HÁT HAY NHẤT'),
(N'AVENGERS',						'oXIWoUoLoKg',	'https://img.youtube.com/vi/oXIWoUoLoKg/maxresdefault.jpg',		N'PHIM BIỆT ĐỘI SIÊU ANH HÙNG 1'),
(N'AVENGERS: AGE OF ULTRON',		'JB84y4tNdes',	'https://img.youtube.com/vi/JB84y4tNdes/maxresdefault.jpg',		N'PHIM BIỆT ĐỘI SIÊU ANH HÙNG 2'),
(N'AVENGERS: INFYNITY WAR',			'DPJNk72hVZU',	'https://img.youtube.com/vi/DPJNk72hVZU/maxresdefault.jpg',		N'PHIM BIỆT ĐỘI SIÊU ANH HÙNG 3'),
(N'AVENGERS: ENDGAME',				'Bhm2YXwiwnY',	'https://img.youtube.com/vi/Bhm2YXwiwnY/maxresdefault.jpg',		N'PHIM BIỆT ĐỘI SIÊU ANH HÙNG 4')
go

insert into history (userId, videoId, isLiked, likedDate) values
(2,	1,	1,	getDate()),
(2,	3,	0,	null)
go

select * from [user]
select * from video
select * from history


select v.id, v.title, v.href, sum(cast(h.isLiked as int)) as tatolLike from	video v left join history h on v.id = h.videoId group by v.id, v.title, v.href order by	sum(cast(h.isLiked as int)) desc
go

create proc sp_selectUserLikedVideoByVideoHref(@videoHref varchar(50))
as begin
	select
		u.id, u.username, u.[password], u.email, u.isAdmin, u.isActive
	from
		video v left join history h on v.id = h.videoId
			left join [user] u on h.userId = u.id
	where
		v.href = @videoHref and u.isActive = 1 and v.isActive = 1 and h.isLiked = 1
end

	select
		u.id, u.username, u.[password], u.email, u.isAdmin, u.isActive
	from
		video v left join history h on v.id = h.videoId
			left join [user] u on h.userId = u.id
	where
		v.href = 'JB84y4tNdes' and u.isActive = 1 and v.isActive = 1 and h.isLiked = 1

		select * from video


		select * from [user]