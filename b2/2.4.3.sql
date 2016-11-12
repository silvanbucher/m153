# recreate schema
drop schema if exists seminar;
create schema seminar;
use seminar;

# create tables
create table dozent (
	DozNr int not null auto_increment,
	DozName varchar(50) not null,
	primary key (DozNr)
);
create table teilnehmer (
	TnNr int not null auto_increment,
	TnName varchar(50) not null,
	primary key (TnNr)
);
create table seminar (
	SemNr int not null auto_increment,
	Thema varchar(30) not null,
	Datum date not null,
	Preis float not null,
	DozNr int,
	primary key (SemNr),
	foreign key (DozNr)
		references dozent(DozNr)
		on delete set null
);
create table seminarteilnehmer (
	SemNr int,
	TnNr int,
	Bezahlt boolean not null,
	primary key (SemNr, TnNr),
	foreign key (SemNr)
		references seminar(SemNr),
	foreign key (TnNr)
		references teilnehmer(TnNr)
		on update cascade
		on delete cascade
);

# insert sample data
insert into dozent (DozName) values(
	'Peter'
);
insert into teilnehmer (TnName) values(
	'Hans'
);
insert into seminar (Thema, Datum, Preis, DozNr) values (
	'SQL',
	CURDATE(),
	200.5,
	1
);
insert into seminarteilnehmer (SemNr, TnNr, Bezahlt) values (
	1,
	1,
	FALSE
);
