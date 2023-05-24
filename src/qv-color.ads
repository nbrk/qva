package Qv.Color is

   --
   --  Color manipulations
   --

   subtype Color_Component_Type is Natural range 0 .. 255;
   --  Color channel intensity

   type Color_Type is record
      Red   : Color_Component_Type;
      Green : Color_Component_Type;
      Blue  : Color_Component_Type;
      Alpha : Color_Component_Type;
   end record;
   --  RGBA color

   --
   --  Some predefined color constants
   --

   Red_Color         : constant Color_Type := (255, 0, 0, 255);
   Dark_Red_Color    : constant Color_Type := (150, 0, 0, 255);
   Light_Red_Color   : constant Color_Type := (255, 150, 150, 255);
   Green_Color       : constant Color_Type := (0, 255, 0, 255);
   Dark_Green_Color  : constant Color_Type := (0, 150, 0, 255);
   Light_Green_Color : constant Color_Type := (150, 255, 150, 255);
   Blue_Color        : constant Color_Type := (0, 0, 255, 255);
   Dark_Blue_Color   : constant Color_Type := (0, 0, 150, 255);
   Light_Blue_Color  : constant Color_Type := (150, 150, 255, 255);
   Cyan_Color        : constant Color_Type := (0, 255, 255, 255);
   Magenta_Color     : constant Color_Type := (255, 0, 255, 255);
   Yellow_Color      : constant Color_Type := (255, 255, 0, 255);
   Orange_Color      : constant Color_Type := (255, 165, 0, 255);
   Gold_Color        : constant Color_Type := (218, 165, 32, 255);
   Brown_Color       : constant Color_Type := (135, 78, 28, 255);
   Black_Color       : constant Color_Type := (0, 0, 0, 255);
   Gray_Color        : constant Color_Type := (128, 128, 128, 255);
   White_Color       : constant Color_Type := (255, 255, 255, 255);

private

end Qv.Color;
