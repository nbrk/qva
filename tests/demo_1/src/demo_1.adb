with Qv.Window;  use Qv.Window;
with Qv.Input;   use Qv.Input;
with Qv.Color;   use Qv.Color;
with Qv.Draw;    use Qv.Draw;
with Qv.Texture; use Qv.Texture;
with Qv.Font;    use Qv.Font;
with Qv.Random;  use Qv.Random;
with Qv.Camera;  use Qv.Camera;

with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Integer_Text_IO;               use Ada.Integer_Text_IO;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;

procedure Demo_1 is
   C        : Color_Type   := (0, 0, 0, 255);
   Face     : Texture_Type := Load_Texture ("/home/nbrk/tmp/smile.png");
   Rand_Int : Integer      := -1;
   Cam      : Camera_Type  := Default_Camera;
begin
   Init_Window (1_024, 768, "Test");
   Load_Default_Font ("assets/arial.ttf");
   Set_Target_FPS (60);
   while not Window_Should_Close loop

      if Is_Key_Down (Key_G) then
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

      if Is_Key_Pressed (Key_R) then
         Rand_Int := Get_Random_Integer (10, 20);
      end if;
      if Is_Key_Down (Key_R_Bracket) then
         Cam.Rotation := Cam.Rotation + 1.0;
      end if;
      if Is_Key_Down (Key_L_Bracket) then
         Cam.Rotation := Cam.Rotation - 1.0;
      end if;
      if Is_Key_Down (Key_Left) then
         Cam.Target (1) := Cam.Target (1) - 10.0;
      end if;
      if Is_Key_Down (Key_Right) then
         Cam.Target (1) := Cam.Target (1) + 10.0;
      end if;
      if Is_Key_Down (Key_Down) then
         Cam.Target (2) := Cam.Target (2) + 10.0;
      end if;
      if Is_Key_Down (Key_Up) then
         Cam.Target (2) := Cam.Target (2) - 10.0;
      end if;

      if Is_Key_Down (Key_Comma) then
         Cam.Offset (1) := Cam.Offset (1) + 10.0;
      end if;
      if Is_Key_Down (Key_Period) then
         Cam.Offset (1) := Cam.Offset (1) - 10.0;
      end if;

      if Is_Key_Down (Key_Z) then
         Cam.Zoom := Cam.Zoom - 0.1;
      end if;
      if Is_Key_Down (Key_X) then
         Cam.Zoom := Cam.Zoom + 0.1;
      end if;

      Begin_Drawing;

      Clear_Background;

      Begin_Mode_2D (Cam);

      if Is_Key_Down (Key_V) then
         Draw_Line_Strip
           (((0.0, 0.0), (100.0, 100.0), (320.0, 240.0),
             (Float (Get_Mouse_X), Float (Get_Mouse_Y))),
            Yellow_Color);
      end if;

      --  Draw_Rectangle (200, 200, 100, 60, Magenta_Color);
      --  Draw_Line (0, 0, Get_Mouse_X, Get_Mouse_Y, Orange_Color);
      --  Draw_Triangle (300, 300, 360, 300, 330, 280, White_Color);
      --  Draw_Line_Strip
      --    (((0.0, 0.0), (50.0, 50.0), (120.0, 10.0), (320.0, 240.0)),
      --     Blue_Color);

      Draw_Texture (Face, 0, 0, White_Color);
      Draw_Texture (Face, 320, 0, Red_Color);
      Draw_Texture (Face, 650, 0, Green_Color);
      Draw_Texture (Face, 900, 0, Blue_Color);

      --  Draw_Circle_Lines (Get_Mouse_X - 10, Get_Mouse_Y - 30, 20, Red_Color);
      --  Draw_Texture_Part
      --    (Face, 60, 200, 340, 100, Get_Mouse_X, Get_Mouse_Y,
      --     (255, 255, 255, Alpha => 255));
      --  Draw_Text
      --    ("Last frame time: " & Get_Frame_Time'Image, 1, 24, 22,
      --     Light_Green_Color);
      --  Draw_Text
      --    ("Time since init: " & Get_Time'Image, 1, 50, 22, Light_Blue_Color);
      --  Draw_Text ("Rand integer: " & Rand_Int'Image, 10, 150, 24, Orange_Color);
      --  Draw_FPS (Get_Screen_Width - 70, Get_Screen_Height - 40);

      End_Mode_2D;

      End_Drawing;

   end loop;

   Close_Window;

end Demo_1;
