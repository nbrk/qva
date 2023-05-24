with Sf.Graphics.Color;

package Qv.Color.SFML is

   function To_Sf_Color (C : Color_Type) return Sf.Graphics.Color.sfColor;
   --  Map Qv color to SFML color

private

end Qv.Color.SFML;
