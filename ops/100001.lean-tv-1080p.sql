-- Lean: Lean TV 1080p. A copy of TV 1080p that prefers trusted x265 encodes.
--
-- Scores, quality list and language are copied from TV 1080p at replay time, so
-- upstream changes to its bans and tiers carry over. Then:
-- - the 1080p qualities share one group, so a Bluray-sourced x265 encode can
--   outrank a WEB-DL on score alone;
-- - HD Bluray tiers drop below the WEB tiers, so flattening doesn't start
--   preferring larger h264 Bluray encodes;
-- - the x265 ban is replaced by Lean x265 (Untrusted);
-- - HEVC tiers 1-2 and HEVC WEB-DLs sit above every h264 tier, tier 3 just above
--   the top h264 WEB tier;
-- - upgrades stop once a tier 1 HEVC file is in place.

insert into "quality_profiles" ("name", "description", "upgrades_allowed", "minimum_custom_format_score", "upgrade_until_score", "upgrade_score_increment") values ('Lean TV 1080p', 'Copy of TV 1080p that prefers trusted x265 encodes to save space.
- x265 from the Lean HEVC tiers is preferred over h264 WEB-DLs; untrusted x265 is banned.
- h264 WEB-DLs remain the fallback when no trusted x265 release exists.
- Upgrades stop at a tier 1 HEVC release.', 1, 0, 2300, 1);
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
UPDATE quality_profile_custom_formats SET score = 1450 WHERE quality_profile_name = 'Lean TV 1080p' AND custom_format_name = 'HD Bluray Tier 01';
UPDATE quality_profile_custom_formats SET score = 1400 WHERE quality_profile_name = 'Lean TV 1080p' AND custom_format_name = 'HD Bluray Tier 02';
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean TV 1080p', 'Lean HEVC TV Tier 1', 'sonarr', 2300);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean TV 1080p', 'Lean HEVC QxR TAoE Tagged', 'sonarr', 2300);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean TV 1080p', 'Lean HEVC TV Tier 2', 'sonarr', 2200);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean TV 1080p', 'Lean HEVC WEB-DL', 'sonarr', 2100);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean TV 1080p', 'Lean HEVC TV Tier 3', 'sonarr', 1850);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean TV 1080p', 'Lean x265 (Untrusted)', 'sonarr', -10000);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) SELECT 'Lean TV 1080p', 'Season Pack', 'sonarr', 25 WHERE NOT EXISTS (SELECT 1 FROM quality_profile_custom_formats WHERE quality_profile_name = 'Lean TV 1080p' AND custom_format_name = 'Season Pack');
