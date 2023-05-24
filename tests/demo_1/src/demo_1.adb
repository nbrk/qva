with Qv.Window;  use Qv.Window;
with Qv.Input;   use Qv.Input;
with Qv.Color;   use Qv.Color;
with Qv.Draw;    use Qv.Draw;
with Qv.Texture; use Qv.Texture;

with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Demo_1 is
   C : Color_Type   := (0, 0, 0, 255);
   L : Texture_Type := Load_Texture ("/home/nbrk/tmp/smile.png");
begin
   Init_Window (1_024, 768, "Test");
   Set_Target_FPS (24);
   while not Window_Should_Close loop

      if Is_Key_Down (Key_R) then
         C := (255, 0, 0, 255);
      elsif Is_Key_Down (Key_G) then
         C := (0, 255, 0, 255);
      elsif Is_Key_Down (Key_B) then
         C := (0, 0, 255, 255);
      elsif Is_Key_Pressed (Key_Space) then
         C := (C.Red + 5, C.Green, C.Blue, C.Alpha);
      end if;

      if Is_Key_Pressed (Key_M) then
         Put ("Mouse coordinates: ");
         Put (Get_Mouse_X);
         Put (", ");
         Put (Get_Mouse_Y);
         New_Line;
      end if;

      if Is_Key_Pressed (Key_F) then
         Toggle_Fullscreen;
      end if;

      Clear_Background;
      Begin_Drawing;

      if Is_Key_Down (Key_V) then
         Draw_Line_Strip
           (((0.0, 0.0), (100.0, 100.0), (320.0, 240.0),
             (Float (Get_Mouse_X), Float (Get_Mouse_Y))),
            Yellow_Color);
      end if;

      Draw_Rectangle (200, 200, 100, 60, Magenta_Color);

      Draw_Line (0, 0, Get_Mouse_X, Get_Mouse_Y, Orange_Color);

      Draw_Triangle (300, 300, 360, 300, 330, 280, White_Color);

      Draw_Line_Strip
        (((0.0, 0.0), (50.0, 50.0), (120.0, 10.0), (320.0, 240.0)),
         Blue_Color);

      Draw_Texture (L, 0, 0, White_Color);

      --  Draw_Texture (L, Get_Mouse_X, Get_Mouse_Y, White_Color);

      Draw_Circle_Lines (Get_Mouse_X - 10, Get_Mouse_Y - 30, 20, Red_Color);

      Draw_Texture_Part
        (L, 60, 200, 340, 100, Get_Mouse_X, Get_Mouse_Y,
         (255, 255, 255, Alpha => 255));

      End_Drawing;

      Put_Line (Get_FPS'Image);
   end loop;

   Close_Window;

end Demo_1;
