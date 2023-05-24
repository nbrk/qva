with Qv.Color;   use Qv.Color;
with Qv.Vector;  use Qv.Vector;
with Qv.Texture; use Qv.Texture;

package Qv.Draw is

   --
   --  Various shapes drawing procedures
   --

   procedure Draw_Pixel (X, Y : Integer; C : Color_Type);
   --  Draw a pixel

   procedure Draw_Line
     (Start_X, Start_Y, End_X, End_Y : Integer; C : Color_Type);
   --  Draw a straight line

   procedure Draw_Line (Start_Pos, End_Pos : Vector_2_Type; C : Color_Type);
   --  Draw a straight line (vector version)

   procedure Draw_Line_Strip (Points : Vector_2_Array_Type; C : Color_Type);
   --  Draw lines sequence

   procedure Draw_Circle
     (Center_X, Center_Y, Radius : Integer; C : Color_Type);
   --  Draw a color-filled circle

   procedure Draw_Circle
     (Center_Pos : Vector_2_Type; Radius : Float; C : Color_Type);
   --  Draw a color-filled circle (vector version)

   procedure Draw_Circle_Lines
     (Center_X, Center_Y, Radius : Integer; C : Color_Type);
   --  Draw circle outline

   procedure Draw_Circle_Lines
     (Center_Pos : Vector_2_Type; Radius : Float; C : Color_Type);
   --  Draw circle outline (vector version)

   procedure Draw_Rectangle (X, Y, Width, Height : Integer; C : Color_Type);
   --  Draw a color-filled rectangle

   procedure Draw_Rectangle
     (Pos : Vector_2_Type; Size : Vector_2_Type; C : Color_Type);
   --  Draw a color-filled rectangle (vector version)

   procedure Draw_Rectangle_Lines
     (X, Y, Width, Height : Integer; C : Color_Type);
   --  Draw rectangle outline

   procedure Draw_Rectangle_Lines
     (Pos : Vector_2_Type; Size : Vector_2_Type; C : Color_Type);
   --  Draw rectangle outline (vector version)

   procedure Draw_Triangle (X1, Y1, X2, Y2, X3, Y3 : Integer; C : Color_Type);
   --  Draw color-filled triangle (points in counter-clockwise direction)

   procedure Draw_Triangle
     (Pos_1, Pos_2, Pos_3 : Vector_2_Type; C : Color_Type);
   --  Draw color-filled triangle (vector version, points in counter-clockwise direction)

   procedure Draw_Triangle_Lines
     (X1, Y1, X2, Y2, X3, Y3 : Integer; C : Color_Type);
   --  Draw color-filled triangle (points in counter-clockwise direction)

   procedure Draw_Triangle_Lines
     (Pos_1, Pos_2, Pos_3 : Vector_2_Type; C : Color_Type);
   --  Draw color-filled triangle (vector version, points in counter-clockwise direction)

   procedure Draw_Texture
     (Tex  : Texture_Type; Pos_X, Pos_Y : Integer;
      Tint : Color_Type := White_Color);
   --  Draw texture with top-left corner at a given screen position

   procedure Draw_Texture_Part
     (Tex                                               : Texture_Type;
      Src_X, Src_Y, Src_Width, Src_Height, Pos_X, Pos_Y : Integer;
      Tint : Color_Type := White_Color);
   --  Draw a part of the texture defined by a source rectangle

private

end Qv.Draw;
