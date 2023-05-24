pragma Ada_2012;

with Ada.Unchecked_Conversion;
with Qv.Texture.SFML;     use Qv.Texture.SFML;
with Sf.Graphics;         use Sf.Graphics;
with Sf.Graphics.Texture; use Sf.Graphics.Texture;

package body Qv.Texture is

   type Texture_Impl_Type is new sfTexture;

   function Sf_Ptr_To_Texture is new Ada.Unchecked_Conversion
     (Source => sfTexture_Ptr, Target => Texture_Type);
   function Texture_To_Sf_Ptr is new Ada.Unchecked_Conversion
     (Source => Texture_Type, Target => sfTexture_Ptr);

   ------------------
   -- Load_Texture --
   ------------------

   function Load_Texture (Path : String) return Texture_Type is
      Tex : Texture_Type;
   begin
      Tex := Sf_Ptr_To_Texture (createFromFile (Path));
      return Tex;
   end Load_Texture;

   --------------------
   -- Unload_Texture --
   --------------------

   procedure Unload_Texture (Tex : in out Texture_Type) is
   begin
      destroy (Texture_To_Sf_Ptr (Tex));
   end Unload_Texture;

end Qv.Texture;
