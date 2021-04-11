unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    chkBuff: TCheckBox;
    Panel1: TPanel;
    procedure chkBuffChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Panel1Paint(Sender: TObject);
  private
    b: TBitmap;

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure Pnt(c: tcanvas);
begin
  c.brush.color:= clYellow;
  c.fillrect(0, 0, 100+2, 100+2);

  c.pen.color:= clRed;
  c.moveto(1,1);
  c.lineto(100,1);
  c.moveto(1,1);
  c.lineto(1,100);
  c.moveto(100,1);
  c.lineto(100,100);
  c.moveto(1,100);
  c.lineto(100+1,100);

  c.pen.color:= clNavy;
  c.Rectangle(2,2,100,100);
end;


{ TForm1 }

procedure TForm1.Panel1Paint(Sender: TObject);
begin
  if chkBuff.Checked then
  begin
    Pnt(b.canvas);
    panel1.Canvas.Draw(0, 0, b);
  end
  else
    Pnt(panel1.canvas);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  b:= tbitmap.create;
  b.setsize(300, 300);
end;

procedure TForm1.chkBuffChange(Sender: TObject);
begin
  panel1.Invalidate;
end;

end.

