ALTER TABLE athletes
RENAME COLUMN identified_gender TO gender;
INSERT INTO schema_migrations (migration, migrated_at) VALUES
('20220215143800-create-athletes.sql', '2022-02-15 14:38:00'); 