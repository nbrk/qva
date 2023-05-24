pragma Ada_2012;

with Ada.Unchecked_Conversion;
with Sf.Graphics;          use Sf.Graphics;
with Sf.Graphics.Font;     use Sf.Graphics.Font;
with Sf.Graphics.FontInfo; use Sf.Graphics.FontInfo;

package body Qv.Font is

   type Font_Impl_Type is null record;

   function Sf_Ptr_To_Font is new Ada.Unchecked_Conversion
     (Source => sfFont_Ptr, Target => Font_Type);
   function Font_To_Sf_Ptr is new Ada.Unchecked_Conversion
     (Source => Font_Type, Target => sfFont_Ptr);

   Default_Sf_Font : sfFont_Ptr;

   ---------------
   -- Load_Font --
   ---------------

   function Load_Font (Path : String) return Font_Type is
      Fnt : sfFont_Ptr := createFromFile (Path);
   begin
      if Fnt = null then
         raise Font_Error;
      end if;
      return Sf_Ptr_To_Font (Fnt);
   end Load_Font;

   -----------------------
   -- Load_Default_Font --
   -----------------------

   procedure Load_Default_Font (Path : String) is
   begin
      Set_Default_Font (Load_Font (Path));
   end Load_Default_Font;

   -----------------
   -- Unload_Font --
   -----------------

   procedure Unload_Font (Fnt : Font_Type) is
   begin
      if Default_Sf_Font = Font_To_Sf_Ptr (Fnt) then
         raise Font_Error with "Unloading of default font";
      end if;
      destroy (Font_To_Sf_Ptr (Fnt));
   end Unload_Font;

   ----------------------
   -- Set_Default_Font --
   ----------------------

   procedure Set_Default_Font (Fnt : Font_Type) is
   begin
      Default_Sf_Font := Font_To_Sf_Ptr (Fnt);
   end Set_Default_Font;

   ----------------------
   -- Get_Default_Font --
   ----------------------

   function Get_Default_Font return Font_Type is
   begin
      if Default_Sf_Font = null then
         raise Font_Error with "Default font is null";
      end if;
      return Sf_Ptr_To_Font (Default_Sf_Font);
   end Get_Default_Font;

end Qv.Font;
