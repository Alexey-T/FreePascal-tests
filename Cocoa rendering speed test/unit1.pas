unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, process, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, LCLProc, LCLType;

type

  { TForm1 }

  TForm1 = class(TForm)
    CheckTextout: TCheckBox;
    CheckTextoutCl: TCheckBox;
    CheckRect: TCheckBox;
    CheckFillRect: TCheckBox;
    LabelSpeed: TLabel;
    PanelCtl: TPanel;
    PanelMain: TPanel;
    TimerMain: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure PanelMainPaint(Sender: TObject);
    procedure TimerMainTimer(Sender: TObject);
  private
    NCount: integer;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.PanelMainPaint(Sender: TObject);
var
  tick: QWord;
  C: TCanvas;
  x, y: integer;
  i: integer;
begin
  tick:= GetTickCount64;
  C:= PanelMain.Canvas;

  for i:= 0 to NCount-1 do
  begin
    x:= i div 80 * 100;
    y:= i mod 80 * 10;

    if CheckTextout.Checked then
    begin
      C.Brush.Style:= bsSolid;
      C.TextOut(x, y, 'Simple text string');
    end;

    if CheckTextoutCl.Checked then
    begin
      C.Font.Color:= Random($FFFFFF);
      C.Brush.Color:= Random($FFFFFF);
      C.Brush.Style:= bsSolid;
      C.TextOut(x, y, 'Colored text string');
    end;

    if CheckRect.Checked then
    begin
      C.Pen.Color:= Random($FFFFFF);
      C.Brush.Style:= bsClear;
      C.Rectangle(x, y, x+100, y+10);
    end;

    if CheckFillRect.Checked then
    begin
      C.Pen.Color:= Random($FFFFFF);
      C.Brush.Color:= Random($FFFFFF);
      C.Brush.Style:= bsSolid;
      C.FillRect(x, y, x+100, y+10);
    end;
  end;

  tick:= GetTickCount64-tick;
  LabelSpeed.Caption:= Format('%d ms per paint', [tick]);
end;

procedure TForm1.TimerMainTimer(Sender: TObject);
begin
  PanelMain.Invalidate;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  NCount:= 1000;
end;

end.

