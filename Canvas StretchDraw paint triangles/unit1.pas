unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure DrawRectangledTri(C: TCanvas;
  AX, AY, ASizeX, ASizeY, AScale: integer;
  ATriKind: integer;
  AColorBG, AColorFill, AColorLine: TColor);
var
  b: TBitmap;
  p0, p1, p2, p3: TPoint;
  line1, line2: TPoint;
  ar: array[0..2] of TPoint;
begin
  b:= TBitmap.Create;
  try
    b.SetSize(ASizeX*AScale, ASizeY*AScale);

    p0:= Point(0, 0);
    p1:= Point(b.Width, 0);
    p2:= Point(0, b.Height);
    p3:= Point(b.Width, b.Height);

    case ATriKind of
      0: begin ar[0]:= p1; ar[1]:= p2; ar[2]:= p3; line1:= p1; line2:= p2; end;
      1: begin ar[0]:= p0; ar[1]:= p2; ar[2]:= p3; line1:= p0; line2:= p3; end;
      2: begin ar[0]:= p0; ar[1]:= p1; ar[2]:= p3; line1:= p0; line2:= p3; end;
      3: begin ar[0]:= p0; ar[1]:= p1; ar[2]:= p2; line1:= p1; line2:= p2; end;
    end;

    b.Canvas.Brush.Color:= AColorBG;
    b.Canvas.Fillrect(0, 0, b.Width, b.Height);

    b.Canvas.Brush.Color:= AColorFill;
    b.Canvas.Polygon(ar);

    b.Canvas.Pen.Color:= AColorLine;
    b.Canvas.Pen.Width:= AScale;
    b.Canvas.MoveTo(line1);
    b.Canvas.LineTo(line2);

    C.StretchDraw(
      Rect(AX, AY, AX+ASizeX, AY+ASizeY),
      b);
  finally
    b.Free;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
const
  cBg = clGray;
  cFill = clLtGray;
  cLine = clYellow;
begin
  DrawRectangledTri(Canvas, 0, 0, 40, 100, 5, 0, cBG, cFill, cLine);
  DrawRectangledTri(Canvas, 50, 0, 40, 100, 5, 1, cBG, cFill, cLine);
  DrawRectangledTri(Canvas, 0, 110, 40, 100, 5, 2, cBG, cFill, cLine);
  DrawRectangledTri(Canvas, 50, 110, 40, 100, 5, 3, cBG, cFill, cLine);
end;

end.

