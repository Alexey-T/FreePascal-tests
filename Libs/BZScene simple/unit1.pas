unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs,
  BZBitmap, BZColors;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    FRect: TRect;
    b: TBZBitmap;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  i, j: integer;
  c0, c1, c2: TBZColor32;
begin
  FRect:= Rect(0, 0, 300, 200);
  c0.Create(0, 255, 0);
  c1.Create(255, 0, 0);
  c2.Create(0, 0, 255);

  b:= TBZBitmap.Create(300, 200);
  b.Clear(c0);

  for i:= 100 to 200 do
    for j:= 100 to 200 do
      if i>j then
        b.setPixel(i, j, c1)
      else
        b.setPixel(i, j, c2);
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
  b.DrawToCanvas(Self.Canvas, FRect);
end;

end.

