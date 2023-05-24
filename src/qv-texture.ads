package Qv.Texture is

   type Texture_Type is limited private;
   --  Opaque texture handle

   function Load_Texture (Path : String) return Texture_Type;
   --  Load a texture from file

   procedure Unload_Texture (Tex : in out Texture_Type);
   --  Unload texture from the VRAM

private

   type Texture_Impl_Type;

   type Texture_Type is access all Texture_Impl_Type;

end Qv.Texture;
