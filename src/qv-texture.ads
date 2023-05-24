package Qv.Texture is

   type Texture_Type is limited private;

   function Load_Texture (Path : String) return Texture_Type;

   procedure Unload_Texture (Tex : in out Texture_Type);

private

   type Texture_Impl_Type;

   type Texture_Type is access all Texture_Impl_Type;

end Qv.Texture;
