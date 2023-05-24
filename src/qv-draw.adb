pragma Ada_2012;

with Qv.Color.SFML;              use Qv.Color.SFML;
with Qv.Window;                  use Qv.Window;
with Qv.Window.SFML;             use Qv.Window.SFML;
with Qv.Texture.SFML;            use Qv.Texture.SFML;
with Qv.Font;                    use Qv.Font;
with Qv.Font.SFML;               use Qv.Font.SFML;
with Sf;                         use Sf;
with Sf.Graphics;                use Sf.Graphics;
with Sf.Graphics.Rect;           use Sf.Graphics.Rect;
with Sf.Graphics.Vertex;         use Sf.Graphics.Vertex;
with Sf.Graphics.VertexArray;    use Sf.Graphics.VertexArray;
with Sf.Graphics.RenderWindow;   use Sf.Graphics.RenderWindow;
with Sf.Graphics.PrimitiveType;  use Sf.Graphics.PrimitiveType;
with Sf.Graphics.CircleShape;    use Sf.Graphics.CircleShape;
with Sf.Graphics.RectangleShape; use Sf.Graphics.RectangleShape;
with Sf.Graphics.ConvexShape;    use Sf.Graphics.ConvexShape;
with Sf.Graphics.Sprite;         use Sf.Graphics.Sprite;
with Sf.Graphics.Text;           use Sf.Graphics.Text;
with Sf.Graphics.Font;           use Sf.Graphics.Font;
with Sf.System.Vector2;          use Sf.System.Vector2;

package body Qv.Draw is

   Reused_Line      : Sf.Graphics.sfVertexArray_Ptr;
   Reused_Circle    : Sf.Graphics.sfCircleShape_Ptr;
   Reused_Rectangle : Sf.Graphics.sfRectangleShape_Ptr;
   Reused_Triangle  : Sf.Graphics.sfConvexShape_Ptr;
   Reused_Sprite    : Sf.Graphics.sfSprite_Ptr;
   Reused_Text      : Sf.Graphics.sfText_Ptr;

   --------------------------------------------
   -- Create_And_Initialize_Reused_SFML_Data --
   --------------------------------------------

   procedure Create_And_Initialize_Reused_SFML_Data is
   begin
      Reused_Line := create;
      resize (Reused_Line, 2);
      setPrimitiveType (Reused_Line, sfLines);

      Reused_Circle := create;

      Reused_Rectangle := create;

      Reused_Triangle := create;
      setPointCount (Reused_Triangle, 3);

      Reused_Sprite := create;

      Reused_Text := create;
   end Create_And_Initialize_Reused_SFML_Data;
   ----------------
   -- Draw_Pixel --
   ----------------

   procedure Draw_Pixel (X, Y : Integer; C : Color_Type) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Draw_Pixel unimplemented");
      raise Program_Error with "Unimplemented procedure Draw_Pixel";
   end Draw_Pixel;

   ---------------
   -- Draw_Line --
   ---------------

   procedure Draw_Line
     (Start_X, Start_Y, End_X, End_Y : Integer; C : Color_Type)
   is
      V0 : access Sf.Graphics.Vertex.sfVertex;
      V1 : access Sf.Graphics.Vertex.sfVertex;
   begin
      V0 := getVertex (Reused_Line, 0);
      V1 := getVertex (Reused_Line, 1);

      V0.position.x := Float (Start_X);
      V0.position.y := Float (Start_Y);
      V1.position.x := Float (End_X);
      V1.position.y := Float (End_Y);
      V0.color      := To_Sf_Color (C);
      V1.color      := To_Sf_Color (C);
      drawVertexArray (Current_Window, Reused_Line);
   end Draw_Line;

   ---------------
   -- Draw_Line --
   ---------------

   procedure Draw_Line (Start_Pos, End_Pos : Vector_2_Type; C : Color_Type) is
   begin
      Draw_Line
        (Integer (Start_Pos (1)), Integer (Start_Pos (2)),
         Integer (End_Pos (1)), Integer (End_Pos (2)), C);
   end Draw_Line;

   ---------------------
   -- Draw_Line_Strip --
   ---------------------

   procedure Draw_Line_Strip (Points : Vector_2_Array_Type; C : Color_Type) is
   begin
      if Points'Length < 2 then
         raise Constraint_Error with "Line strip of less than two points";
      end if;
      declare
         Prev_Pos : Vector_2_Type := Points (Points'First);
      begin
         for P of Points loop
            Draw_Line (Prev_Pos, P, C);
            Prev_Pos := P;
         end loop;
      end;

   end Draw_Line_Strip;

   -----------------
   -- Draw_Circle --
   -----------------

   procedure Draw_Circle (Center_X, Center_Y, Radius : Integer; C : Color_Type)
   is
   begin
      Draw_Circle ((Float (Center_X), Float (Center_Y)), Float (Radius), C);
   end Draw_Circle;

   -----------------
   -- Draw_Circle --
   -----------------

   procedure Draw_Circle
     (Center_Pos : Vector_2_Type; Radius : Float; C : Color_Type)
   is
   begin
      setRadius (Reused_Circle, Radius);
      setPosition (Reused_Circle, sfVector2f'(Center_Pos (1), Center_Pos (2)));
      setOutlineThickness (Reused_Circle, -1.0);
      setOutlineColor (Reused_Circle, To_Sf_Color (C));
      setFillColor (Reused_Circle, To_Sf_Color (C));
      drawCircleShape (Current_Window, Reused_Circle);
   end Draw_Circle;

   -----------------------
   -- Draw_Circle_Lines --
   -----------------------

   procedure Draw_Circle_Lines
     (Center_X, Center_Y, Radius : Integer; C : Color_Type)
   is
   begin
      Draw_Circle_Lines
        ((Float (Center_X), Float (Center_Y)), Float (Radius), C);
   end Draw_Circle_Lines;

   -----------------------
   -- Draw_Circle_Lines --
   -----------------------

   procedure Draw_Circle_Lines
     (Center_Pos : Vector_2_Type; Radius : Float; C : Color_Type)
   is
   begin
      setRadius (Reused_Circle, Radius);
      setPosition (Reused_Circle, sfVector2f'(Center_Pos (1), Center_Pos (2)));
      setOutlineThickness (Reused_Circle, -1.0);
      setOutlineColor (Reused_Circle, To_Sf_Color (C));
      setFillColor (Reused_Circle, To_Sf_Color ((255, 255, 255, 0)));
      drawCircleShape (Current_Window, Reused_Circle);
   end Draw_Circle_Lines;

   --------------------
   -- Draw_Rectangle --
   --------------------

   procedure Draw_Rectangle (X, Y, Width, Height : Integer; C : Color_Type) is
   begin
      Draw_Rectangle
        ((Float (X), Float (Y)), (Float (Width), Float (Height)), C);
   end Draw_Rectangle;

   --------------------
   -- Draw_Rectangle --
   --------------------

   procedure Draw_Rectangle
     (Pos : Vector_2_Type; Size : Vector_2_Type; C : Color_Type)
   is
   begin
      setPosition (Reused_Rectangle, sfVector2f'(Pos (1), Pos (2)));
      setSize (Reused_Rectangle, sfVector2f'(Size (1), Size (2)));
      setOutlineThickness (Reused_Rectangle, -1.0);
      setOutlineColor (Reused_Rectangle, To_Sf_Color (C));
      setFillColor (Reused_Rectangle, To_Sf_Color (C));
      drawRectangleShape (Current_Window, Reused_Rectangle);
   end Draw_Rectangle;

   --------------------------
   -- Draw_Rectangle_Lines --
   --------------------------

   procedure Draw_Rectangle_Lines
     (X, Y, Width, Height : Integer; C : Color_Type)
   is
   begin
      Draw_Rectangle_Lines
        ((Float (X), Float (Y)), (Float (Width), Float (Height)), C);
   end Draw_Rectangle_Lines;

   --------------------------
   -- Draw_Rectangle_Lines --
   --------------------------

   procedure Draw_Rectangle_Lines
     (Pos : Vector_2_Type; Size : Vector_2_Type; C : Color_Type)
   is
   begin
      setPosition (Reused_Rectangle, sfVector2f'(Pos (1), Pos (2)));
      setSize (Reused_Rectangle, sfVector2f'(Size (1), Size (2)));
      setOutlineThickness (Reused_Rectangle, 1.0);
      setOutlineColor (Reused_Rectangle, To_Sf_Color (C));
      setFillColor (Reused_Rectangle, To_Sf_Color ((255, 255, 255, 0)));
      drawRectangleShape (Current_Window, Reused_Rectangle);
   end Draw_Rectangle_Lines;

   -------------------
   -- Draw_Triangle --
   -------------------

   procedure Draw_Triangle (X1, Y1, X2, Y2, X3, Y3 : Integer; C : Color_Type)
   is
   begin
      Draw_Triangle
        ((Float (X1), Float (Y1)), (Float (X2), Float (Y2)),
         (Float (X3), Float (Y3)), C);
   end Draw_Triangle;

   -------------------
   -- Draw_Triangle --
   -------------------

   procedure Draw_Triangle
     (Pos_1, Pos_2, Pos_3 : Vector_2_Type; C : Color_Type)
   is
   begin
      setPoint (Reused_Triangle, 0, sfVector2f'(Pos_1 (1), Pos_1 (2)));
      setPoint (Reused_Triangle, 1, sfVector2f'(Pos_2 (1), Pos_2 (2)));
      setPoint (Reused_Triangle, 2, sfVector2f'(Pos_3 (1), Pos_3 (2)));
      setOutlineThickness (Reused_Triangle, 1.0);
      setOutlineColor (Reused_Triangle, To_Sf_Color (C));
      setFillColor (Reused_Triangle, To_Sf_Color (C));
      drawConvexShape (Current_Window, Reused_Triangle);
   end Draw_Triangle;

   -------------------------
   -- Draw_Triangle_Lines --
   -------------------------

   procedure Draw_Triangle_Lines
     (X1, Y1, X2, Y2, X3, Y3 : Integer; C : Color_Type)
   is
   begin
      Draw_Triangle_Lines
        ((Float (X1), Float (Y1)), (Float (X2), Float (Y2)),
         (Float (X3), Float (Y3)), C);
   end Draw_Triangle_Lines;

   -------------------------
   -- Draw_Triangle_Lines --
   -------------------------

   procedure Draw_Triangle_Lines
     (Pos_1, Pos_2, Pos_3 : Vector_2_Type; C : Color_Type)
   is
   begin
      setPoint (Reused_Triangle, 0, sfVector2f'(Pos_1 (1), Pos_1 (2)));
      setPoint (Reused_Triangle, 1, sfVector2f'(Pos_2 (1), Pos_2 (2)));
      setPoint (Reused_Triangle, 2, sfVector2f'(Pos_3 (1), Pos_3 (2)));
      setOutlineThickness (Reused_Triangle, 1.0);
      setOutlineColor (Reused_Triangle, To_Sf_Color (C));
      setFillColor (Reused_Triangle, To_Sf_Color ((255, 255, 255, 0)));
      drawConvexShape (Current_Window, Reused_Triangle);
   end Draw_Triangle_Lines;

   ------------------
   -- Draw_Texture --
   ------------------

   procedure Draw_Texture
     (Tex  : Texture_Type; Pos_X, Pos_Y : Integer;
      Tint : Color_Type := White_Color)
   is
   begin
      setPosition (Reused_Sprite, sfVector2f'(Float (Pos_X), Float (Pos_Y)));
      setTexture (Reused_Sprite, To_Sf_Texture_Ptr (Tex), sfTrue);
      setColor (Reused_Sprite, To_Sf_Color (Tint));
      drawSprite (Current_Window, Reused_Sprite);
   end Draw_Texture;

   -----------------------
   -- Draw_Texture_Part --
   -----------------------

   procedure Draw_Texture_Part
     (Tex                                               : Texture_Type;
      Src_X, Src_Y, Src_Width, Src_Height, Pos_X, Pos_Y : Integer;
      Tint : Color_Type := White_Color)
   is
   begin
      setPosition (Reused_Sprite, sfVector2f'(Float (Pos_X), Float (Pos_Y)));
      setTexture (Reused_Sprite, To_Sf_Texture_Ptr (Tex), sfTrue);
      setTextureRect
        (Reused_Sprite, sfIntRect'(Src_X, Src_Y, Src_Width, Src_Height));
      setColor (Reused_Sprite, To_Sf_Color (Tint));
      drawSprite (Current_Window, Reused_Sprite);
   end Draw_Texture_Part;

   --------------
   -- Draw_FPS --
   --------------

   procedure Draw_FPS (Pos_X, Pos_Y : Integer) is
      Str : constant String := Get_FPS'Image & " FPS";
   begin
      Draw_Text (Str, Pos_X, Pos_Y, 14, Yellow_Color);
   end Draw_FPS;

   ---------------
   -- Draw_Text --
   ---------------

   procedure Draw_Text
     (Text : String; Pos_X, Pos_Y : Integer; Font_Size : Positive;
      C    : Color_Type)
   is
   begin
      setFont (Reused_Text, To_Sf_Font_Ptr (Get_Default_Font));
      setPosition (Reused_Text, sfVector2f'(Float (Pos_X), Float (Pos_Y)));
      setString (Reused_Text, Text);
      setCharacterSize (Reused_Text, sfUint32 (Font_Size));
      setFillColor (Reused_Text, To_Sf_Color (C));
      drawText (Current_Window, Reused_Text);
   end Draw_Text;

begin
   Create_And_Initialize_Reused_SFML_Data;
end Qv.Draw;
