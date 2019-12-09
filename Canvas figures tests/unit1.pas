unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    ImageList1: TImageList;
    ImageList2: TImageList;
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure Panel1Paint(Sender: TObject);
  private
    b, b0: TBitmap;
    procedure PaintBitmap;

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Panel1Paint(Sender: TObject);
begin
  b.SetSize(Panel1.Width, Panel1.Height);
  PaintBitmap;
  Panel1.Canvas.Draw(0, 0, b);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  b:= TBitmap.Create;
  b0:= TBitmap.Create;
end;

type
  TATMissedPoint = (
    ampnTopLeft,
    ampnTopRight,
    ampnBottomLeft,
    ampnBottomRight
    );

procedure CanvasStretchDraw(C: TCanvas; const R: TRect; Bmp: TBitmap); {$ifdef fpc}inline;{$endif}
begin
  {$ifdef fpc}
  C.StretchDraw(R, Bmp);
  {$else}
  //Delphi: StretchDraw cannot draw smooth
  StretchBlt(
    C.Handle, R.Left, R.Top, R.Right-R.Left, R.Bottom-R.Top,
    Bmp.Canvas.Handle, 0, 0, Bmp.Width, Bmp.Height,
    C.CopyMode);
  {$endif}
end;

procedure DrawTriangleRectFramed(C: TCanvas;
  AX, AY, ASizeX, ASizeY, AScale: integer;
  ATriKind: TATMissedPoint;
  AColorFill, AColorLine: TColor;
  b: TBitmap);
var
  p0, p1, p2, p3: TPoint;
  line1, line2: TPoint;
  ar: array[0..2] of TPoint;
begin
    b.SetSize(ASizeX*AScale, ASizeY*AScale);

    p0:= Point(0, 0);
    p1:= Point(b.Width, 0);
    p2:= Point(0, b.Height);
    p3:= Point(b.Width, b.Height);

    case ATriKind of
      ampnTopLeft: begin ar[0]:= p1; ar[1]:= p2; ar[2]:= p3; line1:= p1; line2:= p2; end;
      ampnTopRight: begin ar[0]:= p0; ar[1]:= p2; ar[2]:= p3; line1:= p0; line2:= p3; end;
      ampnBottomLeft: begin ar[0]:= p0; ar[1]:= p1; ar[2]:= p3; line1:= p0; line2:= p3; end;
      ampnBottomRight: begin ar[0]:= p0; ar[1]:= p1; ar[2]:= p2; line1:= p1; line2:= p2; end;
    end;

    //b.Canvas.Brush.Color:= AColorBG;
    //b.Canvas.FillRect(0, 0, b.Width, b.Height);
    b.Canvas.CopyRect(
      Rect(0, 0, b.Width, b.Height),
      C,
      Rect(AX, AY, AX+ASizeX, AY+ASizeY)
      );

    b.Canvas.Pen.Style:= psClear;
    b.Canvas.Brush.Color:= AColorFill;
    b.Canvas.Polygon(ar);
    b.Canvas.Pen.Style:= psSolid;

    b.Canvas.Pen.Color:= AColorLine;
    b.Canvas.Pen.Width:= AScale;
    b.Canvas.MoveTo(line1.X, line1.Y);
    b.Canvas.LineTo(line2.X, line2.Y);
    b.Canvas.Pen.Width:= 1;

    CanvasStretchDraw(C, Rect(AX, AY, AX+ASizeX, AY+ASizeY), b);
end;

procedure TForm1.PaintBitmap;
const
  cell = 10;
var
  c: tcanvas;
  i: integer;
begin
  c:= b.canvas;
  c.AntialiasingMode:= amOn;
  c.Brush.Color:= clMoneyGreen;
  c.FillRect(0, 0, b.Width, b.Height);

  c.Font.Size:= 20;
  c.Font.Color:= clRed;
  c.Brush.Style:= bsClear;
  c.TextOut(2, 0, 'Background_Red');
  c.Font.Color:= clBlue;
  c.Brush.Style:= bsClear;
  c.TextOut(2, 24, 'Background_Blue');
  c.Font.Color:= clGreen;
  c.Brush.Style:= bsClear;
  c.TextOut(2, 48, 'Background_Green');

  Imagelist1.Draw(c, 2, 8, 0);
  Imagelist1.Draw(c, 20, 8, 1);
  Imagelist2.Draw(c, 2, 30, 0);
  Imagelist2.Draw(c, 30, 30, 1);

  DrawTriangleRectFramed(c,
    0, 60, 40, 40,
    5,
    ampnTopLeft,
    clYellow,
    clPurple,
    b0
    );
  DrawTriangleRectFramed(c,
    60, 60, 40, 40,
    5,
    ampnTopRight,
    clYellow,
    clPurple,
    b0
    );
  DrawTriangleRectFramed(c,
    0, 120, 40, 40,
    5,
    ampnBottomLeft,
    clYellow,
    clPurple,
    b0
    );
  DrawTriangleRectFramed(c,
    60, 120, 40, 40,
    5,
    ampnBottomRight,
    clYellow,
    clPurple,
    b0
    );

  c.Font.Color:= clPurple;
  c.Font.Size:= 8;

  c.Brush.Style:= bsSolid;
  c.Brush.Color:= clYellow;
  c.Pen.Color:= clPurple;
  c.Rectangle(90, 100, 130, 140);
  c.TextOut(90, 80, 'Rect');

  c.Brush.Style:= bsClear;
  c.Pen.Color:= clPurple;
  c.Rectangle(140, 100, 180, 140);
  c.TextOut(130, 80, 'Rect empty');

  c.Brush.Color:= clYellow;
  c.Pen.Color:= clPurple;
  c.FillRect(190, 100, 230, 140);
  c.TextOut(190, 80, 'FillRect');

  c.Brush.Color:= clYellow;
  c.Pen.Color:= clPurple;
  c.FrameRect(240, 100, 280, 140);
  c.TextOut(240, 80, 'FrameRect');

  c.Brush.Color:= clYellow;
  c.Brush.Style:= bsSolid;
  c.Pen.Color:= clPurple;
  c.Ellipse(90, 160, 130, 200);
  c.TextOut(90, 140, 'Ellipse');
  c.Brush.Style:= bsSolid;

  c.Brush.Color:= clYellow;
  c.Brush.Style:= bsClear;
  c.Pen.Color:= clPurple;
  c.Ellipse(140, 160, 180, 200);
  c.TextOut(130, 140, 'Ellipse empty');
  c.Brush.Style:= bsSolid;

  c.Brush.Color:= clYellow;
  c.Pen.Color:= clPurple;
  c.Polygon([Point(90, 220), Point(130, 230), Point(110, 255)]);
  c.TextOut(90, 200, 'Poly');

  c.Brush.Style:= bsClear;
  c.Pen.Color:= clPurple;
  c.Polygon([Point(90+50, 220), Point(130+50, 230), Point(110+50, 255)]);
  c.TextOut(90+50, 200, 'Poly empty');
  c.Brush.Style:= bsSolid;

  c.Pen.Color:= clBlue;
  for i:= 0 to 6 do
    c.Line(250, 20+i*cell, 300, 20+i*cell);
  for i:= 0 to 6 do
    c.Line(250+i*cell, 20, 250+i*cell, 70);

  c.Pen.Color:= clRed;
  c.Brush.Color:= clYellow;
  i:= 0;
  c.Ellipse(250+i*cell, 20+i*cell, 250+(i+1)*cell, 20+(i+1)*cell);
  i:= 1;
  c.Rectangle(250+i*cell, 20+i*cell, 250+(i+1)*cell, 20+(i+1)*cell);
  i:= 2;
  c.FillRect(250+i*cell, 20+i*cell, 250+(i+1)*cell, 20+(i+1)*cell);
  i:= 3;
  c.FrameRect(250+i*cell, 20+i*cell, 250+(i+1)*cell, 20+(i+1)*cell);
end;

end.

