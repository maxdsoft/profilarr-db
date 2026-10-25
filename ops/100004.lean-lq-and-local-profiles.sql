-- Lean: storage-first and special-purpose Sonarr profiles.
--
-- 1080p LQ: every 1080p source in one group, ranked by small-file encoders
--   (SIDCA lists), x265 slightly preferred.
-- 1080p LQ - No Upgrades Min 0: the same scoring with upgrades off and no minimum.
-- Simpsons 4:3: 480p only, upgrades off, for the original 4:3 broadcast seasons.

insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('Lean SIDCA Groups', '(?<=^|[\s.-])(ELiTE|MeGusta|PSA)\b', 'Small-file encoders preferred by the LQ profiles.', NULL);
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean SIDCA Groups', 'Lean');
insert into "tags" ("name") values ('LQ') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean SIDCA Groups', 'LQ');
insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean SIDCA Groups', 'Release Group');
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('Lean SIDCA Fallback Groups', '(?<=^|[\s.-])(ASTRiD|CBFM|CtrlHD|DARKFLiX|DEFLATE|EDPH|HANDJOB|HODL|iVy|KONTRAST|MacP|PLUTONiUM|PHOCiS|RARBG|ViETNAM|YAWNiX|YIFY|YTS)\b', 'Fallback small-file encoders for the LQ profiles.', NULL);
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean SIDCA Fallback Groups', 'Lean');
insert into "tags" ("name") values ('LQ') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean SIDCA Fallback Groups', 'LQ');
insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean SIDCA Fallback Groups', 'Release Group');
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('Lean 480p Bluray Groups', '(?<=^|[\s.-])(SoLaR|ZoroSenpai|c0kE|Dariush|HaB|TBB|EDPH|GS88|KnG|playSD|PTer|rttr|HANDJOB|PTP)\b', '480p Bluray encoders.', NULL);
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean 480p Bluray Groups', 'Lean');
insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean 480p Bluray Groups', 'Release Group');
insert into "custom_formats" ("name", "description") values ('Lean SIDCA Groups', 'Preferred small-file encoders.');
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean SIDCA Groups', 'Lean');
insert into "tags" ("name") values ('LQ') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean SIDCA Groups', 'LQ');
insert into "tags" ("name") values ('Group Tier') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean SIDCA Groups', 'Group Tier');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean SIDCA Groups', 'Group', 'release_group', 'all', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean SIDCA Groups', 'Group', 'Lean SIDCA Groups');
insert into "custom_formats" ("name", "description") values ('Lean SIDCA Fallback Groups', 'Fallback small-file encoders.');
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean SIDCA Fallback Groups', 'Lean');
insert into "tags" ("name") values ('LQ') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean SIDCA Fallback Groups', 'LQ');
insert into "tags" ("name") values ('Group Tier') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean SIDCA Fallback Groups', 'Group Tier');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean SIDCA Fallback Groups', 'Group', 'release_group', 'all', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean SIDCA Fallback Groups', 'Group', 'Lean SIDCA Fallback Groups');
insert into "custom_formats" ("name", "description") values ('Lean x265 (HD)', 'x265 below 2160p.');
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean x265 (HD)', 'Lean');
insert into "tags" ("name") values ('HEVC') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean x265 (HD)', 'HEVC');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean x265 (HD)', 'x265', 'release_title', 'all', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean x265 (HD)', 'x265', 'x265');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean x265 (HD)', 'Not 2160p', 'resolution', 'all', 1, 1);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('Lean x265 (HD)', 'Not 2160p', '2160p');
insert into "custom_formats" ("name", "description") values ('Lean 480p Bluray', '480p Bluray.');
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean 480p Bluray', 'Lean');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean 480p Bluray', '480p', 'resolution', 'all', 0, 1);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('Lean 480p Bluray', '480p', '480p');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean 480p Bluray', 'Bluray', 'source', 'all', 0, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('Lean 480p Bluray', 'Bluray', 'bluray');
insert into "custom_formats" ("name", "description") values ('Lean 480p WEB-DL', '480p WEB-DL.');
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean 480p WEB-DL', 'Lean');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean 480p WEB-DL', '480p', 'resolution', 'all', 0, 1);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('Lean 480p WEB-DL', '480p', '480p');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean 480p WEB-DL', 'WEB-DL', 'source', 'all', 0, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('Lean 480p WEB-DL', 'WEB-DL', 'web_dl');
insert into "custom_formats" ("name", "description") values ('Lean 480p Bluray Tiers', '480p Bluray from a tiered encoder.');
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean 480p Bluray Tiers', 'Lean');
insert into "tags" ("name") values ('Group Tier') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean 480p Bluray Tiers', 'Group Tier');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean 480p Bluray Tiers', '480p', 'resolution', 'all', 0, 1);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('Lean 480p Bluray Tiers', '480p', '480p');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean 480p Bluray Tiers', 'Bluray', 'source', 'all', 0, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('Lean 480p Bluray Tiers', 'Bluray', 'bluray');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean 480p Bluray Tiers', 'Group', 'release_group', 'all', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean 480p Bluray Tiers', 'Group', 'Lean 480p Bluray Groups');

-- 1080p LQ
insert into "quality_profiles" ("name", "description", "upgrades_allowed", "minimum_custom_format_score", "upgrade_until_score", "upgrade_score_increment") values ('1080p LQ', 'For shows where storage matters more than quality.
- Prefers small-file encoders and x265; any 1080p source is equal.
- Upgrades within those groups are allowed.', 1, 1, 10000, 1);
insert into "tags" ("name") values ('1080p') on conflict ("name") do nothing;
INSERT INTO quality_profile_tags (quality_profile_name, tag_name) VALUES ('1080p LQ', '1080p');
insert into "tags" ("name") values ('Sonarr') on conflict ("name") do nothing;
INSERT INTO quality_profile_tags (quality_profile_name, tag_name) VALUES ('1080p LQ', 'Sonarr');
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO quality_profile_tags (quality_profile_name, tag_name) VALUES ('1080p LQ', 'Lean');
insert into "tags" ("name") values ('LQ') on conflict ("name") do nothing;
INSERT INTO quality_profile_tags (quality_profile_name, tag_name) VALUES ('1080p LQ', 'LQ');
INSERT INTO quality_groups (quality_profile_name, name) VALUES ('1080p LQ', '1080p');
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('1080p LQ', '1080p', 'WEBDL-1080p', 0);
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('1080p LQ', '1080p', 'WEBRip-1080p', 1);
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('1080p LQ', '1080p', 'Bluray-1080p', 2);
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('1080p LQ', '1080p', 'HDTV-1080p', 3);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p LQ', NULL, '1080p', 0, 1, 1);
INSERT INTO quality_groups (quality_profile_name, name) VALUES ('1080p LQ', '720p');
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('1080p LQ', '720p', 'WEBRip-720p', 0);
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('1080p LQ', '720p', 'WEBDL-720p', 1);
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('1080p LQ', '720p', 'HDTV-720p', 2);
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('1080p LQ', '720p', 'Bluray-720p', 3);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p LQ', NULL, '720p', 1, 1, 0);
INSERT INTO quality_groups (quality_profile_name, name) VALUES ('1080p LQ', '480p');
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('1080p LQ', '480p', 'WEBDL-480p', 0);
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('1080p LQ', '480p', 'WEBRip-480p', 1);
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('1080p LQ', '480p', 'Bluray-480p', 2);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p LQ', NULL, '480p', 2, 1, 0);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p LQ', 'DVD', NULL, 3, 1, 0);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p LQ', 'SDTV', NULL, 4, 1, 0);
INSERT INTO quality_profile_languages (quality_profile_name, language_name, type) VALUES ('1080p LQ', 'Original', 'must');
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p LQ', 'Lean SIDCA Groups', 'sonarr', 300);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p LQ', 'Lean SIDCA Fallback Groups', 'sonarr', 250);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p LQ', 'Lean x265 (HD)', 'sonarr', 50);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p LQ', 'WEB Tier 01', 'sonarr', 5);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p LQ', 'WEB Tier 02', 'sonarr', 4);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p LQ', 'WEB Tier 03', 'sonarr', 3);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p LQ', '7.1', 'sonarr', 2);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p LQ', 'Dolby Digital +', 'sonarr', 2);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p LQ', '5.1', 'sonarr', 1);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p LQ', 'Dolby Digital', 'sonarr', 1);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p LQ', 'Accessibility', 'sonarr', -10000);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p LQ', 'Group Missing', 'sonarr', -10000);

-- 1080p LQ - No Upgrades Min 0
insert into "quality_profiles" ("name", "description", "upgrades_allowed", "minimum_custom_format_score", "upgrade_until_score", "upgrade_score_increment") values ('1080p LQ - No Upgrades Min 0', '1080p LQ with upgrades off and no minimum score.
- Grabs once and keeps the file.', 0, 0, 10000, 1);
insert into "tags" ("name") values ('1080p') on conflict ("name") do nothing;
INSERT INTO quality_profile_tags (quality_profile_name, tag_name) VALUES ('1080p LQ - No Upgrades Min 0', '1080p');
insert into "tags" ("name") values ('Sonarr') on conflict ("name") do nothing;
INSERT INTO quality_profile_tags (quality_profile_name, tag_name) VALUES ('1080p LQ - No Upgrades Min 0', 'Sonarr');
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO quality_profile_tags (quality_profile_name, tag_name) VALUES ('1080p LQ - No Upgrades Min 0', 'Lean');
insert into "tags" ("name") values ('LQ') on conflict ("name") do nothing;
INSERT INTO quality_profile_tags (quality_profile_name, tag_name) VALUES ('1080p LQ - No Upgrades Min 0', 'LQ');
INSERT INTO quality_groups (quality_profile_name, name) VALUES ('1080p LQ - No Upgrades Min 0', '1080p');
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('1080p LQ - No Upgrades Min 0', '1080p', 'WEBDL-1080p', 0);
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('1080p LQ - No Upgrades Min 0', '1080p', 'WEBRip-1080p', 1);
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('1080p LQ - No Upgrades Min 0', '1080p', 'Bluray-1080p', 2);
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('1080p LQ - No Upgrades Min 0', '1080p', 'HDTV-1080p', 3);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p LQ - No Upgrades Min 0', NULL, '1080p', 0, 1, 1);
INSERT INTO quality_groups (quality_profile_name, name) VALUES ('1080p LQ - No Upgrades Min 0', '720p');
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('1080p LQ - No Upgrades Min 0', '720p', 'WEBRip-720p', 0);
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('1080p LQ - No Upgrades Min 0', '720p', 'WEBDL-720p', 1);
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('1080p LQ - No Upgrades Min 0', '720p', 'HDTV-720p', 2);
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('1080p LQ - No Upgrades Min 0', '720p', 'Bluray-720p', 3);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p LQ - No Upgrades Min 0', NULL, '720p', 1, 1, 0);
INSERT INTO quality_groups (quality_profile_name, name) VALUES ('1080p LQ - No Upgrades Min 0', '480p');
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('1080p LQ - No Upgrades Min 0', '480p', 'WEBDL-480p', 0);
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('1080p LQ - No Upgrades Min 0', '480p', 'WEBRip-480p', 1);
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('1080p LQ - No Upgrades Min 0', '480p', 'Bluray-480p', 2);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p LQ - No Upgrades Min 0', NULL, '480p', 2, 1, 0);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p LQ - No Upgrades Min 0', 'DVD', NULL, 3, 1, 0);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('1080p LQ - No Upgrades Min 0', 'SDTV', NULL, 4, 1, 0);
INSERT INTO quality_profile_languages (quality_profile_name, language_name, type) VALUES ('1080p LQ - No Upgrades Min 0', 'Original', 'must');
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p LQ - No Upgrades Min 0', 'Lean SIDCA Groups', 'sonarr', 300);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p LQ - No Upgrades Min 0', 'Lean SIDCA Fallback Groups', 'sonarr', 250);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p LQ - No Upgrades Min 0', 'Lean x265 (HD)', 'sonarr', 50);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p LQ - No Upgrades Min 0', 'WEB Tier 01', 'sonarr', 5);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p LQ - No Upgrades Min 0', 'WEB Tier 02', 'sonarr', 4);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p LQ - No Upgrades Min 0', 'WEB Tier 03', 'sonarr', 3);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p LQ - No Upgrades Min 0', '7.1', 'sonarr', 2);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p LQ - No Upgrades Min 0', 'Dolby Digital +', 'sonarr', 2);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p LQ - No Upgrades Min 0', '5.1', 'sonarr', 1);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p LQ - No Upgrades Min 0', 'Dolby Digital', 'sonarr', 1);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p LQ - No Upgrades Min 0', 'Accessibility', 'sonarr', -10000);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('1080p LQ - No Upgrades Min 0', 'Group Missing', 'sonarr', -10000);

-- Simpsons 4:3
insert into "quality_profiles" ("name", "description", "upgrades_allowed", "minimum_custom_format_score", "upgrade_until_score", "upgrade_score_increment") values ('Simpsons 4:3', '480p only, for the original 4:3 seasons.
- 480p Bluray first, then 480p WEB-DL.
- Upgrades off.', 0, 0, 0, 1);
insert into "tags" ("name") values ('Sonarr') on conflict ("name") do nothing;
INSERT INTO quality_profile_tags (quality_profile_name, tag_name) VALUES ('Simpsons 4:3', 'Sonarr');
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO quality_profile_tags (quality_profile_name, tag_name) VALUES ('Simpsons 4:3', 'Lean');
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('Simpsons 4:3', 'Bluray-480p', NULL, 0, 1, 0);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('Simpsons 4:3', 'DVD', NULL, 1, 1, 0);
INSERT INTO quality_groups (quality_profile_name, name) VALUES ('Simpsons 4:3', 'WEB 480p');
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('Simpsons 4:3', 'WEB 480p', 'WEBRip-480p', 0);
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('Simpsons 4:3', 'WEB 480p', 'WEBDL-480p', 1);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('Simpsons 4:3', NULL, 'WEB 480p', 2, 1, 1);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('Simpsons 4:3', 'SDTV', NULL, 3, 1, 0);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Simpsons 4:3', 'Lean 480p Bluray', 'sonarr', 10000);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Simpsons 4:3', 'Lean 480p WEB-DL', 'sonarr', 9999);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Simpsons 4:3', 'Lean 480p Bluray Tiers', 'sonarr', 9999);
