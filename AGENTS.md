Run `docker build -t docker-manjaro-texlive:test .` after changing `Dockerfile` or `build-and-deploy.yml`.

Keep the base image reference centralized in the top-level Docker `ARG`s. When bumping `danysk/manjaro-with-zsh`, update both the tag and the pinned digest together and keep `FROM` lines referencing the same `tag@sha256` pair.

Preserve the current multi-stage Dockerfile structure unless a real image-layout change is required. Prefer minimal edits to package installation and cache-cleanup steps.

When changing the GitHub Actions workflow, keep the existing behavior of building both `latest` and computed version tags, and avoid adding alternate build paths unless the repository is being intentionally reworked.
