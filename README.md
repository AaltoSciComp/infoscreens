# Infoscreen slides

This repository contains HTML slides for infoscreens around our
university.  Public information only (obviously).

* Live preview: https://aaltoscicomp.github.io/infoscreens/
* Deployed: (ask Richard or someone in SciComp for the link) (use this for
  actual screens to not cause excess Github traffic)

Any `*.html` in `slides/` ends up in `www/` and published.  Any
`*.{png,jpg,jpeg,svg}` in `slides/` ends up in `www/` with a
automatic html wrapper generated.


## How it works

* Push to this repository
* All date from slides/ is published.  All images get an auto-*.html
  made in case the image has no associated html already.
* Github actions deploys (within a minute or two) to [github
  pages](https://aaltoscicomp.github.io/infoscreens/) .  The only
  modifications are making an index.html file that lists all html
  files in the repository.  Use this to immediately check.
* Every hour, around xx:05 (could be updated), it mirrors to the local
  mirror at Aalto (ask Richard or someone in SciComp for the link,
  it's not listed here).  Include URLs from here to your info screens,
  and ...
* The infoscreens have the URLs from their in their playlists.


## Deployment

The deployment action automatically makes an index.html file.

This can be previewed on Github pages, but the Github Pages should
probably not be used for infoscreen playlists since it will make a lot
of unnecessary traffic.
https://aaltoscicomp.github.io/infoscreens/

Instead, these should be manually mirrored to somewhere else, using
a command such as this:
```
wget --recursive --mirror --page-requisites --no-host-directories --cut-dirs 1 https://aaltoscicomp.github.io/infoscreens/
```

Periodic HTTP mirroring is probably less likely to be disruptive (or
monitored) on Github than pulling an update via git.
