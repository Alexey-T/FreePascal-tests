unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    CheckBoxBuffered: TCheckBox;
    Panel1: TPanel;
    procedure CheckBoxBufferedChange(Sender: TObject);
    procedure DoPictureTo(C: TCanvas);
    procedure Panel1Paint(Sender: TObject);
  private
    FBitmap: TBitmap;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.DoPictureTo(C: TCanvas);
begin
  C.AntialiasingMode:= amOn;
  C.Brush.Color:= clWhite;
  C.FillRect(Panel1.ClientRect);
  C.Font.Color:= clNavy;
  C.Font.Size:= 14;
  C.TextOut(5, 5, 'Some Text Here...');
  C.Font.Color:= clGreen;
  C.Font.Size:= 9;
  C.TextOut(200, 5, 'Some Text Here...');
  C.Pen.Color:= clRed;
  C.Pen.Width:= 10;
  C.Ellipse(30, 30, 200, 200);
  C.Pen.Color:= clGreen;
  C.Pen.Width:= 1;
  C.Ellipse(200, 30, 250, 60);
end;

procedure TForm1.CheckBoxBufferedChange(Sender: TObject);
begin
  Panel1.Invalidate;
end;

procedure TForm1.Panel1Paint(Sender: TObject);
var
  C: TCanvas;
  R: TRect;
begin
  if CheckBoxBuffered.Checked then
  begin
    if FBitmap=nil then
      FBitmap:= TBitmap.Create;
    FBitmap.SetSize(Panel1.Width, Panel1.Height);
    C:= FBitmap.Canvas;
    DoPictureTo(C);
    R:= Rect(0, 0, Panel1.Width, Panel1.Height);
    Panel1.Canvas.CopyRect(R, C, R);
  end
  else
  begin
    DoPictureTo(Panel1.Canvas);
  end;
end;

end.

