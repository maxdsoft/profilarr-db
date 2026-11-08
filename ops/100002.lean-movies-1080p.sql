-- Lean: Lean Movies 1080p. A copy of Movies 1080p that prefers HEVC encodes from trusted groups.
--
-- Scores and language are copied from Movies 1080p at replay time. Then:
-- - Bluray-1080p and WEB-1080p share one group, so score decides between them;
-- - Remux-1080p joins that group, because an encode whose embedded MKV title
--   still names its remux source is read as one at import; Lean Remux is
--   banned instead, so a release named as a remux is still refused;
-- - the hallowed and BHDStudio boosts are dropped (they favour x264);
-- - lossless audio (TrueHD, DTS-HD, DTS-X) is allowed, since many of the best
--   x265 encodes carry it and audio transcodes cheaply;
-- - LQ is swapped for Lean LQ, which doesn't ban the QxR member Tigole;
-- - No Audio is dropped: scene WEB releases never name an audio codec;
-- - Dictionarry's HEVC formats keep Dictionarry's order, scored from 2175 to
--   2500, above every h264 tier; untouched HEVC WEB-DLs come first, at 2600;
-- - the minimum score stays, so a release from a group on no list can't be grabbed;
-- - upgrades stop at the top HEVC encode tier, 2500;
-- - an upgrade must gain 100, more than the gap between two HEVC tiers.

insert into "quality_profiles" ("name", "description", "upgrades_allowed", "minimum_custom_format_score", "upgrade_until_score", "upgrade_score_increment") values ('Lean Movies 1080p', 'Copy of Movies 1080p that prefers trusted x265 encodes to save space.
- x265 from the Lean HEVC tiers is preferred over x264 Bluray encodes and h264 WEB-DLs.
- Lossless audio is allowed.
- Upgrades stop at a tier 1 HEVC release.
- An upgrade must gain 100 points, more than the gap between two HEVC tiers.', 1, 750, 2500, 100);
insert into "tags" ("name") values ('1080p') on conflict ("name") do nothing;
INSERT INTO quality_profile_tags (quality_profile_name, tag_name) VALUES ('Lean Movies 1080p', '1080p');
insert into "tags" ("name") values ('Radarr') on conflict ("name") do nothing;
INSERT INTO quality_profile_tags (quality_profile_name, tag_name) VALUES ('Lean Movies 1080p', 'Radarr');
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO quality_profile_tags (quality_profile_name, tag_name) VALUES ('Lean Movies 1080p', 'Lean');
insert into "tags" ("name") values ('HEVC') on conflict ("name") do nothing;
INSERT INTO quality_profile_tags (quality_profile_name, tag_name) VALUES ('Lean Movies 1080p', 'HEVC');
INSERT INTO quality_groups (quality_profile_name, name) VALUES ('Lean Movies 1080p', '1080p');
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('Lean Movies 1080p', '1080p', 'Bluray-1080p', 0);
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('Lean Movies 1080p', '1080p', 'WEBDL-1080p', 1);
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('Lean Movies 1080p', '1080p', 'WEBRip-1080p', 2);
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('Lean Movies 1080p', '1080p', 'Remux-1080p', 3);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('Lean Movies 1080p', NULL, '1080p', 0, 1, 1);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('Lean Movies 1080p', 'Bluray-720p', NULL, 1, 1, 0);
INSERT INTO quality_groups (quality_profile_name, name) VALUES ('Lean Movies 1080p', 'WEB-720p');
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('Lean Movies 1080p', 'WEB-720p', 'WEBDL-720p', 0);
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) VALUES ('Lean Movies 1080p', 'WEB-720p', 'WEBRip-720p', 1);
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) VALUES ('Lean Movies 1080p', NULL, 'WEB-720p', 2, 1, 0);
INSERT INTO quality_profile_languages (quality_profile_name, language_name, type) SELECT 'Lean Movies 1080p', language_name, type FROM quality_profile_languages WHERE quality_profile_name = 'Movies 1080p';
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) SELECT 'Lean Movies 1080p', custom_format_name, arr_type, score FROM quality_profile_custom_formats WHERE quality_profile_name = 'Movies 1080p';
DELETE FROM quality_profile_custom_formats WHERE quality_profile_name = 'Lean Movies 1080p' AND custom_format_name = 'hallowed';
DELETE FROM quality_profile_custom_formats WHERE quality_profile_name = 'Lean Movies 1080p' AND custom_format_name = 'BHDStudio';
DELETE FROM quality_profile_custom_formats WHERE quality_profile_name = 'Lean Movies 1080p' AND custom_format_name = 'TrueHD';
DELETE FROM quality_profile_custom_formats WHERE quality_profile_name = 'Lean Movies 1080p' AND custom_format_name = 'TrueHD Missing';
DELETE FROM quality_profile_custom_formats WHERE quality_profile_name = 'Lean Movies 1080p' AND custom_format_name = 'DTS-HD MA';
DELETE FROM quality_profile_custom_formats WHERE quality_profile_name = 'Lean Movies 1080p' AND custom_format_name = 'DTS-HD HRA';
DELETE FROM quality_profile_custom_formats WHERE quality_profile_name = 'Lean Movies 1080p' AND custom_format_name = 'DTS-X';
DELETE FROM quality_profile_custom_formats WHERE quality_profile_name = 'Lean Movies 1080p' AND custom_format_name = 'LQ';
DELETE FROM quality_profile_custom_formats WHERE quality_profile_name = 'Lean Movies 1080p' AND custom_format_name = 'No Audio';
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean Movies 1080p', 'Lean LQ', 'radarr', -10000);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean Movies 1080p', 'Lean Remux', 'radarr', -10000);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean Movies 1080p', 'Lean 1080p WEB-DL HEVC', 'radarr', 2600);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean Movies 1080p', 'Lean HONE WEB', 'radarr', 2600);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean Movies 1080p', 'Lean 1080p Bluray HEVC Tier 1', 'radarr', 2500);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean Movies 1080p', 'Lean HONE Bluray', 'radarr', 2500);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean Movies 1080p', 'Lean 1080p Efficient Movie Bluray Tier 1', 'radarr', 2300);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean Movies 1080p', 'Lean QxR Bluray', 'radarr', 2300);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean Movies 1080p', 'Lean TAoE Bluray', 'radarr', 2300);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean Movies 1080p', 'Lean 1080p Efficient Movie Bluray Tier 2', 'radarr', 2294);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean Movies 1080p', 'Lean Vialle Bluray', 'radarr', 2294);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean Movies 1080p', 'Lean 1080p Efficient Movie Bluray Tier 3', 'radarr', 2289);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean Movies 1080p', 'Lean 1080p Efficient Movie Bluray Tier 4', 'radarr', 2283);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean Movies 1080p', 'Lean 1080p Efficient Movie WEB Tier 1', 'radarr', 2191);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean Movies 1080p', 'Lean QxR WEB', 'radarr', 2191);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean Movies 1080p', 'Lean TAoE WEB', 'radarr', 2191);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean Movies 1080p', 'Lean Weasley WEB', 'radarr', 2191);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean Movies 1080p', 'Lean 1080p Efficient Movie WEB Tier 2', 'radarr', 2186);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean Movies 1080p', 'Lean 1080p Efficient Movie WEB Tier 3', 'radarr', 2180);
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) VALUES ('Lean Movies 1080p', 'Lean 1080p Efficient Movie WEB Tier 4', 'radarr', 2175);
