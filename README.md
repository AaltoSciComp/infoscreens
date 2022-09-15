# Infoscreen slides

This repository contains HTML slides for infoscreens around our
university.  Public information only (obviously).

* Live preview: https://aaltoscicomp.github.io/infoscreens/
* Deployed: https://users.aalto.fi/~darstr1/infoscreens/ (use this for
  actual screens)

## How it works

* Push to this repository
* Github actions deploys (within a minute or two) to [github
  pages](https://aaltoscicomp.github.io/infoscreens/) .  The only
  modifications are making an index.html file that lists all html
  files in the repository.  Use this to immediately check.
* Every four hours, around xx:05 (where xx%4==0), it mirrors to the
  [local mirror](https://users.aalto.fi/~darstr1/infoscreens/), and is
  displayed from there.  Include URLs from here to your info screens.


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

HTTP mirroring is probably less likely to be disruptive (or monitored)
on Github than git pulling
