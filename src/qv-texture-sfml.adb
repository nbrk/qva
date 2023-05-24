pragma Ada_2012;
with Ada.Unchecked_Conversion;
package body Qv.Texture.SFML is

   function Texture_To_Sf_Ptr is new Ada.Unchecked_Conversion
     (Source => Texture_Type, Target => sfTexture_Ptr);

   -----------------------
   -- To_Sf_Texture_Ptr --
   -----------------------

   function To_Sf_Texture_Ptr (Tex : Texture_Type) return sfTexture_Ptr is
   begin
      return Texture_To_Sf_Ptr (Tex);
   end To_Sf_Texture_Ptr;

end Qv.Texture.SFML;
