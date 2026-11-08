# Lean profiles for Profilarr

A fork of the [Dumpstarr database](https://github.com/Dumpstarr/Database) that adds profiles
preferring good HEVC encodes to h264, so a library gets smaller as files are upgraded. Anime gets
lighter releases and season packs, and there's a low-quality TV profile for the long-running
shows where I care more about the space than the picture.

Upstream's profiles, formats and per-show fixes are all here, unchanged. Upstream's
[README](https://github.com/Dumpstarr/Database#readme) is the guide to them. This fork adds:

| Profile | Arr | Based on |
|---|---|---|
| `Lean TV 1080p` | Sonarr | `TV 1080p` |
| `Lean Movies 1080p` | Radarr | `Movies 1080p` |
| `Lean Anime 1080p` | Sonarr, Radarr | `Anime 1080p` |
| `Lean Anime Keep` | Sonarr, Radarr | `Lean Anime 1080p`, with upgrades off |
| `Lean TV LQ` | Sonarr | `LQ 1080p` |

There's also a naming config, a quality size set and a delay profile named `Lean`, because
Profilarr only syncs a profile alongside those. They match what I already run, so you'll
probably want to pick your own when you set up a sync.

## Why

h264's wider compatibility is worth less than it used to be: many clients play HEVC, and a
server that has to transcode often transcodes to HEVC anyway (at least that's what often happens on my server). 
A well-made HEVC encode is usually a fraction of the size of the h264 release it would replace. Upstream's 
TV profile bans x265 outside its top WEB tiers, and its tiers rank release groups without regard to codec, so it keeps
the larger file even when a trusted HEVC encode exists.

## How the scoring works

**Upstream is the base.** Each Lean profile is a copy of its upstream profile, made when the
database is built (`INSERT … SELECT`), and changed after that. Upstream's bans, tiers and fixes
reach the Lean profiles at every merge.

**Dictionarry decides which HEVC groups are trusted.** The HEVC formats are copied from the
`1080p Efficient` profile in [Dictionarry's database](https://github.com/Dictionarry-Hub/database)
(MIT), each renamed `Lean …`. The copy takes every format that profile scores at or above its
lowest HEVC format, with the conditions and per-group patterns behind it. That gives per-source
tiers (TV Bluray 1–6 and WEB 1–5; movie Bluray 1–4 and WEB 1–4), per-encoder formats for QxR,
TAoE, Vialle and Weasley releases posted under another group's name, HONE's Bluray and WEB
formats, and `1080p WEB-DL HEVC` for untouched HEVC streams. A generator script I run rewrites
them from Dictionarry's current lists, so they stay Dictionarry's rather than a
snapshot.

**Dictionarry's order on Dumpstarr's scale.** Dictionarry's scores (around 900,000) can't be used
as they are, because they would swamp Dumpstarr's −10,000 bans. For each arr, the copied scores
are mapped in a straight line onto a band that starts above the best score an h264 release
reaches in the profile and ends at its upgrade-until score. A tier Dictionarry adds or moves
falls into place on the line.

| | TV (Sonarr) | Movies (Radarr) |
|---|---|---|
| Untouched HEVC WEB-DL, HONE WEB | 2400 | 2600 |
| Top HEVC encode tier (HONE Bluray) | 2300 | 2500 |
| HEVC Bluray tiers | 2060–2033 | 2300–2283 |
| HEVC WEB tiers | 1933–1900 | 2191–2175 |
| Best h264, upstream's tiers | about 1850 | about 2025–2140 |
| Upgrade until | 2300 | 2500 |

**An untouched HEVC WEB-DL ranks first.** Dictionarry puts HONE's Bluray encodes above it. This
fork ranks a streaming service's own HEVC stream rip first since there is no second encode to lose detail in, and
it is still smaller than the h264 stream from the same service. Both sit at or past
upgrade-until, so neither replaces the other once one is on disk. TBH I don't even know if many streaming services
actually stream much HEVC, but it seems reasonable that if they do they should rank above re-encodes if they are from
a good group.

**Other changes, and why:**

- **One 1080p quality group** (WEB-DL, WEBRip, Bluray-1080p), so the score decides. Otherwise the
  quality ranking would put a WEB h264 above a Bluray-sourced HEVC encode in TV, and a Bluray h264
  above a WEB HEVC in movies.
- **Remux-1080p is in that group too, and `Lean Remux` is banned.** Some encoders leave the
  source's title inside the MKV ("…Bluray Remux AVC…"), and Sonarr and Radarr believe that over the
  file name when importing. So a 5 GB HEVC encode turns up as a Remux, gets stuck at import, or
  sits on disk where literally anything counts as an upgrade. With Remux in the group, those files
  import and score like the encodes they are. `Lean Remux` matches "Remux" in a release title
  (outside DVD), so a release that actually is a remux still never gets grabbed.
- **Upstream's `No Audio` ban is dropped.** It bans any release title that doesn't name an audio
  codec, which turns out to be every scene WEB release (`Show.S01E01.1080p.WEB.H264-GROUP`) and
  the file names of some encoders' packs. That left some seasons with nothing it would grab, and
  a pile of manual imports.
- **Untrusted x265 is banned in TV.** `Lean x265 (Untrusted)` replaces upstream's `x265` ban.
  It exempts every group the copied formats name, and TRaSH's WEB tiers 01–03. Movies keep
  upstream's minimum of 750 instead, so a group on no list can't be grabbed.
- **h264 stays the fallback.** A title with no trusted HEVC release gets the same h264 file
  upstream would pick.
- **Upgrades stop at the top HEVC encode tier**, so a good file isn't replaced again and again.
- **An upgrade has to gain 100 points** (200 for anime, 20 for `Lean TV LQ`). That's more than
  the season pack bonus, so the arr doesn't grab a pack of the exact release already on disk just
  for the bonus. In TV and movies it's also more than the gap between two HEVC tiers, so a file
  isn't swapped for one a single tier up.
- **TV:** HD Bluray Tier 01 and 02 drop from 1800 and 1750 to 1450 and 1400. Once qualities are
  flattened, they would otherwise favour large h264 Bluray encodes.
- **Movies:** the hallowed and BHDStudio boosts are dropped, since both favour x264. Lossless
  audio is allowed, because many good x265 encodes carry it. Upstream's `LQ` is swapped for
  `Lean LQ`, the same pattern without Tigole, a QxR member.
- **Interactions with upstream formats:** `LQ` still bans iVy, which Dictionarry ranks in its
  lowest TV tiers. `Baseline Groups` still adds to QxR, DarQ, Vyndros, Weasley and edge2020,
  which moves them up within the HEVC order.

**Anime.** Upstream's v2 anime profile already flattens 1080p and ranks WEB tiers above BD tiers.
`Lean Anime 1080p` adds `Lean Anime HEVC` +200 and `Season Pack` +150. It lowers `Anime Dual
Audio` and `Multi-Audio` to +25, a slight preference rather than a requirement. Upgrade until is
1600. The `Lean Anime` quality sizes cap 1080p at 80 MB a minute, which turns away remux-sized
releases. Quality sizes apply to a whole arr instance, so they belong only on one that holds
nothing but anime. Upstream's bans for raws, foreign-subtitle and dub-only releases stay. These are 
literally just my own preferences tailored to my specific anime sonarr instance, so buy and large if
you are looking for something generic and "set and forget" for anime you're probably better off with 
Dumpstarr's profiles.

**Lean TV LQ.** A copy of upstream's `LQ 1080p`, which only grabs small encodes from its SIDCA
tiers (MeGusta, YIFY and friends at the top). The only changes: upgrades stop at SIDCA Tier 01
(100), an upgrade has to gain 20, and the minimum stays at 25 so nothing outside the tiers gets
grabbed. I use it for old sitcoms and the like, where a small encode is fine and ten seasons of
WEB-DLs is not. Upstream's LQ profile never got the `No Audio` ban, so there's nothing to drop
there.

## Maintenance

- This fork's ops are numbered from 100000, so every upstream op runs first. Every entity they
  create is prefixed `Lean`.
- All six (`ops/100000`–`100005`) are written by a generator script rather than by hand, and only
  the HEVC formats in `100000` come from Dictionarry. Everything else is the fork's own.
- Upstream is merged into `stable`. I run a weekly job that merges Dumpstarr, regenerates the
  HEVC formats from Dictionarry, builds the database, checks that each Lean profile still scores
  everything its upstream profile does and that every regex compiles in .NET, and opens a pull
  request with the score changes that I'll merge when I remember to.

## Credits

[Dumpstarr](https://github.com/Dumpstarr/Database) for the base database,
[Dictionarry](https://github.com/Dictionarry-Hub/database) (MIT) for the HEVC formats and group
lists, and [TRaSH Guides](https://trash-guides.info) for the tiers both build on.

(Shoutout to those guys for doing all of the real work. I had claude throw this together for me to solve some
of my personal peeves with the existing profiles. I'm far too lazy to go fully down the release scoring rabbit hole and 
storage is fucking expensive nowadays.)