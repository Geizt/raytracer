// Generated by CoffeeScript 1.3.3
(function() {

  ({
    rt: (typeof exports !== "undefined" && exports !== null) && exports || this.rt || (this.rt = {})
  });

  describe('Intersection', function() {
    var center, distance, intersection, radius, ray, sphere, surface;
    center = null;
    radius = null;
    surface = null;
    sphere = null;
    ray = null;
    distance = null;
    intersection = null;
    beforeEach(function() {
      center = new rt.Vector3D(0.0, 1.0, -5.0);
      radius = 1.0;
      surface = new rt.ReflectiveSurface();
      sphere = new rt.Sphere(center, radius, surface);
      ray = new rt.Ray(new rt.Vector3D(0.0, 0.0, 0.0), new rt.Vector3D(0.0, 0.0, -1.0));
      distance = 5.5;
      intersection = new rt.Intersection(sphere, ray, distance);
    });
    it('is an object', function() {
      return expect(intersection instanceof rt.Object).toBe(true);
    });
    it('is an intersection', function() {
      return expect(intersection instanceof rt.Intersection).toBe(true);
    });
    return it('can be validated', function() {
      var valid_intersection;
      valid_intersection = intersection.IsValid();
      return expect(valid_intersection).toBe(true);
    });
  });

}).call(this);