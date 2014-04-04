# Cocoa Tree Seeds

[![Build Status](https://travis-ci.org/dpree/cocoa-tree-seeds.png)](https://travis-ci.org/dpree/cocoa-tree-seeds)
[![Code Climate](https://codeclimate.com/github/dpree/cocoa-tree-seeds.png)](https://codeclimate.com/github/dpree/cocoa-tree-seeds)

This project provides data for [cocoa-tree.github.io](http://cocoa-tree.github.io). Data is automatically collected and processed every 24 hours and pushed to [github.com/cocoa-tree/seeds](http://github.com/cocoa-tree/seeds).

The CocoaPods [Specs](http://github.com/cocoa-pods/Spec) repository acts as the main data source. For each CocoaPod hosted on GitHub additional information (e.g. about project activity) is fetched using the GitHub API.

## Deployment

Enable multi buildpacks via `.buildpacks`:

    heroku config:set BUILDPACK_URL=heroku config:add BUILDPACK_URL=https://github.com/ddollar/heroku-buildpack-multi.git

For phantomjs buildpack:

    heroku config:set PATH="/usr/local/bin:/usr/bin:/bin:/app/vendor/phantomjs/bin"
    heroku config:set LD_LIBRARY_PATH="/usr/local/lib:/usr/lib:/lib:/app/vendor/phantomjs/lib"

## License

This project uses [MIT-LICENSE](LICENSE.txt).
