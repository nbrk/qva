pragma Ada_2012;
package body Qv.Random is

   ------------------------
   -- Get_Random_Integer --
   ------------------------

   function Get_Random_Integer (Min, Max : Integer) return Integer is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Get_Random_Integer unimplemented");
      return
        raise Program_Error with "Unimplemented function Get_Random_Integer";
   end Get_Random_Integer;

   ---------------------
   -- Set_Random_Seed --
   ---------------------

   procedure Set_Random_Seed (N : Natural) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Set_Random_Seed unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Random_Seed";
   end Set_Random_Seed;

end Qv.Random;
