-- Lean: Lean Anime 1080p, Lean Anime Keep, and the Lean Anime quality sizes.
--
-- Lean Anime 1080p copies Anime 1080p (scores, quality list, language) at replay time, then:
-- - HEVC releases get +200 and season packs +150;
-- - dual and multi audio drop to +25, a slight preference instead of a strong one;
-- - upgrades stop at 1600 instead of continuing indefinitely.
--
-- Lean Anime Keep is Lean Anime 1080p with upgrades off, for series whose existing files should be kept.
--
-- The Lean Anime quality size set copies the Sonarr set and caps 1080p at
-- 80 MB per minute (about 1.9 GB per 24-minute episode), which refuses
-- remux-sized releases. Assign it to the anime Sonarr instance only: quality
-- sizes apply to a whole instance.

insert into "quality_profiles" ("name", "description", "upgrades_allowed", "minimum_custom_format_score", "upgrade_until_score", "upgrade_score_increment") values ('Lean Anime 1080p', 'Copy of Anime 1080p tuned for smaller files.
- HEVC releases and season packs are preferred.
- Dual audio is only slightly preferred; English subtitles are still expected from the tiered groups.
- Upgrades stop at a good release instead of continuing indefinitely.', 1, 0, 1600, 1);
insert into "tags" ("name") values ('1080p') on conflict ("name") do nothing;
INSERT INTO quality_profile_tags (quality_profile_name, tag_name) VALUES ('Lean Anime 1080p', '1080p');
insert into "tags" ("name") values ('Anime') on conflict ("name") do nothing;
INSERT INTO quality_profile_tags (quality_profile_name, tag_name) VALUES ('Lean Anime 1080p', 'Anime');
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO quality_profile_tags (quality_profile_name, tag_name) VALUES ('Lean Anime 1080p', 'Lean');
insert into "tags" ("name") values ('HEVC') on conflict ("name") do nothing;
INSERT INTO quality_profile_tags (quality_profile_name, tag_name) VALUES ('Lean Anime 1080p', 'HEVC');
INSERT INTO quality_groups (quality_profile_name, name) SELECT 'Lean Anime 1080p', name FROM quality_groups WHERE quality_profile_name = 'Anime 1080p';
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) SELECT 'Lean Anime 1080p', quality_group_name, quality_name, position FROM quality_group_members WHERE quality_profile_name = 'Anime 1080p';
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) SELECT 'Lean Anime 1080p', quality_name, quality_group_name, position, enabled, upgrade_until FROM quality_profile_qualities WHERE quality_profile_name = 'Anime 1080p' ORDER BY position;
INSERT INTO quality_profile_languages (quality_profile_name, language_name, type) SELECT 'Lean Anime 1080p', language_name, type FROM quality_profile_languages WHERE quality_profile_name = 'Anime 1080p';
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) SELECT 'Lean Anime 1080p', custom_format_name, arr_type, score FROM quality_profile_custom_formats WHERE quality_profile_name = 'Anime 1080p';
UPDATE quality_profile_custom_formats SET score = 25 WHERE quality_profile_name = 'Lean Anime 1080p' AND custom_format_name = 'Anime Dual Audio';
UPDATE quality_profile_custom_formats SET score = 25 WHERE quality_profile_name = 'Lean Anime 1080p' AND custom_format_name = 'Multi-Audio';
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean Anime 1080p', 'Lean Anime HEVC', 'all', 200);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) SELECT 'Lean Anime 1080p', 'Season Pack', 'sonarr', 150 WHERE NOT EXISTS (SELECT 1 FROM quality_profile_custom_formats WHERE quality_profile_name = 'Lean Anime 1080p' AND custom_format_name = 'Season Pack');

-- Lean Anime Keep: same scoring, upgrades off
insert into "quality_profiles" ("name", "description", "upgrades_allowed", "minimum_custom_format_score", "upgrade_until_score", "upgrade_score_increment") values ('Lean Anime Keep', 'Lean Anime 1080p with upgrades off.
- For series whose existing files should stay as they are.', 0, 0, 1600, 1);
insert into "tags" ("name") values ('1080p') on conflict ("name") do nothing;
INSERT INTO quality_profile_tags (quality_profile_name, tag_name) VALUES ('Lean Anime Keep', '1080p');
insert into "tags" ("name") values ('Anime') on conflict ("name") do nothing;
INSERT INTO quality_profile_tags (quality_profile_name, tag_name) VALUES ('Lean Anime Keep', 'Anime');
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO quality_profile_tags (quality_profile_name, tag_name) VALUES ('Lean Anime Keep', 'Lean');
INSERT INTO quality_groups (quality_profile_name, name) SELECT 'Lean Anime Keep', name FROM quality_groups WHERE quality_profile_name = 'Lean Anime 1080p';
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) SELECT 'Lean Anime Keep', quality_group_name, quality_name, position FROM quality_group_members WHERE quality_profile_name = 'Lean Anime 1080p';
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) SELECT 'Lean Anime Keep', quality_name, quality_group_name, position, enabled, upgrade_until FROM quality_profile_qualities WHERE quality_profile_name = 'Lean Anime 1080p' ORDER BY position;
INSERT INTO quality_profile_languages (quality_profile_name, language_name, type) SELECT 'Lean Anime Keep', language_name, type FROM quality_profile_languages WHERE quality_profile_name = 'Lean Anime 1080p';
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) SELECT 'Lean Anime Keep', custom_format_name, arr_type, score FROM quality_profile_custom_formats WHERE quality_profile_name = 'Lean Anime 1080p';

-- Quality sizes for the anime Sonarr instance
INSERT INTO sonarr_quality_definitions (name, quality_name, min_size, max_size, preferred_size) SELECT 'Lean Anime', quality_name, min_size, max_size, preferred_size FROM sonarr_quality_definitions WHERE name = 'Sonarr';
UPDATE sonarr_quality_definitions SET max_size = 80, preferred_size = 79 WHERE name = 'Lean Anime' AND quality_name IN ('WEBDL-1080p', 'WEBRip-1080p', 'Bluray-1080p', 'HDTV-1080p');
