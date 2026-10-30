-- Lean: naming, quality sizes and a delay profile to sync beside the Lean profiles.
--
-- Profilarr syncs a quality profile only with a naming config, media settings,
-- quality sizes and a delay profile chosen with it. These match settings the
-- instances already hold, so syncing them changes nothing there:
-- - Lean naming: TVDb and TMDb ids in folder names, colons replaced smartly,
--   multi-episode files as a prefixed range.
-- - Lean quality sizes: every quality spans the whole slider, so size limits
--   nothing.
-- - Lean delay profile: torrent preferred, 600 minutes for either protocol.
-- Media settings use the Sonarr and Radarr entries already here.

INSERT INTO sonarr_naming (name, rename, standard_episode_format, daily_episode_format, anime_episode_format, series_folder_format, season_folder_format, replace_illegal_characters, colon_replacement_format, custom_colon_replacement_format, multi_episode_style) VALUES ('Lean', 1, '{Series TitleYear} - S{season:00}E{episode:00} - {Episode CleanTitle} {[Custom Formats]}{[Quality Full]}{[MediaInfo VideoDynamicRangeType]}{[Mediainfo AudioCodec}{ Mediainfo AudioChannels]}{[MediaInfo VideoCodec]}{-Release Group}', '{Series TitleYear} - {Air-Date} - {Episode CleanTitle} {[Custom Formats]}{[Quality Full]}{[MediaInfo VideoDynamicRangeType]}{[Mediainfo AudioCodec}{ Mediainfo AudioChannels]}{[MediaInfo VideoCodec]}{-Release Group}', '{Series TitleYear} - S{season:00}E{episode:00} - {absolute:000} - {Episode CleanTitle} {[Custom Formats]}{[Quality Full]}{[MediaInfo VideoDynamicRangeType]}[{MediaInfo VideoBitDepth}bit]{[MediaInfo VideoCodec]}[{Mediainfo AudioCodec} { Mediainfo AudioChannels}]{MediaInfo AudioLanguages}{-Release Group}', '{Series TitleYear} {tvdb-{TvdbId}}', 'Season {season:00}', 0, 4, '', 5);
INSERT INTO radarr_naming (name, rename, movie_format, movie_folder_format, replace_illegal_characters, colon_replacement_format) VALUES ('Lean', 1, '{Movie CleanTitle} {(Release Year)} {tmdb-{TmdbId}} {edition-{Edition Tags}} {[Custom Formats]}{[Quality Full]}{[MediaInfo 3D]}{[MediaInfo VideoDynamicRangeType]}{[Mediainfo AudioCodec}{ Mediainfo AudioChannels]}{[Mediainfo VideoCodec]}{-Release Group}', '{Movie CleanTitle} ({Release Year}) {tmdb-{TmdbId}}', 0, 'smart');
INSERT INTO sonarr_quality_definitions (name, quality_name, min_size, max_size, preferred_size) SELECT 'Lean', quality_name, 0, 1000, 990 FROM sonarr_quality_definitions WHERE name = 'Sonarr';
INSERT INTO radarr_quality_definitions (name, quality_name, min_size, max_size, preferred_size) SELECT 'Lean', quality_name, 0, 2000, 1990 FROM radarr_quality_definitions WHERE name = 'Radarr';
INSERT INTO delay_profiles (name, preferred_protocol, usenet_delay, torrent_delay, bypass_if_highest_quality, bypass_if_above_custom_format_score, minimum_custom_format_score) VALUES ('Lean', 'prefer_torrent', 600, 600, 0, 0, NULL);
