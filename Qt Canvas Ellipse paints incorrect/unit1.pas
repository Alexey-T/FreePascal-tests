unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    B: TBitmap;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

const
  NSize = 20;

procedure TForm1.FormCreate(Sender: TObject);
begin
  B:= TBitmap.Create;
  B.SetSize(NSize, NSize);
end;

procedure TForm1.FormPaint(Sender: TObject);
var
  RRound: TRect;
begin
  RRound:= Rect(0, 0, NSize, NSize);
  Canvas.Brush.Color:= clGreen;
  Canvas.FillRect(RRound);

  B.Canvas.Brush.Color:= clBlue;
  B.Canvas.FillRect(RRound);

  B.Canvas.Brush.Color:= clRed;
  B.Canvas.Pen.Color:= clWhite;
  B.Canvas.Ellipse(RRound);

  Canvas.StretchDraw(RRound, B);

  Canvas.Pen.Color:= clYellow;
  Canvas.Line(2, 2, NSize-3, NSize-3);
  Canvas.Line(2, NSize-3, NSize-3, 2);
end;


end.

