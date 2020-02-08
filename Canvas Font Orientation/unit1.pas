unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Spin;

type
  { TForm1 }

  TForm1 = class(TForm)
    PaintBox1: TPaintBox;
    SpinEdit1: TSpinEdit;
    procedure PaintBox1Paint(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
  private
    val: integer;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.PaintBox1Paint(Sender: TObject);
var
  cnv: TCanvas;
begin
  cnv:=PaintBox1.Canvas;
  cnv.Font.Color:= clGreen;
  cnv.Font.Orientation:= val*10;
  if val>=0 then
    cnv.Font.Style:= []
  else
    cnv.Font.Style:= [fsItalic];
  cnv.TextOut(200,100,'Hello World!');
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
  val:= SpinEdit1.Value;
  PaintBox1.Invalidate;
end;

end.

