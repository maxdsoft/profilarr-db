-- Lean: formats that let trusted x265 encodes outrank h264.
--
-- HEVC tiers follow the group lists of Dictionarry's 1080p Efficient profile
-- (Dictionarry-Hub/database, MIT), merged across Bluray and WEB sources. QxR and
-- TAoE are umbrella tags whose releases often carry only the member encoder's
-- name, so the member names are listed too, and releases tagged QxR/TAoE in the
-- title get their own format.
--
-- Every tier requires x265/HEVC in the title and a 1080p resolution, so the same
-- group's h264 releases are scored by the regular tiers instead.


-- Regular expressions
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('Lean HEVC TV Tier 1', '^(HONE|Vialle|NAN0|Weasley|QxR|afm72|Bandi|Bluespots|Celdra|FreetheFish|Garshasp|Ghost|Ime|Kappa|Langbard|LION|Panda|MONOLITH|Natty|r00t|RCVR|RZeroX|SAMPA|Silence|t3nzin|Tigole|YOGI|TAoE|Ainz|AJJMIN|ANONAZ|ArcX|bccornfo|DNU|DrainedDay|DUHIT|Erie|Frys|Goki|HxD|jb2049|JBENT|Nostradamus|r0b0t|Species180|TheSickle|xtrem3x|WEM)$', 'HEVC encoders, TV tier 1 (incl. QxR and TAoE members).', NULL);
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean HEVC TV Tier 1', 'Lean');
insert into "tags" ("name") values ('HEVC') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean HEVC TV Tier 1', 'HEVC');
insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean HEVC TV Tier 1', 'Release Group');
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('Lean HEVC TV Tier 2', '^(DarQ|GRiMM|MNHD|dkore|LSt|ARCADE|ToNaTo)$', 'HEVC encoders, TV tier 2.', NULL);
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean HEVC TV Tier 2', 'Lean');
insert into "tags" ("name") values ('HEVC') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean HEVC TV Tier 2', 'HEVC');
insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean HEVC TV Tier 2', 'Release Group');
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('Lean HEVC TV Tier 3', '^(edge2020|YELLO|OnlyWeb|R1GY3B|Ralphy|TimeDistortion|bluegreeen|cXcY|noxxus|Vyndros)$', 'HEVC encoders, TV tier 3: smaller encodes.', NULL);
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean HEVC TV Tier 3', 'Lean');
insert into "tags" ("name") values ('HEVC') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean HEVC TV Tier 3', 'HEVC');
insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean HEVC TV Tier 3', 'Release Group');
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('Lean HEVC Movie Tier 1', '^(HONE|NAN0|SQS|QxR|afm72|Bandi|Bluespots|Celdra|FreetheFish|Garshasp|Ghost|Ime|Kappa|Langbard|LION|Panda|MONOLITH|Natty|r00t|RCVR|RZeroX|SAMPA|Silence|t3nzin|Tigole|YOGI|TAoE|Ainz|AJJMIN|ANONAZ|ArcX|bccornfo|DNU|DrainedDay|DUHIT|Erie|Frys|Goki|HxD|jb2049|JBENT|Nostradamus|r0b0t|Species180|TheSickle|xtrem3x|WEM)$', 'HEVC encoders, movie tier 1 (incl. QxR and TAoE members).', NULL);
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean HEVC Movie Tier 1', 'Lean');
insert into "tags" ("name") values ('HEVC') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean HEVC Movie Tier 1', 'HEVC');
insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean HEVC Movie Tier 1', 'Release Group');
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('Lean HEVC Movie Tier 2', '^(DarQ|LSt|MNHD|SARTRE|Vialle|honeyvera|Weasley)$', 'HEVC encoders, movie tier 2.', NULL);
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean HEVC Movie Tier 2', 'Lean');
insert into "tags" ("name") values ('HEVC') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean HEVC Movie Tier 2', 'HEVC');
insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean HEVC Movie Tier 2', 'Release Group');
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('Lean HEVC Movie Tier 3', '^(GRiMM|TimeDistortion|dkore|R1GY3B|ToNaTo|Vyndros|edge2020|Chivaman|Ralphy|YELLO|bluegreeen|noxxus)$', 'HEVC encoders, movie tier 3: smaller encodes.', NULL);
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean HEVC Movie Tier 3', 'Lean');
insert into "tags" ("name") values ('HEVC') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean HEVC Movie Tier 3', 'HEVC');
insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean HEVC Movie Tier 3', 'Release Group');
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('Lean HEVC Trusted', '^(afm72|Ainz|AJJMIN|ANONAZ|ARCADE|ArcX|Bandi|bccornfo|bluegreeen|Bluespots|Celdra|Chivaman|cXcY|DarQ|dkore|DNU|DrainedDay|DUHIT|edge2020|Erie|FreetheFish|Frys|Garshasp|Ghost|Goki|GRiMM|HONE|honeyvera|HxD|Ime|jb2049|JBENT|Kappa|Langbard|LION|LSt|MNHD|MONOLITH|NAN0|Natty|Nostradamus|noxxus|OnlyWeb|Panda|QxR|r00t|r0b0t|R1GY3B|Ralphy|RCVR|RZeroX|SAMPA|SARTRE|Silence|Species180|SQS|t3nzin|TAoE|TheSickle|Tigole|TimeDistortion|ToNaTo|Vialle|Vyndros|Weasley|WEM|xtrem3x|YELLO|YOGI)$', 'Every group on a Lean HEVC tier.', NULL);
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean HEVC Trusted', 'Lean');
insert into "tags" ("name") values ('HEVC') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean HEVC Trusted', 'HEVC');
insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean HEVC Trusted', 'Release Group');
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('Lean QxR TAoE Tag', '\b(QxR|TAoE)\b', 'QxR or TAoE named in the release title.', NULL);
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean QxR TAoE Tag', 'Lean');
insert into "tags" ("name") values ('HEVC') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean QxR TAoE Tag', 'HEVC');
insert into "regular_expressions" ("name", "pattern", "description", "regex101_id") values ('Lean QxR TAoE Members', '^(QxR|afm72|Bandi|Bluespots|Celdra|FreetheFish|Garshasp|Ghost|Ime|Kappa|Langbard|LION|Panda|MONOLITH|Natty|r00t|RCVR|RZeroX|SAMPA|Silence|t3nzin|Tigole|YOGI|TAoE|Ainz|AJJMIN|ANONAZ|ArcX|bccornfo|DNU|DrainedDay|DUHIT|Erie|Frys|Goki|HxD|jb2049|JBENT|Nostradamus|r0b0t|Species180|TheSickle|xtrem3x|WEM)$', 'QxR and TAoE member encoders.', NULL);
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean QxR TAoE Members', 'Lean');
insert into "tags" ("name") values ('HEVC') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean QxR TAoE Members', 'HEVC');
insert into "tags" ("name") values ('Release Group') on conflict ("name") do nothing;
INSERT INTO regular_expression_tags (regular_expression_name, tag_name) VALUES ('Lean QxR TAoE Members', 'Release Group');

-- HEVC tiers
insert into "custom_formats" ("name", "description") values ('Lean HEVC TV Tier 1', '1080p x265 from TV tier 1 encoders.');
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean HEVC TV Tier 1', 'Lean');
insert into "tags" ("name") values ('HEVC') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean HEVC TV Tier 1', 'HEVC');
insert into "tags" ("name") values ('Group Tier') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean HEVC TV Tier 1', 'Group Tier');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean HEVC TV Tier 1', 'x265', 'release_title', 'all', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean HEVC TV Tier 1', 'x265', 'x265');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean HEVC TV Tier 1', '1080p', 'resolution', 'all', 0, 1);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('Lean HEVC TV Tier 1', '1080p', '1080p');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean HEVC TV Tier 1', 'Group', 'release_group', 'all', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean HEVC TV Tier 1', 'Group', 'Lean HEVC TV Tier 1');
insert into "custom_formats" ("name", "description") values ('Lean HEVC TV Tier 2', '1080p x265 from TV tier 2 encoders.');
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean HEVC TV Tier 2', 'Lean');
insert into "tags" ("name") values ('HEVC') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean HEVC TV Tier 2', 'HEVC');
insert into "tags" ("name") values ('Group Tier') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean HEVC TV Tier 2', 'Group Tier');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean HEVC TV Tier 2', 'x265', 'release_title', 'all', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean HEVC TV Tier 2', 'x265', 'x265');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean HEVC TV Tier 2', '1080p', 'resolution', 'all', 0, 1);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('Lean HEVC TV Tier 2', '1080p', '1080p');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean HEVC TV Tier 2', 'Group', 'release_group', 'all', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean HEVC TV Tier 2', 'Group', 'Lean HEVC TV Tier 2');
insert into "custom_formats" ("name", "description") values ('Lean HEVC TV Tier 3', '1080p x265 from TV tier 3 encoders.');
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean HEVC TV Tier 3', 'Lean');
insert into "tags" ("name") values ('HEVC') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean HEVC TV Tier 3', 'HEVC');
insert into "tags" ("name") values ('Group Tier') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean HEVC TV Tier 3', 'Group Tier');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean HEVC TV Tier 3', 'x265', 'release_title', 'all', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean HEVC TV Tier 3', 'x265', 'x265');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean HEVC TV Tier 3', '1080p', 'resolution', 'all', 0, 1);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('Lean HEVC TV Tier 3', '1080p', '1080p');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean HEVC TV Tier 3', 'Group', 'release_group', 'all', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean HEVC TV Tier 3', 'Group', 'Lean HEVC TV Tier 3');
insert into "custom_formats" ("name", "description") values ('Lean HEVC Movie Tier 1', '1080p x265 from movie tier 1 encoders.');
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean HEVC Movie Tier 1', 'Lean');
insert into "tags" ("name") values ('HEVC') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean HEVC Movie Tier 1', 'HEVC');
insert into "tags" ("name") values ('Group Tier') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean HEVC Movie Tier 1', 'Group Tier');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean HEVC Movie Tier 1', 'x265', 'release_title', 'all', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean HEVC Movie Tier 1', 'x265', 'x265');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean HEVC Movie Tier 1', '1080p', 'resolution', 'all', 0, 1);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('Lean HEVC Movie Tier 1', '1080p', '1080p');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean HEVC Movie Tier 1', 'Group', 'release_group', 'all', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean HEVC Movie Tier 1', 'Group', 'Lean HEVC Movie Tier 1');
insert into "custom_formats" ("name", "description") values ('Lean HEVC Movie Tier 2', '1080p x265 from movie tier 2 encoders.');
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean HEVC Movie Tier 2', 'Lean');
insert into "tags" ("name") values ('HEVC') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean HEVC Movie Tier 2', 'HEVC');
insert into "tags" ("name") values ('Group Tier') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean HEVC Movie Tier 2', 'Group Tier');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean HEVC Movie Tier 2', 'x265', 'release_title', 'all', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean HEVC Movie Tier 2', 'x265', 'x265');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean HEVC Movie Tier 2', '1080p', 'resolution', 'all', 0, 1);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('Lean HEVC Movie Tier 2', '1080p', '1080p');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean HEVC Movie Tier 2', 'Group', 'release_group', 'all', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean HEVC Movie Tier 2', 'Group', 'Lean HEVC Movie Tier 2');
insert into "custom_formats" ("name", "description") values ('Lean HEVC Movie Tier 3', '1080p x265 from movie tier 3 encoders.');
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean HEVC Movie Tier 3', 'Lean');
insert into "tags" ("name") values ('HEVC') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean HEVC Movie Tier 3', 'HEVC');
insert into "tags" ("name") values ('Group Tier') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean HEVC Movie Tier 3', 'Group Tier');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean HEVC Movie Tier 3', 'x265', 'release_title', 'all', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean HEVC Movie Tier 3', 'x265', 'x265');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean HEVC Movie Tier 3', '1080p', 'resolution', 'all', 0, 1);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('Lean HEVC Movie Tier 3', '1080p', '1080p');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean HEVC Movie Tier 3', 'Group', 'release_group', 'all', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean HEVC Movie Tier 3', 'Group', 'Lean HEVC Movie Tier 3');

-- QxR/TAoE tagged in the title but released under another name
insert into "custom_formats" ("name", "description") values ('Lean HEVC QxR TAoE Tagged', '1080p x265 tagged QxR or TAoE whose release group is not a listed member. Scored as tier 1.');
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean HEVC QxR TAoE Tagged', 'Lean');
insert into "tags" ("name") values ('HEVC') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean HEVC QxR TAoE Tagged', 'HEVC');
insert into "tags" ("name") values ('Group Tier') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean HEVC QxR TAoE Tagged', 'Group Tier');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean HEVC QxR TAoE Tagged', 'x265', 'release_title', 'all', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean HEVC QxR TAoE Tagged', 'x265', 'x265');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean HEVC QxR TAoE Tagged', '1080p', 'resolution', 'all', 0, 1);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('Lean HEVC QxR TAoE Tagged', '1080p', '1080p');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean HEVC QxR TAoE Tagged', 'Tag', 'release_title', 'all', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean HEVC QxR TAoE Tagged', 'Tag', 'Lean QxR TAoE Tag');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean HEVC QxR TAoE Tagged', 'Not Member', 'release_group', 'all', 1, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean HEVC QxR TAoE Tagged', 'Not Member', 'Lean QxR TAoE Members');

-- Untouched HEVC WEB-DLs from the TRaSH WEB tier groups
insert into "custom_formats" ("name", "description") values ('Lean HEVC WEB-DL', 'Untouched 1080p h265 WEB-DL from a TRaSH WEB tier 01-03 group.');
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean HEVC WEB-DL', 'Lean');
insert into "tags" ("name") values ('HEVC') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean HEVC WEB-DL', 'HEVC');
insert into "tags" ("name") values ('WEB-DL') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean HEVC WEB-DL', 'WEB-DL');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean HEVC WEB-DL', 'x265', 'release_title', 'all', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean HEVC WEB-DL', 'x265', 'x265');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean HEVC WEB-DL', '1080p', 'resolution', 'all', 0, 1);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('Lean HEVC WEB-DL', '1080p', '1080p');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean HEVC WEB-DL', 'WEB-DL', 'source', 'all', 0, 1);
INSERT INTO condition_sources (custom_format_name, condition_name, source) VALUES ('Lean HEVC WEB-DL', 'WEB-DL', 'web_dl');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean HEVC WEB-DL', 'WEB Tier 01 (Sonarr)', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean HEVC WEB-DL', 'WEB Tier 01 (Sonarr)', 'TRaSH WEB Tier 01 (Sonarr)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean HEVC WEB-DL', 'WEB Tier 01 (Radarr)', 'release_group', 'radarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean HEVC WEB-DL', 'WEB Tier 01 (Radarr)', 'TRaSH WEB Tier 01 (Radarr)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean HEVC WEB-DL', 'WEB Tier 02 (Sonarr)', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean HEVC WEB-DL', 'WEB Tier 02 (Sonarr)', 'TRaSH WEB Tier 02 (Sonarr)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean HEVC WEB-DL', 'WEB Tier 02 (Radarr)', 'release_group', 'radarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean HEVC WEB-DL', 'WEB Tier 02 (Radarr)', 'TRaSH WEB Tier 02 (Radarr)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean HEVC WEB-DL', 'WEB Tier 03 (Sonarr)', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean HEVC WEB-DL', 'WEB Tier 03 (Sonarr)', 'TRaSH WEB Tier 03 (Sonarr)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean HEVC WEB-DL', 'WEB Tier 03 (Radarr)', 'release_group', 'radarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean HEVC WEB-DL', 'WEB Tier 03 (Radarr)', 'TRaSH WEB Tier 03 (Radarr)');

-- Untrusted x265 below 2160p. Replaces the upstream x265 ban in Lean profiles:
-- the TRaSH WEB tier groups and every Lean HEVC group are exempt.
insert into "custom_formats" ("name", "description") values ('Lean x265 (Untrusted)', 'x265 below 2160p from a group on no trusted list.');
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean x265 (Untrusted)', 'Lean');
insert into "tags" ("name") values ('HEVC') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean x265 (Untrusted)', 'HEVC');
insert into "tags" ("name") values ('Banned') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean x265 (Untrusted)', 'Banned');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean x265 (Untrusted)', 'x265', 'release_title', 'all', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean x265 (Untrusted)', 'x265', 'x265');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean x265 (Untrusted)', 'Not 2160p', 'resolution', 'all', 1, 1);
INSERT INTO condition_resolutions (custom_format_name, condition_name, resolution) VALUES ('Lean x265 (Untrusted)', 'Not 2160p', '2160p');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean x265 (Untrusted)', 'Not Lean Trusted', 'release_group', 'all', 1, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean x265 (Untrusted)', 'Not Lean Trusted', 'Lean HEVC Trusted');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean x265 (Untrusted)', 'Not QxR TAoE Tag', 'release_title', 'all', 1, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean x265 (Untrusted)', 'Not QxR TAoE Tag', 'Lean QxR TAoE Tag');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean x265 (Untrusted)', 'Not WEB Tier 01 (Sonarr)', 'release_group', 'sonarr', 1, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean x265 (Untrusted)', 'Not WEB Tier 01 (Sonarr)', 'TRaSH WEB Tier 01 (Sonarr)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean x265 (Untrusted)', 'Not WEB Tier 01 (Radarr)', 'release_group', 'radarr', 1, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean x265 (Untrusted)', 'Not WEB Tier 01 (Radarr)', 'TRaSH WEB Tier 01 (Radarr)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean x265 (Untrusted)', 'Not WEB Tier 02 (Sonarr)', 'release_group', 'sonarr', 1, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean x265 (Untrusted)', 'Not WEB Tier 02 (Sonarr)', 'TRaSH WEB Tier 02 (Sonarr)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean x265 (Untrusted)', 'Not WEB Tier 02 (Radarr)', 'release_group', 'radarr', 1, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean x265 (Untrusted)', 'Not WEB Tier 02 (Radarr)', 'TRaSH WEB Tier 02 (Radarr)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean x265 (Untrusted)', 'Not WEB Tier 03 (Sonarr)', 'release_group', 'sonarr', 1, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean x265 (Untrusted)', 'Not WEB Tier 03 (Sonarr)', 'TRaSH WEB Tier 03 (Sonarr)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean x265 (Untrusted)', 'Not WEB Tier 03 (Radarr)', 'release_group', 'radarr', 1, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean x265 (Untrusted)', 'Not WEB Tier 03 (Radarr)', 'TRaSH WEB Tier 03 (Radarr)');

-- LQ without Tigole. Tigole is a QxR member encoder; the upstream LQ list bans
-- the name, which would refuse untagged Tigole releases. Built from the upstream
-- pattern at replay time, so other LQ changes carry over.
INSERT INTO regular_expressions (name, pattern, description, regex101_id) SELECT 'Lean TRaSH LQ (Radarr)', replace(pattern, '|Tigole|', '|'), 'TRaSH LQ (Radarr) without Tigole.', NULL FROM regular_expressions WHERE name = 'TRaSH LQ (Radarr)';
insert into "custom_formats" ("name", "description") values ('Lean LQ', 'LQ, with Tigole allowed.');
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean LQ', 'Lean');
insert into "tags" ("name") values ('Banned') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean LQ', 'Banned');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean LQ', 'TRaSH LQ (Radarr)', 'release_group', 'radarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean LQ', 'TRaSH LQ (Radarr)', 'Lean TRaSH LQ (Radarr)');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean LQ', 'TRaSH LQ (Sonarr)', 'release_group', 'sonarr', 0, 0);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean LQ', 'TRaSH LQ (Sonarr)', 'TRaSH LQ (Sonarr)');

-- Anime: any HEVC release
insert into "custom_formats" ("name", "description") values ('Lean Anime HEVC', 'x265/HEVC named in the release title.');
insert into "tags" ("name") values ('Lean') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean Anime HEVC', 'Lean');
insert into "tags" ("name") values ('HEVC') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean Anime HEVC', 'HEVC');
insert into "tags" ("name") values ('Anime') on conflict ("name") do nothing;
INSERT INTO custom_format_tags (custom_format_name, tag_name) VALUES ('Lean Anime HEVC', 'Anime');
INSERT INTO custom_format_conditions (custom_format_name, name, type, arr_type, negate, required) VALUES ('Lean Anime HEVC', 'x265', 'release_title', 'all', 0, 1);
INSERT INTO condition_patterns (custom_format_name, condition_name, regular_expression_name) VALUES ('Lean Anime HEVC', 'x265', 'x265');
