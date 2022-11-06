unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormPaint(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormPaint(Sender: TObject);
var
  c: TCanvas;
  i: integer;
  x, y, x2, y2: integer;
begin
  c:= Self.Canvas;
  c.Pen.Color:= clNavy;
  c.Brush.Color:= clWhite;

  for i:= 2 to 15 do
  begin
    x:= i*17+2;
    y:= 10;
    x2:= x+i;
    y2:= y+i;
    c.Ellipse(x, y, x2, y2);
  end;
end;

end.

