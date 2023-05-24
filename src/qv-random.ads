package Qv.Random is

   function Get_Random_Integer (Min, Max : Integer) return Integer;
   --  Get a random integer in range [Min .. Max]

   procedure Set_Random_Seed (N : Natural);
   --  Set RNG seed

end Qv.Random;
