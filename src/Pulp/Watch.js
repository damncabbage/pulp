// module Pulp.Watch

"use strict";

exports.watch = function watch(directories) {
  return function(act) {
    var Watchpack = require("watchpack");
    var watchpack = new Watchpack();
    watchpack.watch([], directories, Date.now() - 10000);
    watchpack.on("change", function(path) {
      act(path)();
    });
  };
};

exports.minimatch = require("minimatch");