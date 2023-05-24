pragma Ada_2012;

with Qv.Window.SFML;           use Qv.Window.SFML;
with Qv.Window;                use Qv.Window;
with Sf.Graphics;              use Sf.Graphics;
with Sf.Graphics.View;         use Sf.Graphics.View;
with Sf.Graphics.RenderWindow; use Sf.Graphics.RenderWindow;

package body Qv.Camera is

   Current_View : sfView_Ptr;

   -------------------
   -- Begin_Mode_2D --
   -------------------

   procedure Begin_Mode_2D (Cam : Camera_Type) is
   begin
      setCenter (Current_View, (Cam.Target (1), Cam.Target (2)));
      setSize
        (Current_View,
        (Float (Get_Screen_Width) * Cam.Zoom,
          Float (Get_Screen_Height) * Cam.Zoom *
          (Float (Get_Screen_Width) / Float (Get_Screen_Height))));
      setRotation (Current_View, Cam.Rotation);

      setView (Current_Window, Current_View);
   end Begin_Mode_2D;

   -----------------
   -- End_Mode_2D --
   -----------------

   procedure End_Mode_2D is
   begin
      setView (Current_Window, getDefaultView (Current_Window));
   end End_Mode_2D;

begin
   Current_View := create;

end Qv.Camera;
