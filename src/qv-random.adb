pragma Ada_2012;

with Ada.Numerics.Float_Random;
package body Qv.Random is

   package Float_Random renames Ada.Numerics.Float_Random;

   Float_RNG : Float_Random.Generator;

   ------------------------
   -- Get_Random_Integer --
   ------------------------

   function Get_Random_Integer (Min, Max : Integer) return Integer is
   begin
      return
        Integer
          (Float (Min) +
           (Float_Random.Random (Float_RNG) * Float (Max - Min)));
   end Get_Random_Integer;

   ---------------------
   -- Set_Random_Seed --
   ---------------------

   procedure Set_Random_Seed (N : Integer) is
   begin
      Float_Random.Reset (Float_RNG, N);
   end Set_Random_Seed;

end Qv.Random;
