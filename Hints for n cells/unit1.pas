unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure Panel1Paint(Sender: TObject);
  private
    FOldCell: integer;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  FOldCell:= -1;
  Application.HintHidePause:= 5000;
end;

procedure TForm1.Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  nCell: integer;
  w: integer;
begin
  w:= panel1.Width;
  if X<w div 3 then nCell:= 0
  else
  if X<w*2 div 3 then nCell:= 1
  else
    nCell:= 2;

  if nCell<>FOldCell then
  begin
    FOldCell:= nCell;
    Panel1.Hint:= 'Hint for cell '+Inttostr(nCell+1);
    Application.HideHint;
    Application.ActivateHint(Mouse.CursorPos, true);
  end;
end;

procedure TForm1.Panel1Paint(Sender: TObject);
const
  cells=3;
var
  w, h, i: integer;
  c: tcanvas;
begin
  w:= panel1.Width;
  h:= panel1.Height;
  c:= panel1.Canvas;

  for i:= 0 to cells-1 do
  begin
    c.pen.color:= clNavy;
    c.Rectangle(i*w div 3+1, 0, (i+1)*w div 3-1, h);
    c.TextOut(i*w div 3+15, h div 2 - 5, 'Cell '+Inttostr(i+1));
  end;
end;

end.

