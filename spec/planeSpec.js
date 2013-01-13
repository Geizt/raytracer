// Generated by CoffeeScript 1.3.3
(function() {

  ({
    rt: (typeof exports !== "undefined" && exports !== null) && exports || this.rt || (this.rt = {})
  });

  describe('Plane', function() {
    var normal, offset, plane, surface;
    normal = null;
    offset = null;
    surface = null;
    plane = null;
    beforeEach(function() {
      normal = new rt.Vector3D(0.0, 1.0, 0.0);
      offset = 1.0;
      surface = new rt.CheckerboardSurface();
      plane = new rt.Plane(normal, offset, surface);
    });
    it('is an object', function() {
      return expect(plane instanceof rt.Object).toBe(true);
    });
    it('is a geometric object', function() {
      return expect(plane instanceof rt.GeometricObject).toBe(true);
    });
    it('can be validated', function() {
      var valid_plane;
      valid_plane = plane.IsValid();
      return expect(valid_plane).toBe(true);
    });
    it('can calculate a normal', function() {
      var position;
      position = new rt.Vector3D(1.0, 0.0, 0.0);
      normal = plane.Normal(position);
      expect(normal.x).toBe(0.0);
      expect(normal.y).toBe(1.0);
      return expect(normal.z).toBe(0.0);
    });
    return it('can calculate an intersection', function() {
      var direction, intersection, origin, ray;
      origin = new rt.Vector3D(2.0, 3.0, 4.0);
      direction = new rt.Vector3D(0.0, -1.0, -1.0);
      ray = new rt.Ray(origin, direction);
      intersection = plane.Intersect(ray);
      return expect(intersection instanceof rt.Intersection).toBe(true);
    });
  });

}).call(this);