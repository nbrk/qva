pragma Ada_2012;

with Qv.Input.SFML;            use Qv.Input.SFML;
with Qv.Window.SFML;           use Qv.Window.SFML;
with Sf.Window.Keyboard;       use Sf.Window.Keyboard;
with Sf.Graphics.RenderWindow; use Sf.Graphics.RenderWindow;

package body Qv.Input is

   Keyboard_Pressed_Keys : array (Keycode_Type) of Boolean :=
     (others => False);

   -----------------
   -- Is_Key_Down --
   -----------------

   function Is_Key_Down (K : Keycode_Type) return Boolean is
   begin
      return Boolean (Sf.Window.Keyboard.isKeyPressed (To_Sf_Keycode (K)));
   end Is_Key_Down;

   ---------------
   -- Is_Key_Up --
   ---------------

   function Is_Key_Up (K : Keycode_Type) return Boolean is
   begin
      return not Boolean (Sf.Window.Keyboard.isKeyPressed (To_Sf_Keycode (K)));
   end Is_Key_Up;

   --------------------
   -- Is_Key_Pressed --
   --------------------

   function Is_Key_Pressed (K : Keycode_Type) return Boolean is
   begin
      if Is_Key_Down (K) then
         if Keyboard_Pressed_Keys (K) then
            --  key repeat
            return False;
         else
            --  first press
            Keyboard_Pressed_Keys (K) := True;
            return True;
         end if;
      else
         --  released or was not in a down state
         Keyboard_Pressed_Keys (K) := False;
         return False;
      end if;
   end Is_Key_Pressed;

   ---------------------
   -- Is_Key_Released --
   ---------------------

   function Is_Key_Released (K : Keycode_Type) return Boolean is
   begin
      if Is_Key_Up (K) then
         if not Keyboard_Pressed_Keys (K) then
            return False;
         else
            --  first unpress
            Keyboard_Pressed_Keys (K) := False;
            return True;
         end if;
      else
         Keyboard_Pressed_Keys (K) := True;
         return False;
      end if;
   end Is_Key_Released;

   --------------------------
   -- Is_Mouse_Button_Down --
   --------------------------

   function Is_Mouse_Button_Down (B : Mouse_Button_Type) return Boolean is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Is_Mouse_Button_Down unimplemented");
      return
        raise Program_Error with "Unimplemented function Is_Mouse_Button_Down";
   end Is_Mouse_Button_Down;

   ------------------------
   -- Is_Mouse_Button_Up --
   ------------------------

   function Is_Mouse_Button_Up (B : Mouse_Button_Type) return Boolean is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Is_Mouse_Button_Up unimplemented");
      return
        raise Program_Error with "Unimplemented function Is_Mouse_Button_Up";
   end Is_Mouse_Button_Up;

   -----------------------------
   -- Is_Mouse_Button_Pressed --
   -----------------------------

   function Is_Mouse_Button_Pressed (B : Mouse_Button_Type) return Boolean is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Is_Mouse_Button_Pressed unimplemented");
      return
        raise Program_Error
          with "Unimplemented function Is_Mouse_Button_Pressed";
   end Is_Mouse_Button_Pressed;

   ------------------------------
   -- Is_Mouse_Button_Released --
   ------------------------------

   function Is_Mouse_Button_Released (B : Mouse_Button_Type) return Boolean is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Is_Mouse_Button_Released unimplemented");
      return
        raise Program_Error
          with "Unimplemented function Is_Mouse_Button_Released";
   end Is_Mouse_Button_Released;

   -----------------
   -- Get_Mouse_X --
   -----------------

   function Get_Mouse_X return Integer is
   begin
      return Integer (Mouse.getPosition (Current_Window).x);
   end Get_Mouse_X;

   -----------------
   -- Get_Mouse_Y --
   -----------------

   function Get_Mouse_Y return Integer is
   begin
      return Integer (Mouse.getPosition (Current_Window).y);
   end Get_Mouse_Y;

   --------------------------
   -- Get_Mouse_Wheel_Move --
   --------------------------

   function Get_Mouse_Wheel_Move return Float is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Get_Mouse_Wheel_Move unimplemented");
      return
        raise Program_Error with "Unimplemented function Get_Mouse_Wheel_Move";
   end Get_Mouse_Wheel_Move;

end Qv.Input;
