with Qv.Vector; use Qv.Vector;

package Qv.Camera is

   type Camera_Type is record
      Offset   : Vector_2_Type;
      Target   : Vector_2_Type;
      Rotation : Float;
      Zoom     : Float;
   end record;
   --  Encapsulates position and orientation in 2D space

   Default_Camera : constant Camera_Type :=
     (Offset => (0.0, 0.0), Target => (0.0, 0.0), Rotation => 0.0,
      Zoom   => 1.0);

   procedure Begin_Mode_2D (Cam : Camera_Type);

   procedure End_Mode_2D;

private

end Qv.Camera;
