with Qv.Color; use Qv.Color;
with Qv.Input; use Qv.Input;

package Qv.Window is

   --
   --  Window-related subprograms.
   --

   procedure Init_Window (Width, Height : Positive; Title : String);
   --  Initialize window and the graphics context

   function Window_Should_Close return Boolean;
   --  Check whether the user wants to close the window

   procedure Set_Exit_Key (K : Keycode_Type);
   --  Set custom program exit key (default is Key_Escape)

   procedure Close_Window;
   --  Close the window

   function Is_Window_Fullscreen return Boolean;
   --  Checks whether the window is currently in fullscreen mode

   procedure Toggle_Fullscreen;
   --  Toggle window fullscreen mode

   function Get_Screen_Width return Positive;
   --  Get current screen width

   function Get_Screen_Height return Positive;
   --  Get current screen height

   procedure Clear_Background (C : Color_Type := Black_Color);
   --  Set screen clear color

   procedure Begin_Drawing;
   --  Begin frame drawing

   procedure End_Drawing;
   --  End frame drawing, perform buffers swapping

   procedure Set_Target_FPS (N : Natural);
   --  Set desired frames per second limit (0 to disable the limit, which is default)

   function Get_FPS return Natural;
   --  Get current frames per second count

   function Get_Frame_Time return Float;
   --  Get time in seconds used to draw the last frame

   function Get_Time return Long_Float;
   --  Get elapsed time since the Init_Window

   function Get_Monitor_Refresh_Rate return Positive;
   --  Get current monitor refresh rate

   procedure Show_Cursor;
   --  Show mouse cursor

   procedure Hide_Cursor;
   --  Hide mouse cursor

private

end Qv.Window;
