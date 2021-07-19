unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, process, Forms, Controls, Graphics,
  StdCtrls, ExtCtrls,
  {$ifdef darwin}
  CocoaGDIObjects,
  {$endif}
  LCLProc, LCLType;

type

  { TForm1 }

  TForm1 = class(TForm)
    CheckTextout: TCheckBox;
    CheckTextoutCl: TCheckBox;
    CheckRect: TCheckBox;
    CheckFillRect: TCheckBox;
    LabelMac: TLabel;
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
  chk_Text1,
  chk_Text2,
  chk_Rect1,
  chk_Rect2: boolean;
begin
  tick:= GetTickCount64;
  C:= PanelMain.Canvas;

  chk_Text1:= CheckTextout.Checked;
  chk_Text2:= CheckTextoutCl.Checked;
  chk_Rect1:= CheckRect.Checked;
  chk_Rect2:= CheckFillRect.Checked;

  {$ifdef darwin}
  _cocoa_ctx:= 0;
  _cocoa_text:= 0;
  _cocoa_rect:= 0;
  {$endif}

  for i:= 0 to NCount-1 do
  begin
    x:= i div 80 * 100;
    y:= i mod 80 * 10;

    if chk_Text1 then
    begin
      C.Font.Color:= clBlack;
      C.Brush.Color:= clYellow;
      C.Brush.Style:= bsClear;
      C.TextOut(x, y, 'Simple text string');
    end;

    if chk_Text2 then
    begin
      C.Font.Color:= Random($FFFFFF);
      C.Brush.Color:= Random($FFFFFF);
      C.Brush.Style:= bsSolid;
      C.TextOut(x, y, 'Colored text string');
    end;

    if chk_Rect1 then
    begin
      C.Pen.Color:= Random($FFFFFF);
      C.Brush.Style:= bsClear;
      C.Rectangle(x, y, x+100, y+10);
    end;

    if chk_Rect2 then
    begin
      C.Pen.Color:= Random($FFFFFF);
      C.Brush.Color:= Random($FFFFFF);
      C.Brush.Style:= bsSolid;
      C.FillRect(x, y, x+100, y+10);
    end;
  end;

  tick:= GetTickCount64-tick;
  LabelSpeed.Caption:= Format('%d ms per paint', [tick]);

  {$ifdef darwin}
  LabelMac.Caption:= Format('macOS context+textout+rect (msec): %d+%d+%d', [
    _cocoa_ctx,
    _cocoa_text,
    _cocoa_rect ]);
  {$endif}
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

