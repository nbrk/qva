with Sf.Window.Keyboard;

package Qv.Input.SFML is

   function To_Sf_Keycode
     (K : Keycode_Type) return Sf.Window.Keyboard.sfKeyCode;
   --  Map Qv keyboard button to SFML keycode

private

end Qv.Input.SFML;
