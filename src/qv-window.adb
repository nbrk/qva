pragma Ada_2012;

with Ada.Strings.Unbounded;     use Ada.Strings.Unbounded;
with Ada.Real_Time;             use Ada.Real_Time;
with Qv.Color.SFML;             use Qv.Color.SFML;
with Qv.Input;                  use Qv.Input;
with Qv.Window.SFML;            use Qv.Window.SFML;
with Sf;                        use Sf;
with Sf.Graphics.BlendMode;     use Sf.Graphics.BlendMode;
with Sf.System.Time;            use Sf.System.Time;
with Sf.Window;                 use Sf.Window;
with Sf.Window.Window;          use Sf.Window.Window;
with Sf.Window.VideoMode;       use Sf.Window.VideoMode;
with Sf.Window.Keyboard;        use Sf.Window.Keyboard;
with Sf.Window.Mouse;           use Sf.Window.Mouse;
with Sf.Graphics;               use Sf.Graphics;
with Sf.Graphics.RenderWindow;  use Sf.Graphics.RenderWindow;
with Sf.Graphics.Color;         use Sf.Graphics.Color;
with Sf.Graphics.Vertex;        use Sf.Graphics.Vertex;
with Sf.Graphics.VertexArray;   use Sf.Graphics.VertexArray;
with Sf.Graphics.PrimitiveType; use Sf.Graphics.PrimitiveType;
with Sf.System.Vector2;         use Sf.System.Vector2;
with Sf.Graphics.Transform;     use Sf.Graphics.Transform;
with Sf.Graphics.RenderStates;  use Sf.Graphics.RenderStates;
with Sf.Graphics.RenderTexture; use Sf.Graphics.RenderTexture;
with Sf.Graphics.Text;          use Sf.Graphics.Text;
with Sf.Graphics.Font;          use Sf.Graphics.Font;
with Sf.Graphics.Texture;       use Sf.Graphics.Texture;
with Sf.Graphics.Sprite;        use Sf.Graphics.Sprite;
with Sf.Graphics.Rect;          use Sf.Graphics.Rect;

package body Qv.Window is

   Exit_Key            : Keycode_Type := Key_Escape;
   Full_Screen         : Boolean      := False;
   Last_Pre_Draw_Time  : Time;
   Last_FPS_Estimate   : Integer;
   Saved_Window_Title  : Unbounded_String;
   Saved_Window_Width  : Positive;
   Saved_Window_Height : Positive;
   Saved_FPS_Limit     : Natural;

   -----------------
   -- Init_Window --
   -----------------

   procedure Init_Window (Width, Height : Positive; Title : String) is
   begin
      --
      --  The window
      --
      Current_Window :=
        create
          (sfVideoMode'
             (sfUint32 (Width), sfUint32 (Height),
              sfUint32 (getDesktopMode.bitsPerPixel)),
           Title, sfDefaultStyle);
      --  setVerticalSyncEnabled (Current_Window, sfTrue);

      --
      --  Remember parameters
      --
      Saved_Window_Title  := To_Unbounded_String (Title);
      Saved_Window_Width  := Width;
      Saved_Window_Height := Height;
      Saved_FPS_Limit     := 0; --  No limit by default
   end Init_Window;

   -------------------------
   -- Window_Should_Close --
   -------------------------

   function Window_Should_Close return Boolean is
   begin
      return
        not (Boolean (RenderWindow.isOpen (Current_Window))) or
        Is_Key_Down (Exit_Key);
   end Window_Should_Close;

   ------------------
   -- Set_Exit_Key --
   ------------------

   procedure Set_Exit_Key (K : Keycode_Type) is
   begin
      Exit_Key := K;
   end Set_Exit_Key;

   ------------------
   -- Close_Window --
   ------------------

   procedure Close_Window is
   begin
      RenderWindow.destroy (Current_Window);
   end Close_Window;

   --------------------------
   -- Is_Window_Fullscreen --
   --------------------------

   function Is_Window_Fullscreen return Boolean is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Is_Window_Fullscreen unimplemented");
      return
        raise Program_Error with "Unimplemented function Is_Window_Fullscreen";
   end Is_Window_Fullscreen;

   ---------------------
   -- Set_Window_Size --
   ---------------------

   procedure Set_Window_Size (Width, Height : Positive) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Set_Window_Size unimplemented");
      raise Program_Error with "Unimplemented procedure Set_Window_Size";
   end Set_Window_Size;

   -----------------------
   -- Toggle_Fullscreen --
   -----------------------

   procedure Toggle_Fullscreen is
   begin
      destroy (Current_Window);
      Full_Screen := not Full_Screen;
      declare
         Desktop_Mode : constant sfVideoMode := getDesktopMode;
         Apply_Mode   : constant sfVideoMode :=
           (if Full_Screen then
              (Desktop_Mode.width, Desktop_Mode.height,
               sfUint32 (Desktop_Mode.bitsPerPixel))
            else (sfUint32 (Saved_Window_Width),
               sfUint32 (Saved_Window_Height),
               sfUint32 (Desktop_Mode.bitsPerPixel)));
      begin
         Current_Window :=
           create (Apply_Mode, To_String (Saved_Window_Title), sfDefaultStyle);

         --  Restore other settings for the re-created window
         Set_Target_FPS (Saved_FPS_Limit);
      end;
   end Toggle_Fullscreen;

   ----------------------
   -- Get_Screen_Width --
   ----------------------

   function Get_Screen_Width return Positive is
   begin
      return Positive (RenderWindow.getSize (Current_Window).x);
   end Get_Screen_Width;

   -----------------------
   -- Get_Screen_Height --
   -----------------------

   function Get_Screen_Height return Positive is
   begin
      return Positive (RenderWindow.getSize (Current_Window).y);
   end Get_Screen_Height;

   ----------------------
   -- Clear_Background --
   ----------------------

   procedure Clear_Background (C : Color_Type := Black_Color) is
   begin
      RenderWindow.clear (Current_Window, To_Sf_Color (C));
   end Clear_Background;

   -------------------
   -- Begin_Drawing --
   -------------------

   procedure Begin_Drawing is
   begin
      Last_Pre_Draw_Time := Clock;
   end Begin_Drawing;

   -----------------
   -- End_Drawing --
   -----------------

   procedure End_Drawing is
   begin
      RenderWindow.display (Current_Window);
      declare
         Dur : Duration := To_Duration (Clock - Last_Pre_Draw_Time);
      begin
         Last_FPS_Estimate := Natural (1.0 / Dur);
      end;
   end End_Drawing;

   --------------------
   -- Set_Target_FPS --
   --------------------

   procedure Set_Target_FPS (N : Natural) is
   begin
      setFramerateLimit (Current_Window, sfUint32 (N));
      Saved_FPS_Limit := N;
   end Set_Target_FPS;

   -------------
   -- Get_FPS --
   -------------

   function Get_FPS return Natural is
   begin
      return Last_FPS_Estimate;
   end Get_FPS;

   --------------------
   -- Get_Frame_Time --
   --------------------

   function Get_Frame_Time return Float is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Get_Frame_Time unimplemented");
      return raise Program_Error with "Unimplemented function Get_Frame_Time";
   end Get_Frame_Time;

   --------------
   -- Get_Time --
   --------------

   function Get_Time return Long_Float is
   begin
      pragma Compile_Time_Warning (Standard.True, "Get_Time unimplemented");
      return raise Program_Error with "Unimplemented function Get_Time";
   end Get_Time;

   ------------------------------
   -- Get_Monitor_Refresh_Rate --
   ------------------------------

   function Get_Monitor_Refresh_Rate return Positive is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Get_Monitor_Refresh_Rate unimplemented");
      return
        raise Program_Error
          with "Unimplemented function Get_Monitor_Refresh_Rate";
   end Get_Monitor_Refresh_Rate;

end Qv.Window;
