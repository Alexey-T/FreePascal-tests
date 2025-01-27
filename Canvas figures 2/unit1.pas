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
    procedure Panel1Paint(Sender: TObject);
  private
    b: TBitmap;
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
end;


procedure TForm1.PaintBitmap;
var
  c: tcanvas;
begin
  c:= b.canvas;

  c.Brush.Color:= clMoneyGreen;
  c.FillRect(0, 0, b.Width, b.Height);

  c.Pen.Color:= clRed;
  c.MoveTo(101, 300);
  c.LineTo(110, 300);
  c.Pen.Color:= clBlue;
  c.MoveTo(110, 301);
  c.LineTo(110, 310);
  c.Pen.Color:= clRed;
  c.MoveTo(109, 310);
  c.LineTo(100, 310);
  c.Pen.Color:= clBlue;
  c.MoveTo(100, 309);
  c.LineTo(100, 300);

  c.Pen.Color:= clRed;
  c.MoveTo(102, 302);
  c.LineTo(109, 309);
  c.Pen.Color:= clBlue;
  c.MoveTo(108, 302);
  c.LineTo(101, 309);

  c.Brush.Color:= clYellow;
  c.FillRect(102+9, 302-2, 109+9+2, 309+2);

  c.Pen.Color:= clRed;
  c.MoveTo(102+10, 309-1);
  c.LineTo(109+10, 302-1);
  c.Pen.Color:= clBlue;
  c.MoveTo(108+10, 309-1);
  c.LineTo(101+10, 302-1);
end;

end.

