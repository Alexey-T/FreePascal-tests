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
uses lclintf;

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormPaint(Sender: TObject);
var
  i,sx,sy:integer;
begin
  sx:=Width div 8;
  sy:=Height div 8;
  Canvas.Pen.Style:=psDot;
  Canvas.Pen.Color:=clRed;
  Canvas.Pen.Mode:=pmNotXor;
  Canvas.Brush.Style:=bsSolid;
  Canvas.Brush.Color:=clYellow;
  Canvas.Pen.Width:=0;
  for i:=0 to 7 do
  begin
    Canvas.Moveto(0,sy*i);
    Canvas.LineTo(Width-1,sy*i);
  end;

  for i:=0 to 7 do
  begin
    Canvas.Moveto(sx*i,0);
    Canvas.LineTo(sx*i,Height-1);
  end;

end;

end.

