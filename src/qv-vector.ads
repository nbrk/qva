with Ada.Numerics.Real_Arrays; use Ada.Numerics.Real_Arrays;

package Qv.Vector is

   --
   --  Real vectors manipulations
   --
   subtype Vector_2_Type is Real_Vector (1 .. 2);

   --  type Vector_2_Type is record
   --     X : Float;
   --     Y : Float;
   --  end record;
   --  --  Two-demensional real vectors

   type Vector_2_Array_Type is array (Positive range <>) of Vector_2_Type;
   --  Array of vectors

   Vector_2_Zero : constant Vector_2_Type := (0.0, 0.0);
   Vector_2_One  : constant Vector_2_Type := (1.0, 1.0);

private

end Qv.Vector;
