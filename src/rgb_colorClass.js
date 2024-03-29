// Generated by CoffeeScript 1.3.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  ({
    rt: (typeof exports !== "undefined" && exports !== null) && exports || this.rt || (this.rt = {})
  });

  rt.RGBColor = (function(_super) {

    __extends(RGBColor, _super);

    function RGBColor(red, green, blue) {
      var _ref, _ref1, _ref2;
      if ((red != null) && !rt.MathLibrary.IsValid(red) || (green != null) && !rt.MathLibrary.IsValid(green) || (blue != null) && !rt.MathLibrary.IsValid(blue)) {
        throw new TypeError;
      } else {
        this.red = (_ref = rt.MathLibrary.ClampScalar(red, 0.0, 1.0)) != null ? _ref : 0.0;
        this.green = (_ref1 = rt.MathLibrary.ClampScalar(green, 0.0, 1.0)) != null ? _ref1 : 0.0;
        this.blue = (_ref2 = rt.MathLibrary.ClampScalar(blue, 0.0, 1.0)) != null ? _ref2 : 0.0;
      }
    }

    RGBColor.prototype.IsValid = function() {
      return rt.MathLibrary.IsValid(this.red) && rt.MathLibrary.IsValid(this.green) && rt.MathLibrary.IsValid(this.blue);
    };

    RGBColor.prototype.Add = function(color) {
      if (color != null) {
        if (!(typeof color.IsValid === "function" ? color.IsValid() : void 0)) {
          throw new TypeError;
        }
      } else {
        throw new TypeError;
      }
      this.red = rt.MathLibrary.ClampScalar(this.red + color.red, 0.0, 1.0);
      this.green = rt.MathLibrary.ClampScalar(this.green + color.green, 0.0, 1.0);
      this.blue = rt.MathLibrary.ClampScalar(this.blue + color.blue, 0.0, 1.0);
      return this;
    };

    RGBColor.prototype.Scale = function(scalar) {
      if (!(scalar != null) || !rt.MathLibrary.IsValid(scalar)) {
        throw new TypeError;
      }
      this.red = rt.MathLibrary.ClampScalar(scalar * this.red, 0.0, 1.0);
      this.green = rt.MathLibrary.ClampScalar(scalar * this.green, 0.0, 1.0);
      this.blue = rt.MathLibrary.ClampScalar(scalar * this.blue, 0.0, 1.0);
      return this;
    };

    RGBColor.prototype.Multiply = function(color) {
      if (color != null) {
        if (!(typeof color.IsValid === "function" ? color.IsValid() : void 0)) {
          throw new TypeError;
        }
      } else {
        throw new TypeError;
      }
      this.red = rt.MathLibrary.ClampScalar(this.red * color.red, 0.0, 1.0);
      this.green = rt.MathLibrary.ClampScalar(this.green * color.green, 0.0, 1.0);
      this.blue = rt.MathLibrary.ClampScalar(this.blue * color.blue, 0.0, 1.0);
      return this;
    };

    RGBColor.prototype.getDrawingColor = function() {
      return {
        'red': Math.floor(rt.MathLibrary.ClampScalar(this.red, 0.0, 1.0) * 255),
        'green': Math.floor(rt.MathLibrary.ClampScalar(this.green, 0.0, 1.0) * 255),
        'blue': Math.floor(rt.MathLibrary.ClampScalar(this.blue, 0.0, 1.0) * 255)
      };
    };

    return RGBColor;

  })(rt.Object);

  rt.RGBColors = (function() {

    function RGBColors() {}

    RGBColors.white = new rt.RGBColor(1.0, 1.0, 1.0);

    RGBColors.grey = new rt.RGBColor(0.5, 0.5, 0.5);

    RGBColors.black = new rt.RGBColor(0.0, 0.0, 0.0);

    RGBColors.background_color = RGBColors.black;

    RGBColors.default_color = RGBColors.black;

    return RGBColors;

  })();

}).call(this);
