package Qv.Font is

   Font_Error   : exception;

   type Font_Type is private;
   --  Opaue font handle

   function Load_Font (Path : String) return Font_Type;
   --  Load a font from file

   procedure Load_Default_Font (Path : String);
   --  Load a font from file and set it as default

   procedure Unload_Font (Fnt : Font_Type);
   --  Unload font

   procedure Set_Default_Font (Fnt : Font_Type);
   --  Set the given font as default

   function Get_Default_Font return Font_Type;
   --  Get the default font

private

   type Font_Impl_Type;

   type Font_Type is not null access Font_Impl_Type;

end Qv.Font;
