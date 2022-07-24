CREATE CLUSTER c1(movieID NUMBER(7,0)) HASHKEYS 1000;

create table plays
(
	personID char(50) not null,
	movieID numeric(7) not null
)
CLUSTER c1(movieID);
