
CREATE TABLE athletes (
  id int,
  nom varchar(255) ,
  identified_gender char(1),
  dob date,
  primary key (id)
);

INSERT INTO athletes (id, nom, identified_gender, dob) VALUES
(1, 'Andrew', 'm', '1975-12-01'),
(2, 'Ayana', 'F', '1998-06-11'),
(3, 'Hayden', 'm', '1996-07-24'),
(4, 'August', 'm', '1999-09-09');

CREATE TABLE schema_migrations (
 migration varchar(255),
 migrated_at time,
 PRIMARY KEY (migration)
);
INSERT INTO schema_migrations (migration, migrated_at) VALUES
('20220215135100-create-athletes.sql', '2022-02-15 13:51:00');
INSERT INTO schema_migrations (migration, migrated_at) VALUES
('20220215142800-create-migrations.sql', '2022-02-15 14:28:00');

ALTER TABLE athletes
RENAME COLUMN identified_gender TO gender;
INSERT INTO schema_migrations (migration, migrated_at) VALUES
('20220215143800-create-athletes.sql', '2022-02-15 14:38:00'); 