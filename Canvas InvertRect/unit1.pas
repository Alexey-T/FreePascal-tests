unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Panel1: TPanel;
    Timer1: TTimer;
    procedure Panel1Paint(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    FOn: boolean;
  public

  end;

var
  Form1: TForm1;

implementation

uses ATCanvasPrimitives;

{$R *.lfm}

{ TForm1 }

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  FOn:= not FOn;
  Panel1.Invalidate;
end;

procedure TForm1.Panel1Paint(Sender: TObject);
var
  R: TRect;
  C: TCanvas;
begin
  R:= Panel1.ClientRect;
  C:= Panel1.Canvas;
  C.Brush.Color:= clMoneyGreen;
  C.FillRect(R);
  if FOn then
    CanvasInvertRect(C, Rect(20, 0, 24, 20), clPurple);
end;

end.

