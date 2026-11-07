-- Lean: Lean TV LQ. A copy of LQ 1080p, for series where storage matters more than quality.
--
-- Scores, quality list and language are copied from LQ 1080p at replay time, so
-- upstream changes to its SIDCA tiers and bans carry over. Then:
-- - upgrades stop at SIDCA Tier 01, 100;
-- - an upgrade must gain 20: more than the season pack bonus and the audio formats
--   together, less than the gap between two SIDCA tiers;
-- - the minimum stays at 25, so only a release from a SIDCA tier is grabbed.

insert into "quality_profiles" ("name", "description", "upgrades_allowed", "minimum_custom_format_score", "upgrade_until_score", "upgrade_score_increment") values ('Lean TV LQ', 'Copy of LQ 1080p for series where storage matters more than quality.
- Small encodes from the SIDCA tiers are preferred; nothing else is grabbed.
- Upgrades stop at a SIDCA Tier 01 release.
- An upgrade must gain 20 points, more than a season pack''s bonus.', 1, 25, 100, 20);
insert into "tags" ("name") values ('1080p') on conflict ("name") do nothing;
INSERT INTO quality_profile_tags (quality_profile_name, tag_name) VALUES ('Lean TV LQ', '1080p');
insert into "tags" ("name") values ('Sonarr') on conflict ("name") do nothing;
INSERT INTO quality_profile_tags (quality_profile_name, tag_name) VALUES ('Lean TV LQ', 'Sonarr');
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO quality_profile_tags (quality_profile_name, tag_name) VALUES ('Lean TV LQ', 'Lean');
insert into "tags" ("name") values ('LQ') on conflict ("name") do nothing;
INSERT INTO quality_profile_tags (quality_profile_name, tag_name) VALUES ('Lean TV LQ', 'LQ');
INSERT INTO quality_groups (quality_profile_name, name) SELECT 'Lean TV LQ', name FROM quality_groups WHERE quality_profile_name = 'LQ 1080p';
INSERT INTO quality_group_members (quality_profile_name, quality_group_name, quality_name, position) SELECT 'Lean TV LQ', quality_group_name, quality_name, position FROM quality_group_members WHERE quality_profile_name = 'LQ 1080p';
INSERT INTO quality_profile_qualities (quality_profile_name, quality_name, quality_group_name, position, enabled, upgrade_until) SELECT 'Lean TV LQ', quality_name, quality_group_name, position, enabled, upgrade_until FROM quality_profile_qualities WHERE quality_profile_name = 'LQ 1080p' ORDER BY position;
INSERT INTO quality_profile_languages (quality_profile_name, language_name, type) SELECT 'Lean TV LQ', language_name, type FROM quality_profile_languages WHERE quality_profile_name = 'LQ 1080p';
INSERT INTO quality_profile_custom_formats (quality_profile_name, custom_format_name, arr_type, score) SELECT 'Lean TV LQ', custom_format_name, arr_type, score FROM quality_profile_custom_formats WHERE quality_profile_name = 'LQ 1080p';
