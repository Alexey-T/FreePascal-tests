unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  LCLProc, LCLType, LCLIntf, Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Panel1: TPanel;
    Timer1: TTimer;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Panel1Paint(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    FOn: boolean;
    FX: integer;
    FY: integer;
    FCaretRect: TRect;
    procedure UpdateR;
  public

  end;

var
  Form1: TForm1;

implementation

uses ATCanvasPrimitives;

{$R *.lfm}

const
  CharSizeX = 10;
  CharSizeY = 18;

{ TForm1 }

procedure TForm1.UpdateR;
begin
  FCaretRect:= Rect(
      FX*CharSizeX,
      FY*CharSizeY,
      (FX+1)*CharSizeX,
      (FY+1)*CharSizeY);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  FOn:= not FOn;
  InvalidateRect(Panel1.Handle, @FCaretRect, false);
end;

procedure TForm1.Panel1Paint(Sender: TObject);
var
  C: TCanvas;
begin
  C:= Panel1.Canvas;
  if FOn then
    CanvasInvertRect(C, FCaretRect, clPurple)
  else
  begin
    C.Brush.Color:= clYellow;
    C.FillRect(FCaretRect);
  end;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if key=VK_UP then
  begin
    FY:= Max(0, FY-1);
    UpdateR;
    Panel1.Invalidate;
    key:= 0;
  end;
  if key=VK_DOWN then
  begin
    FY:= Min(15, FY+1);
    UpdateR;
    Panel1.Invalidate;
    key:= 0;
  end;
  if key=VK_LEFT then
  begin
    FX:= Max(0, FX-1);
    UpdateR;
    Panel1.Invalidate;
    key:= 0;
  end;
  if key=VK_RIGHT then
  begin
    FX:= Min(15, FX+1);
    UpdateR;
    Panel1.Invalidate;
    key:= 0;
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  UpdateR;
end;

end.

