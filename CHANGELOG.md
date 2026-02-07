# Changelog

## [0.9.0](https://github.com/93Pd9s8Jt/atba/compare/v0.8.0...v0.9.0) (2026-02-07)


### Features

* Add support for external ids (tmdb, tvdb, imdb, and mal) when searching from usenet/torrent tabs [#64](https://github.com/93Pd9s8Jt/atba/issues/64) ([24b510d](https://github.com/93Pd9s8Jt/atba/commit/24b510d5f12e2834a9cac5789275148c79503a75))
* **library:** Add reodering / disabling the icons ([0ac1d95](https://github.com/93Pd9s8Jt/atba/commit/0ac1d95a6b16983b3cee9ab309a19257a0d45dfa))


### Bug Fixes

* Add basic migration strategy (delete table & rebuild) ([f79f662](https://github.com/93Pd9s8Jt/atba/commit/f79f662038368931ffb9185e810136f3ac164425))
* web & usenet futures weren't fetched correctly, potentially causing erroneous no downloads found ([976e25e](https://github.com/93Pd9s8Jt/atba/commit/976e25e83c07316e1ceccefa5449520f6b018125))
* **webdl:** Remove invalid type annotation, caused parsing errors in some cases ([f02175c](https://github.com/93Pd9s8Jt/atba/commit/f02175c8ea421f5d223a758f46537f16010834e9))
* **web:** Fix downloads for webdl and usenet on web ([d1d37ac](https://github.com/93Pd9s8Jt/atba/commit/d1d37ac1a1957a299f53538b78befb73a2f27eb4))

## [0.8.0](https://github.com/93Pd9s8Jt/atba/compare/v0.7.1...v0.8.0) (2026-01-18)


### Features

* Add custom theme colours ([d0093b7](https://github.com/93Pd9s8Jt/atba/commit/d0093b70ea74c9e7d58cce8b0452e051a1527a2c))
* Add more tooltips ([c4e667c](https://github.com/93Pd9s8Jt/atba/commit/c4e667cabd7388e282ed3c41177c44f727d360d9))
* **android:** Go back twice to exit ([2b37e20](https://github.com/93Pd9s8Jt/atba/commit/2b37e20be973210228b2b4dd4b309347ef56bd73))
* **player:** Add mobile subtitle & audio switching ([47f13f5](https://github.com/93Pd9s8Jt/atba/commit/47f13f5bf3e46940b365be3fb4f3ac7e8db2def7))
* **player:** Add support for rendering ass subtitles & subtitle and audio switching ([9dae688](https://github.com/93Pd9s8Jt/atba/commit/9dae688a9c4984cc1d18402b185c29725ba1a8dd))


### Bug Fixes

* Add JS call for pstream userscript to bypass cors on web ([3ec3db7](https://github.com/93Pd9s8Jt/atba/commit/3ec3db747229126a08523fb991557c4cde23a19f))
* **android:** Better onBackInvoked handling ([f1f6fa5](https://github.com/93Pd9s8Jt/atba/commit/f1f6fa5b177f3359318d09d7f952eb6b1bcfc868))
* **android:** Prevent dismissing keyboard closing app ([dd9b041](https://github.com/93Pd9s8Jt/atba/commit/dd9b0416c9ff2b85a531948e2d1a3b27ef53386d))
* Attempt to fix the js calls ([593a2d7](https://github.com/93Pd9s8Jt/atba/commit/593a2d733f6cad61a098e2328d9c94fa60658752))
* Call the correct method for web and usenet download links (and direct streaming) ([528161d](https://github.com/93Pd9s8Jt/atba/commit/528161d35f751051b4a3a998bb053ce74e5f21d9))
* Disable Android-specific permission screens on other platforms ([3a18c34](https://github.com/93Pd9s8Jt/atba/commit/3a18c3496f64b6f3409a73d2a114783776e2a60b))
* **downloads:** Actually start the download when triggering a bulk download and no folder is set ([3a18c34](https://github.com/93Pd9s8Jt/atba/commit/3a18c3496f64b6f3409a73d2a114783776e2a60b))
* Guard notifyListener in background checks ([aab60cf](https://github.com/93Pd9s8Jt/atba/commit/aab60cf96865cf337611bdc1a8dfb4a69e44ce3c))
* Guard notifyListener when refreshing torrents ([9dae688](https://github.com/93Pd9s8Jt/atba/commit/9dae688a9c4984cc1d18402b185c29725ba1a8dd))
* Hide player option on non-Android platforms; currently will just error if you try to use it ([c19c68f](https://github.com/93Pd9s8Jt/atba/commit/c19c68fab850cb4fa35cd1db6bc91154cd943009))
* Improve web compatibility & bulk downloading ([3a18c34](https://github.com/93Pd9s8Jt/atba/commit/3a18c3496f64b6f3409a73d2a114783776e2a60b))
* Only load web-specific code on web, handle window.postMessage correctly ([4d0592e](https://github.com/93Pd9s8Jt/atba/commit/4d0592e796d864c6926ab5e279b3d0e686ab8ee5))
* **player:** Default to internal player on non-Android platforms ([ef477c7](https://github.com/93Pd9s8Jt/atba/commit/ef477c7f9ba1e11a0cabb475950bce8890f55875))
* **player:** Don't show divider if there are no tracks ([8b1a4e3](https://github.com/93Pd9s8Jt/atba/commit/8b1a4e3a545c89f124b753a594d4ecbb68634885))
* **player:** Fix exit button when in fullscreen ([47f13f5](https://github.com/93Pd9s8Jt/atba/commit/47f13f5bf3e46940b365be3fb4f3ac7e8db2def7))
* **player:** Hide divider correctly ([2929bdc](https://github.com/93Pd9s8Jt/atba/commit/2929bdcedb01c030410a14689969045916f8f087))
* **player:** Only fullscreen by default on ios or android ([b12816e](https://github.com/93Pd9s8Jt/atba/commit/b12816e360b8e6903ea6f1fb2d0352370a5041ad))
* **queued:** Make queued torrents blur instantly and have selectable text ([240fe84](https://github.com/93Pd9s8Jt/atba/commit/240fe84571e02c0f607429311dd1f229fa724e45))
* Remove useless resume button, change pause button to stop button ([22a1a19](https://github.com/93Pd9s8Jt/atba/commit/22a1a190c9fde558660e12d5647d4ef571955f7e))
* **web:** Check for  dart.library.html to ensure wasm builds run correctly ([d4bf9f7](https://github.com/93Pd9s8Jt/atba/commit/d4bf9f7eb203293dde6838491ffc2828fa24c865))
* **web:** Correct icon paths in manifest.json ([2cf15ab](https://github.com/93Pd9s8Jt/atba/commit/2cf15ab7166920154469cb5eba7732d676c0895c))
* **web:** Fix downloads on web to open in new tab ([3a18c34](https://github.com/93Pd9s8Jt/atba/commit/3a18c3496f64b6f3409a73d2a114783776e2a60b))
* **web:** Fix wasm compatibility, disable some caching ([c7735ed](https://github.com/93Pd9s8Jt/atba/commit/c7735ed79f61c0ab033b9131a0e786bfa8b7147c))
* **web:** Remove features that don't work on web such as google iframe ([3a18c34](https://github.com/93Pd9s8Jt/atba/commit/3a18c3496f64b6f3409a73d2a114783776e2a60b))
* **web:** Rename Icon-192.png to icon-192.png ([46f5fee](https://github.com/93Pd9s8Jt/atba/commit/46f5fee491a858f9cb4b9a21f34698bae416138c))
* **web:** Rename Icon-512.png to icon-512.png ([4dbcbed](https://github.com/93Pd9s8Jt/atba/commit/4dbcbeda10554b278915afd070e24a825d2c86d0))
* **web:** Update icons & manifest from placeholders ([3d9b2e1](https://github.com/93Pd9s8Jt/atba/commit/3d9b2e18d1fcf84e281bfd37da351201bdde8404))

## [0.7.1](https://github.com/93Pd9s8Jt/atba/compare/v0.7.0...v0.7.1) (2026-01-07)


### Bug Fixes

* Add token to trigger release workflow ([26e6774](https://github.com/93Pd9s8Jt/atba/commit/26e67744f4ac721391f0eb01bacc60751a8833de))

## [0.7.0](https://github.com/93Pd9s8Jt/atba/compare/v0.6.3...v0.7.0) (2026-01-07)


### Features

* add copy link functionality to downloadable item detail screen, add a bit of padding ([efdb434](https://github.com/93Pd9s8Jt/atba/commit/efdb434a30ac4f38d416d249d75c44ef83970956))
* Add setting for bypassing cache on start ([30d087c](https://github.com/93Pd9s8Jt/atba/commit/30d087ce2438d6dd62cfff88d24f15dc9904b13e))
* Automatically reload on start, refactor: rename DownloadsPage and DownloadsPageState to LibraryPage and LibraryPageState ([490f79f](https://github.com/93Pd9s8Jt/atba/commit/490f79fc4f8c87326a435bd28c342e02ac6b2acd))
* Focus on search field when toggling it on ([2bbcb58](https://github.com/93Pd9s8Jt/atba/commit/2bbcb588c296b67b1889054ea2ec0c370ed89c67))
* implement streaming from library [#57](https://github.com/93Pd9s8Jt/atba/issues/57), switch video player to media_kit for better compatibility ([a5defbf](https://github.com/93Pd9s8Jt/atba/commit/a5defbfbbcf32d06d963b26a352362ff70815f09))
* restructure video player implementation with platform-specific controls ([48c4622](https://github.com/93Pd9s8Jt/atba/commit/48c46223a3cf6a1aa1e571e4eaab8e738e38c1de))
* Simple attempt to add some web compatibility ([0efb5ba](https://github.com/93Pd9s8Jt/atba/commit/0efb5bafd01f70b0d99e97dc1c7ff97bd820e9aa))
* use better copy icon, unfiy fullscreen/normal player layouts, enable  mobile player gestures, fix: change caching db path to cache directory, chore: bump gradle, kotlin versions ([192f418](https://github.com/93Pd9s8Jt/atba/commit/192f41829ddfd2bd7089751ce90561c20810a385))
* use url_launcher for opening URLs in DetailsPage (trailers) and JobsStatusPage ([92bde90](https://github.com/93Pd9s8Jt/atba/commit/92bde902880aee9687073252c14a7e76585b0ddd))


### Bug Fixes

* Add web compatibility ([b9ec86e](https://github.com/93Pd9s8Jt/atba/commit/b9ec86ee38c53ecbbf5b4dea7d8940c387f3d495))
* Prevent uncache double load on start ([e3b4179](https://github.com/93Pd9s8Jt/atba/commit/e3b41794618b3c7f0d9d1cf3c674bc92a13b558d))
