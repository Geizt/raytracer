// Generated by CoffeeScript 1.3.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  ({
    rt: (typeof exports !== "undefined" && exports !== null) && exports || this.rt || (this.rt = {})
  });

  rt.Ray = (function(_super) {

    __extends(Ray, _super);

    function Ray(origin, direction) {
      if ((origin != null) && (direction != null)) {
        if (!(typeof origin.IsValid === "function" ? origin.IsValid() : void 0) || !(typeof direction.IsValid === "function" ? direction.IsValid() : void 0)) {
          throw new TypeError;
        }
      } else {
        throw new TypeError;
      }
      this.origin = new rt.Vector3D(origin.x, origin.y, origin.z);
      this.direction = new rt.Vector3D(direction.x, direction.y, direction.z);
    }

    Ray.prototype.IsValid = function() {
      return this.origin.IsValid() && this.direction.IsValid();
    };

    return Ray;

  })(rt.Object);

}).call(this);
