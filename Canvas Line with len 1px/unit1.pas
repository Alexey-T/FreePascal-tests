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

procedure Ln(c: tcanvas; x, y, len: integer; color: TColor);
begin
  c.pen.color:= color;
  c.MoveTo(x, y);
  c.LineTo(x+len, y);
  c.MoveTo(x, y);
  c.LineTo(x, y+len);
end;

procedure TForm1.FormPaint(Sender: TObject);
var
  i: integer;
begin
  for i:= 1 to 6 do
  begin
    ln(canvas, 10, 10+i*6, i, clRed);
    ln(canvas, 20, 10+i*6, i, clGreen);
  end;
end;

end.

