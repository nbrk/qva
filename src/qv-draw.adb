pragma Ada_2012;

with Qv.Color.SFML;              use Qv.Color.SFML;
with Qv.Window.SFML;             use Qv.Window.SFML;
with Qv.Draw.SFML;               use Qv.Draw.SFML;
with Qv.Texture.SFML;            use Qv.Texture.SFML;
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
with Sf.System.Vector2;          use Sf.System.Vector2;

package body Qv.Draw is

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
      V0 := getVertex (Current_Line, 0);
      V1 := getVertex (Current_Line, 1);

      V0.position.x := Float (Start_X);
      V0.position.y := Float (Start_Y);
      V1.position.x := Float (End_X);
      V1.position.y := Float (End_Y);
      V0.color      := To_Sf_Color (C);
      V1.color      := To_Sf_Color (C);
      drawVertexArray (Current_Window, Current_Line);
   end Draw_Line;

   ---------------
   -- Draw_Line --
   ---------------

   procedure Draw_Line (Start_Pos, End_Pos : Vector_2_Type; C : Color_Type) is
   begin
      Draw_Line
        (Integer (Start_Pos.X), Integer (Start_Pos.Y), Integer (End_Pos.X),
         Integer (End_Pos.Y), C);
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
      setRadius (Current_Circle, Radius);
      setPosition (Current_Circle, sfVector2f'(Center_Pos.X, Center_Pos.Y));
      setOutlineThickness (Current_Circle, -1.0);
      setOutlineColor (Current_Circle, To_Sf_Color (C));
      setFillColor (Current_Circle, To_Sf_Color (C));
      drawCircleShape (Current_Window, Current_Circle);
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
      setRadius (Current_Circle, Radius);
      setPosition (Current_Circle, sfVector2f'(Center_Pos.X, Center_Pos.Y));
      setOutlineThickness (Current_Circle, -1.0);
      setOutlineColor (Current_Circle, To_Sf_Color (C));
      setFillColor (Current_Circle, To_Sf_Color ((255, 255, 255, 0)));
      drawCircleShape (Current_Window, Current_Circle);
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
      setPosition (Current_Rectangle, sfVector2f'(Pos.X, Pos.Y));
      setSize (Current_Rectangle, sfVector2f'(Size.X, Size.Y));
      setOutlineThickness (Current_Rectangle, -1.0);
      setOutlineColor (Current_Rectangle, To_Sf_Color (C));
      setFillColor (Current_Rectangle, To_Sf_Color (C));
      drawRectangleShape (Current_Window, Current_Rectangle);
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
      setPosition (Current_Rectangle, sfVector2f'(Pos.X, Pos.Y));
      setSize (Current_Rectangle, sfVector2f'(Size.X, Size.Y));
      setOutlineThickness (Current_Rectangle, 1.0);
      setOutlineColor (Current_Rectangle, To_Sf_Color (C));
      setFillColor (Current_Rectangle, To_Sf_Color ((255, 255, 255, 0)));
      drawRectangleShape (Current_Window, Current_Rectangle);
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
      setPoint (Current_Triangle, 0, sfVector2f'(Pos_1.X, Pos_1.Y));
      setPoint (Current_Triangle, 1, sfVector2f'(Pos_2.X, Pos_2.Y));
      setPoint (Current_Triangle, 2, sfVector2f'(Pos_3.X, Pos_3.Y));
      setOutlineThickness (Current_Triangle, 1.0);
      setOutlineColor (Current_Triangle, To_Sf_Color (C));
      setFillColor (Current_Triangle, To_Sf_Color (C));
      drawConvexShape (Current_Window, Current_Triangle);
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
      setPoint (Current_Triangle, 0, sfVector2f'(Pos_1.X, Pos_1.Y));
      setPoint (Current_Triangle, 1, sfVector2f'(Pos_2.X, Pos_2.Y));
      setPoint (Current_Triangle, 2, sfVector2f'(Pos_3.X, Pos_3.Y));
      setOutlineThickness (Current_Triangle, 1.0);
      setOutlineColor (Current_Triangle, To_Sf_Color (C));
      setFillColor (Current_Triangle, To_Sf_Color ((255, 255, 255, 0)));
      drawConvexShape (Current_Window, Current_Triangle);
   end Draw_Triangle_Lines;

   ------------------
   -- Draw_Texture --
   ------------------

   procedure Draw_Texture
     (Tex  : Texture_Type; Pos_X, Pos_Y : Integer;
      Tint : Color_Type := White_Color)
   is
   begin
      setPosition (Current_Sprite, sfVector2f'(Float (Pos_X), Float (Pos_Y)));
      setTexture (Current_Sprite, To_Sf_Texture_Ptr (Tex), sfTrue);
      setColor (Current_Sprite, To_Sf_Color (Tint));
      drawSprite (Current_Window, Current_Sprite);
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
      setPosition (Current_Sprite, sfVector2f'(Float (Pos_X), Float (Pos_Y)));
      setTexture (Current_Sprite, To_Sf_Texture_Ptr (Tex), sfTrue);
      setTextureRect
        (Current_Sprite, sfIntRect'(Src_X, Src_Y, Src_Width, Src_Height));
      setColor (Current_Sprite, To_Sf_Color (Tint));
      drawSprite (Current_Window, Current_Sprite);
   end Draw_Texture_Part;

   -----------------------------------------------
   -- Create_And_Initialize_Reused_Shapes --
   -----------------------------------------------

   procedure Create_And_Initialize_Reused_Shapes is
   begin
      Current_Line := create;
      resize (Current_Line, 2);
      setPrimitiveType (Current_Line, sfLines);

      Current_Circle := create;

      Current_Rectangle := create;

      Current_Triangle := create;
      setPointCount (Current_Triangle, 3);

      Current_Sprite := create;
   end Create_And_Initialize_Reused_Shapes;

begin
   Create_And_Initialize_Reused_Shapes;
end Qv.Draw;
