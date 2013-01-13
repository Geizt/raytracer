// Generated by CoffeeScript 1.3.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  ({
    rt: (typeof exports !== "undefined" && exports !== null) && exports || this.rt || (this.rt = {})
  });

  rt.ReflectiveSurface = (function(_super) {

    __extends(ReflectiveSurface, _super);

    function ReflectiveSurface() {
      this.roughness = 250;
    }

    ReflectiveSurface.prototype.IsValid = function() {
      return rt.MathLibrary.IsValid(this.roughness);
    };

    ReflectiveSurface.prototype.Reflect = function(position) {
      if (position != null) {
        if (!(typeof position.IsValid === "function" ? position.IsValid() : void 0)) {
          throw new TypeError;
        }
      } else {
        throw new TypeError;
      }
      return 0.7;
    };

    ReflectiveSurface.prototype.Diffuse = function(position) {
      if (position != null) {
        if (!(typeof position.IsValid === "function" ? position.IsValid() : void 0)) {
          throw new TypeError;
        }
      } else {
        throw new TypeError;
      }
      return rt.RGBColors.white;
    };

    ReflectiveSurface.prototype.Specular = function(position) {
      if (position != null) {
        if (!(typeof position.IsValid === "function" ? position.IsValid() : void 0)) {
          throw new TypeError;
        }
      } else {
        throw new TypeError;
      }
      return rt.RGBColors.grey;
    };

    return ReflectiveSurface;

  })(rt.Surface);

}).call(this);
