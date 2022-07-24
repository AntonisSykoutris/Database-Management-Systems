CREATE TABLE plan_table
(
statement_id VARCHAR2(30),
timestamp DATE,
remarks VARCHAR2(80),
operation VARCHAR2(30),
options VARCHAR2(30),
object_node VARCHAR2(128),
object_owner VARCHAR2(30),
object_name VARCHAR2(30),
object_instance NUMERIC,
object_type VARCHAR2(30),
optimizer VARCHAR2(255),
search_columns NUMERIC,
id NUMERIC,
parent_id NUMERIC,
position NUMERIC,
other LONG
);