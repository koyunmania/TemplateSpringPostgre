-- Table: "user"
-- DROP TABLE "user";
CREATE TABLE "user"
(
  user_id serial NOT NULL,
  active integer,
  email character varying(255) NOT NULL,
  last_name character varying(255) NOT NULL,
  name character varying(255) NOT NULL,
  password character varying(255) NOT NULL,
  CONSTRAINT users_pkey PRIMARY KEY (user_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "user"
  OWNER TO "User";


-- Table: role
-- DROP TABLE role;
CREATE TABLE role
(
  role_id serial NOT NULL,
  role character varying(255),
  CONSTRAINT roles_pkey PRIMARY KEY (role_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE role
  OWNER TO "User";


-- Table: user_role
-- DROP TABLE user_role;
CREATE TABLE user_role
(
  user_id integer NOT NULL,
  role_id integer NOT NULL,
  CONSTRAINT user_role_pkey PRIMARY KEY (user_id, role_id),
  CONSTRAINT "FK859n2jvi8ivhui0rl0esws6o" FOREIGN KEY (user_id)
      REFERENCES "user" (user_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT "FKa68196081fvovjhkek5m97n3y" FOREIGN KEY (role_id)
      REFERENCES role (role_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE user_role
  OWNER TO "User";

-- INSERT Roles
INSERT INTO role(role_id, role) VALUES (1, 'ADMIN');