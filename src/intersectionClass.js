// Generated by CoffeeScript 1.3.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  ({
    rt: (typeof exports !== "undefined" && exports !== null) && exports || this.rt || (this.rt = {})
  });

  rt.Intersection = (function(_super) {

    __extends(Intersection, _super);

    function Intersection(object, ray, distance) {
      if ((object != null) && (ray != null) && (distance != null)) {
        if (!object instanceof rt.GeometricObject || !(typeof object.IsValid === "function" ? object.IsValid() : void 0) || !(typeof ray.IsValid === "function" ? ray.IsValid() : void 0) || !rt.MathLibrary.IsValid(distance)) {
          throw new TypeError;
        }
      } else {
        throw new TypeError;
      }
      this.object = object;
      this.ray = ray;
      this.distance = distance;
    }

    Intersection.prototype.IsValid = function() {
      return this.object.IsValid() && this.ray.IsValid() && rt.MathLibrary.IsValid(this.distance);
    };

    return Intersection;

  })(rt.Object);

}).call(this);
