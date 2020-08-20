unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Menus, ComCtrls, Types, math;

type

  { TForm1 }

  TForm1 = class(TForm)
    chk_Pro: TCheckBox;
    chkKeepX: TCheckBox;
    chkKeepY: TCheckBox;
    chk_St: TCheckBox;
    chk_StOut: TCheckBox;
    chk_StIn: TCheckBox;
    Image1: TImage;
    Panel1: TPanel;
    TrackBar1: TTrackBar;
    procedure Button1Click(Sender: TObject);
    procedure chkKeepXChange(Sender: TObject);
    procedure chkKeepYChange(Sender: TObject);
    procedure chk_ProChange(Sender: TObject);
    procedure chk_StChange(Sender: TObject);
    procedure chk_StInChange(Sender: TObject);
    procedure chk_StOutChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image1MouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure Image1MouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure Image1PaintBackground(ASender: TObject; ACanvas: TCanvas; ARect: TRect);
    procedure TrackBar1Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin

end;

procedure TForm1.chkKeepXChange(Sender: TObject);
begin
  image1.KeepOriginXWhenClipped:= chkKeepX.Checked;
end;

procedure TForm1.chkKeepYChange(Sender: TObject);
begin
  image1.KeepOriginYWhenClipped:= chkKeepY.Checked;
end;

procedure TForm1.chk_ProChange(Sender: TObject);
begin
  image1.Proportional:= chk_Pro.Checked;
end;

procedure TForm1.chk_StChange(Sender: TObject);
begin
  image1.Stretch:= chk_St.Checked;
end;

procedure TForm1.chk_StInChange(Sender: TObject);
begin
  image1.StretchInEnabled:= chk_StIn.Checked;
end;

procedure TForm1.chk_StOutChange(Sender: TObject);
begin
  image1.StretchOutEnabled:= chk_StOut.Checked;
end;

procedure TForm1.FormCreate(Sender: TObject);
const fn ='tra.png';
begin
  image1.Picture.LoadFromFile(fn);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  chk_Pro.Checked:= image1.Proportional;
  chk_St.Checked:= image1.Stretch;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

procedure TForm1.Image1MouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  if ssCtrl in Shift then
    Image1.ZoomPercents:= Max(10, (Image1.ZoomPercents div 10 -1)*10);
end;

procedure TForm1.Image1MouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  if ssCtrl in Shift then
    Image1.ZoomPercents:= (Image1.ZoomPercents div 10 +1)*10;
end;

procedure TForm1.Image1PaintBackground(ASender: TObject; ACanvas: TCanvas;
  ARect: TRect);
begin
  ACanvas.brush.color:= clgreen;
  ACanvas.FillRect(arect);
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  image1.ZoomPercents:=TrackBar1.Position;
end;

end.

