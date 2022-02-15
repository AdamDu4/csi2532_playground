CREATE TABLE schema_migrations (
 migration varchar(255),
 migrated_at time,
 PRIMARY KEY (migration)
);
INSERT INTO schema_migrations (migration, migrated_at) VALUES
('20220215135100-create-athletes.sql', '2022-02-15 13:51:00');
INSERT INTO schema_migrations (migration, migrated_at) VALUES
('20220215142800-create-migrations.sql', '2022-02-15 14:28:00');