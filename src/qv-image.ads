package Qv.Image is

   --  TODO: CPU memory images

   type Image_Type is private;

   function Load_Image (Path : String) return Image_Type;
   procedure Unload_Image (Img : Image_Type);

private

   type Image_Impl_Type;

   type Image_Type is access Image_Impl_Type;

end Qv.Image;
