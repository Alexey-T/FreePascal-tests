unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

type

  { TMy }

  TMy = class(TCustomControl)
  private
    FIsFocused: boolean;
    FShowCaret: boolean;
    FTimer: TTimer;
    procedure TimerTick(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
  protected
    procedure Paint; override;
    procedure DoEnter; override;
    procedure DoExit; override;
  end;

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  Ctl: TMy;
begin
  Ctl:= TMy.Create(Self);
  Ctl.Parent:= Self;
  Ctl.Align:= alClient;
  Ctl.Show;
end;

procedure TForm1.FormShow(Sender: TObject);
begin

end;

{ TMy }

procedure TMy.TimerTick(Sender: TObject);
begin
  FShowCaret:= not FShowCaret;
  Invalidate;
end;

constructor TMy.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FIsFocused:= false;
  FShowCaret:= true;
  FTimer:= TTimer.Create(Self);
  FTimer.Interval:= 500;
  FTimer.OnTimer:= @TimerTick;
end;

procedure TMy.Paint;
var
  C: TCanvas;
begin
  C:= Canvas;
  C.Brush.Color:= clCream;
  C.FillRect(ClientRect);
  C.Pen.Color:= clGray;
  C.Rectangle(3, 3, ClientWidth-3, ClientHeight-3);
  if not FIsFocused then
  begin
    C.Font.Name:= 'dafault';
    C.Font.Size:= 12;
    C.Font.Color:= clBlack;
    C.TextOut(4, 4, '(not focused)')
  end
  else
  if FShowCaret then
  begin
    C.Brush.Color:= clRed;
    C.Fillrect(10, 6, 14, 30);
  end;
end;

procedure TMy.DoEnter;
begin
  inherited DoEnter;
  FIsFocused:= true;
  Invalidate;
end;

procedure TMy.DoExit;
begin
  inherited DoExit;
  FIsFocused:= false;
  Invalidate;
end;


end.

