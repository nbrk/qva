pragma Ada_2012;

with Ada.Unchecked_Conversion;

package body Qv.Font.SFML is

   function Font_To_Sf_Ptr is new Ada.Unchecked_Conversion
     (Source => Font_Type, Target => sfFont_Ptr);

   --------------------
   -- To_Sf_Font_Ptr --
   --------------------

   function To_Sf_Font_Ptr (Fnt : Font_Type) return sfFont_Ptr is
   begin
      return Font_To_Sf_Ptr (Fnt);
   end To_Sf_Font_Ptr;

end Qv.Font.SFML;
