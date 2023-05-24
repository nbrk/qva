package Qv.Vector is

   --
   --  Real vectors manipulations
   --

   type Vector_2_Type is record
      X : Float;
      Y : Float;
   end record;
   --  Two-demensional real vectors

   type Vector_2_Array_Type is array (Positive range <>) of Vector_2_Type;
   --  Array of vectors

private

end Qv.Vector;
