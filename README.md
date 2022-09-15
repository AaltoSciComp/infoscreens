# Infoscreen slides

This repository contains HTML slides for infoscreens around our
university.  Public information only (obviously).

Preview: https://aaltoscicomp.github.io/infoscreens/
Currently deployed locally at different places, ask around.



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

