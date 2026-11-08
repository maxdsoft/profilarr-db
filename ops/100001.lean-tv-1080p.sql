-- Lean: Lean TV 1080p. A copy of TV 1080p that prefers HEVC encodes from trusted groups.
--
-- Scores, quality list and language are copied from TV 1080p at replay time, so
-- upstream changes to its bans and tiers carry over. Then:
-- - the 1080p qualities share one group, so a Bluray-sourced x265 encode can
--   outrank a WEB-DL on score alone;
-- - HD Bluray tiers drop below the WEB tiers, so flattening doesn't start
--   preferring larger h264 Bluray encodes;
-- - the x265 ban is replaced by Lean x265 (Untrusted);
-- - No Audio is dropped: scene WEB releases and some encoders' file names never
--   name an audio codec;
-- - Dictionarry's HEVC formats keep Dictionarry's order, scored from 1900 to
--   2300, above every h264 tier; untouched HEVC WEB-DLs come first, at 2400;
-- - upgrades stop at the top HEVC encode tier, 2300;
-- - an upgrade must gain 100, more than the season pack bonus and the gap between two HEVC tiers.

insert into "quality_profiles" ("name", "description", "upgrades_allowed", "minimum_custom_format_score", "upgrade_until_score", "upgrade_score_increment") values ('Lean TV 1080p', 'Copy of TV 1080p that prefers trusted x265 encodes to save space.
- x265 from the Lean HEVC tiers is preferred over h264 WEB-DLs; untrusted x265 is banned.
- h264 WEB-DLs remain the fallback when no trusted x265 release exists.
- Upgrades stop at a tier 1 HEVC release.
- An upgrade must gain 100 points, more than a season pack''s bonus.', 1, 0, 2300, 100);
insert into "tags" ("name") values ('1080p') on conflict ("name") do nothing;
INSERT INTO quality_profile_tags (quality_profile_name, tag_name) VALUES ('Lean TV 1080p', '1080p');
insert into "tags" ("name") values ('Sonarr') on conflict ("name") do nothing;
INSERT INTO quality_profile_tags (quality_profile_name, tag_name) VALUES ('Lean TV 1080p', 'Sonarr');
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO quality_profile_tags (quality_profile_name, tag_name) VALUES ('Lean TV 1080p', 'Lean');
insert into "tags" ("name") values ('HEVC') on conflict ("name") do nothing;
INSERT INTO quality_profile_tags (quality_profile_name, tag_name) VALUES ('Lean TV 1080p', 'HEVC');
INSERT INTO quality_groups (quality_profile_name, name) VALUES ('Lean TV 1080p', '1080p');
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('Lean TV 1080p', '1080p', 'WEBDL-1080p', 0);
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('Lean TV 1080p', '1080p', 'WEBRip-1080p', 1);
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('Lean TV 1080p', '1080p', 'Bluray-1080p', 2);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('Lean TV 1080p', NULL, '1080p', 0, 1, 1);
INSERT INTO quality_groups (quality_profile_name, name) VALUES ('Lean TV 1080p', 'WEB 720p');
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('Lean TV 1080p', 'WEB 720p', 'WEBDL-720p', 0);
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('Lean TV 1080p', 'WEB 720p', 'WEBRip-720p', 1);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('Lean TV 1080p', NULL, 'WEB 720p', 1, 1, 0);
INSERT INTO quality_groups (quality_profile_name, name) VALUES ('Lean TV 1080p', 'WEB 480p');
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('Lean TV 1080p', 'WEB 480p', 'WEBDL-480p', 0);
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('Lean TV 1080p', 'WEB 480p', 'WEBRip-480p', 1);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('Lean TV 1080p', NULL, 'WEB 480p', 2, 1, 0);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('Lean TV 1080p', 'DVD', NULL, 3, 1, 0);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('Lean TV 1080p', 'SDTV', NULL, 4, 1, 0);
INSERT INTO quality_profile_languages (quality_profile_name, language_name, type) SELECT 'Lean TV 1080p', language_name, type FROM quality_profile_languages WHERE quality_profile_name = 'TV 1080p';
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) SELECT 'Lean TV 1080p', custom_format_name, arr_type, score FROM quality_profile_custom_formats WHERE quality_profile_name = 'TV 1080p';
DELETE FROM quality_profile_custom_formats WHERE quality_profile_name = 'Lean TV 1080p' AND custom_format_name = 'x265';
DELETE FROM quality_profile_custom_formats WHERE quality_profile_name = 'Lean TV 1080p' AND custom_format_name = 'No Audio';
UPDATE quality_profile_custom_formats SET score = 1450 WHERE quality_profile_name = 'Lean TV 1080p' AND custom_format_name = 'HD Bluray Tier 01';
UPDATE quality_profile_custom_formats SET score = 1400 WHERE quality_profile_name = 'Lean TV 1080p' AND custom_format_name = 'HD Bluray Tier 02';
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean TV 1080p', 'Lean 1080p WEB-DL HEVC', 'sonarr', 2400);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean TV 1080p', 'Lean HONE WEB', 'sonarr', 2400);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean TV 1080p', 'Lean 1080p Bluray HEVC Tier 1', 'sonarr', 2300);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean TV 1080p', 'Lean HONE Bluray', 'sonarr', 2300);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean TV 1080p', 'Lean 1080p Efficient TV Bluray Tier 1', 'sonarr', 2060);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean TV 1080p', 'Lean QxR Bluray', 'sonarr', 2060);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean TV 1080p', 'Lean TAoE Bluray', 'sonarr', 2060);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean TV 1080p', 'Lean Vialle Bluray', 'sonarr', 2060);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean TV 1080p', 'Lean 1080p Efficient TV Bluray Tier 2', 'sonarr', 2053);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean TV 1080p', 'Lean 1080p Efficient TV Bluray Tier 3', 'sonarr', 2047);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean TV 1080p', 'Lean 1080p Efficient TV Bluray Tier 4', 'sonarr', 2040);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean TV 1080p', 'Lean 1080p Efficient TV Bluray Tier 5', 'sonarr', 2033);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean TV 1080p', 'Lean 1080p Efficient TV WEB Tier 1', 'sonarr', 1933);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean TV 1080p', 'Lean QxR WEB', 'sonarr', 1933);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean TV 1080p', 'Lean TAoE WEB', 'sonarr', 1933);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean TV 1080p', 'Lean Vialle WEB', 'sonarr', 1933);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean TV 1080p', 'Lean Weasley WEB', 'sonarr', 1933);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean TV 1080p', 'Lean 1080p Efficient TV WEB Tier 2', 'sonarr', 1927);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean TV 1080p', 'Lean 1080p Efficient TV WEB Tier 3', 'sonarr', 1920);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean TV 1080p', 'Lean 1080p Efficient TV WEB Tier 4', 'sonarr', 1913);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean TV 1080p', 'Lean 1080p Efficient TV Bluray Tier 6', 'sonarr', 1907);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean TV 1080p', 'Lean 1080p Efficient TV WEB Tier 5', 'sonarr', 1900);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean TV 1080p', 'Lean x265 (Untrusted)', 'sonarr', -10000);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) SELECT 'Lean TV 1080p', 'Season Pack', 'sonarr', 25 WHERE NOT EXISTS (SELECT 1 FROM quality_profile_custom_formats WHERE quality_profile_name = 'Lean TV 1080p' AND custom_format_name = 'Season Pack');
