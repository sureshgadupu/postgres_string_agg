


CREATE TABLE IF NOT EXISTS test."user"
(
    id numeric NOT NULL,
    name character varying(255)  NOT NULL,
    email character varying(255) ,
    CONSTRAINT user_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS test.user_role
(
    id numeric NOT NULL,
    user_id numeric,
    role character varying(255)  NOT NULL,
    CONSTRAINT user_role_pkey PRIMARY KEY (id),
    CONSTRAINT userid_fk FOREIGN KEY (user_id)
        REFERENCES test."user" (id)
);


INSERT INTO test."user"(id, name, email)  VALUES
	(1, 'A', 'a@test.com'),
	(2, 'B', 'b@test.com'),
	(3, 'C', 'c@test.com'),
	(4, 'D', 'd@test.com'),
	(5, 'E', 'e@test.com'),
	(6, 'F', 'f@test.com'),
	(7, 'G', 'g@test.com'),
	(8, 'H', 'h@test.com'),
	(9, 'I', 'i@test.com'),
	(10, 'J', 'j@test.com'),
	(11, 'K', 'k@test.com'),
	(12, 'L', 'l@test.com'),
	(13, 'M', 'm@test.com'),
	(14, 'N', 'n@test.com'),
	(15, 'O', 'o@test.com'),
	(16, 'Y', 'y@test.com'),
	(17, 'X', 'x@test.com'),
	(18, 'S', 's@test.com'),
	(19, 'R', null),
	(20, 'V', null)
	;

INSERT INTO test.user_role(id, user_id, role) VALUES
	    (1, 1, 'SUPER_ADMIN'),
    	(2, 1, 'EDITOR'),
    	(3, 1, 'AUTHOR'),
    	(4, 2, 'ADMIN'),
    	(5, 2, 'AUTHOR'),
    	(6, 3, 'EDITOR'),
    	(7, 3, 'CONTRIBUTOR'),
    	(8, 4, 'SUB_EDITOR'),
    	(9, 5, 'SUB_EDITOR'),
    	(10, 5, 'CONTRIBUTOR'),
    	(11, 5, 'AUTHOR'),
    	(12, 6, 'SUB_EDITOR'),
    	(13, 6, 'CONTRIBUTOR'),
    	(14, 7, 'MANAGER'),
    	(15, 8, 'CONTRIBUTOR')
    	;

    select string_agg(name,',') as names  from "test".user;

    select string_agg(name,',' ORDER BY name) as names  from "test".user;

    select  u.name, string_agg(ur.role,',')  from "test".user u , "test".user_role ur
    where u.id = ur.user_id GROUP BY name;

    select  u.name, string_agg(ur.role,' , ' ORDER BY role)  from "test".user u , "test".user_role ur
    where u.id = ur.user_id GROUP BY name;

    select string_agg(email,',') as emails  from "test".user where id in (1,2,3,18,19);

    select string_agg(distinct(role),' , ' ORDER BY role) as roles  from "test".user_role;
