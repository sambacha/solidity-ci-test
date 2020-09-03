# Solidity-CI SVM Docker

[![Docker Build Status](https://img.shields.io/docker/build/solidity-ci/kotlin.svg)](https://hub.docker.com/r/solidity-ci/kotlin/) [![Docker Pulls](https://img.shields.io/docker/pulls/solidity-ci/kotlin.svg)](https://hub.docker.com/r/solidity-ci/kotlin/)

### Supported tags and respective `Dockerfile` links

#{range $_, $v := .Versions}

#### #{$v.Version}

#{range $_, $b := $v.Builds}
 * `#{$b.Tag}`#{range $_, $t := $b.Base.AdditionalTags}, `#{$t}`#{end} [(#{$b.Base.Base}/Dockerfile)](https://github.com/solidity-ci/docker-kotlin/blob/master/#{$b.Base.Base}/Dockerfile)
#{end}#{end}

