pragma Ada_2012;
package body Qv.Color.SFML is

   -----------------
   -- To_Sf_Color --
   -----------------

   function To_Sf_Color (C : Color_Type) return Sf.Graphics.Color.sfColor is
   begin
      return
        (Sf.sfUint8 (C.Red), Sf.sfUint8 (C.Green), Sf.sfUint8 (C.Blue),
         Sf.sfUint8 (C.Alpha));
   end To_Sf_Color;

end Qv.Color.SFML;
