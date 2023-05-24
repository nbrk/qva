pragma Ada_2012;

with Sf.Graphics;       use Sf.Graphics;
with Sf.Graphics.Image; use Sf.Graphics.Image;

package body Qv.Image is

   type Image_Impl_Type is new sfImage_Ptr;

   ----------------
   -- Load_Image --
   ----------------

   function Load_Image (Path : String) return Image_Type is
   begin
      pragma Compile_Time_Warning (Standard.True, "Load_Image unimplemented");
      return raise Program_Error with "Unimplemented function Load_Image";
   end Load_Image;

   ------------------
   -- Unload_Image --
   ------------------

   procedure Unload_Image (Img : Image_Type) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Unload_Image unimplemented");
      raise Program_Error with "Unimplemented procedure Unload_Image";
   end Unload_Image;

end Qv.Image;
