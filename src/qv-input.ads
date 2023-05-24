package Qv.Input is

   --
   --  Keyboard/mouse related subprograms
   --

   type Keycode_Type is
     (Key_A, Key_B, Key_C, Key_D, Key_E, Key_F, Key_G, Key_H, Key_I, Key_J,
      Key_K, Key_L, Key_M, Key_N, Key_O, Key_P, Key_Q, Key_R, Key_S, Key_T,
      Key_U, Key_V, Key_W, Key_X, Key_Y, Key_Z, Key_Num_0, Key_Num_1,
      Key_Num_2, Key_Num_3, Key_Num_4, Key_Num_5, Key_Num_6, Key_Num_7,
      Key_Num_8, Key_Num_9, Key_Escape, Key_L_Control, Key_L_Shift, Key_L_Alt,
      Key_L_System, Key_R_Control, Key_R_Shift, Key_R_Alt, Key_R_System,
      Key_Menu, Key_L_Bracket, Key_R_Bracket, Key_Semicolon, Key_Comma,
      Key_Period, Key_Quote, Key_Slash, Key_Backslash, Key_Tilde, Key_Equal,
      Key_Hyphen, Key_Space, Key_Enter, Key_Back, Key_Tab, Key_Page_Up,
      Key_Page_Down, Key_End, Key_Home, Key_Insert, Key_Delete, Key_Add,
      Key_Subtract, Key_Multiply, Key_Divide, Key_Left, Key_Right, Key_Up,
      Key_Down, Key_Numpad_0, Key_Numpad_1, Key_Numpad_2, Key_Numpad_3,
      Key_Numpad_4, Key_Numpad_5, Key_Numpad_6, Key_Numpad_7, Key_Numpad_8,
      Key_Numpad_9, Key_F1, Key_F2, Key_F3, Key_F4, Key_F5, Key_F6, Key_F7,
      Key_F8, Key_F9, Key_F10, Key_F11, Key_F12, Key_F13, Key_F14, Key_F15,
      Key_Pause, Key_Count);
   --  Keyboard button identifier

   function Is_Key_Down (K : Keycode_Type) return Boolean;
   --  Check if a key is being pressed

   function Is_Key_Up (K : Keycode_Type) return Boolean;
   --  Check if a key is not being pressed

   function Is_Key_Pressed (K : Keycode_Type) return Boolean;
   --  Check if a key has been pressed once

   function Is_Key_Released (K : Keycode_Type) return Boolean;
   --  Check if a key has been pressed once

   type Mouse_Button_Type is
     (Mouse_Button_Left, Mouse_Button_Middle, Mouse_Button_Right);
   --  Mouse button identifier

   function Is_Mouse_Button_Down (B : Mouse_Button_Type) return Boolean;
   --  Check if a mouse button is being pressed

   function Is_Mouse_Button_Up (B : Mouse_Button_Type) return Boolean;
   --  Check if a mouse button is not being pressed

   function Is_Mouse_Button_Pressed (B : Mouse_Button_Type) return Boolean;
   --  Check if a mouse button has been pressed once

   function Is_Mouse_Button_Released (B : Mouse_Button_Type) return Boolean;
   --  Check if a mouse button has been pressed once

   function Get_Mouse_X return Integer;
   --  Get mouse position X

   function Get_Mouse_Y return Integer;
   --  Get mouse position Y

   function Get_Mouse_Wheel_Move return Float;
   --  Get mouse wheel movement for Y axis

private

end Qv.Input;
