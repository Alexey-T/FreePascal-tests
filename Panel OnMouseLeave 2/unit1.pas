unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Panel1: TPanel;
    procedure Panel1Click(Sender: TObject);
  private
    pan: tpanel;
    procedure PanLeave(Sender: TObject);
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Panel1Click(Sender: TObject);
var
  p: TPoint;
begin
  if pan=nil then
  begin
    pan:= tpanel.create(Self);
    pan.parent:= panel1;
    pan.color:= clred;
    pan.caption:= 'click';
    pan.width:= 100;
    pan.Height:= 30;
    pan.OnMouseLeave:=@PanLeave;
    pan.OnClick:= @PanLeave;
  end;

  p:= mouse.CursorPos;
  p:= panel1.ScreenToClient(p);
  pan.left:= p.x-pan.Width div 2;
  pan.top:= p.y-pan.Height div 2;
  pan.show;
end;

procedure TForm1.PanLeave(Sender: TObject);
begin
  pan.Hide;
end;

end.

