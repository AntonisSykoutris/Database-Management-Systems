CREATE CLUSTER c1(movieID NUMBER(7,0)) HASHKEYS 1000;

CREATE TABLE MOVIE (
	movieID numeric(7) not null,
	movieTitle char(110) not null,                                                                    
	color char(45),
	language char(20),
	year numeric(4)
)
CLUSTER c1(movieID);
