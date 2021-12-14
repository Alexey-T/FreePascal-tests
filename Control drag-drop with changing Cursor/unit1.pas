unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type
  { TMyPanel }

  TMyPanel = class(TPanel)
  private
    FMouseDown: boolean;
    FMouseDownPnt: TPoint;
    procedure UpdateCursor;
  public
    constructor Create(TheOwner: TComponent); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
  end;

type
  { TForm1 }

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    FPanel: TMyPanel;

  public

  end;

var
  Form1: TForm1;

implementation

uses LCLIntf, LCLProc, LCLType;

{$R *.lfm}

{ TMyPanel }

procedure TMyPanel.UpdateCursor;
begin
  if Mouse.IsDragging then
  begin
    if ssCtrl in GetKeyShiftState then
      Cursor:= crMultiDrag
    else
      Cursor:= crDrag;
  end
  else
    Cursor:= crIBeam;
end;

constructor TMyPanel.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  DragMode:= dmManual;
  FMouseDownPnt:= Point(-1, -1);
  Cursor:= crIBeam;
end;

procedure TMyPanel.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key=VK_CONTROL) then
  begin
    UpdateCursor;
    Key:= 0;
  end;
end;

procedure TMyPanel.KeyUp(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key=VK_CONTROL) then
  begin
    UpdateCursor;
    Key:= 0;
  end;
end;

procedure TMyPanel.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  FMouseDownPnt:= Point(X, Y);
  FMouseDown:= true;
end;

procedure TMyPanel.MouseUp(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
  FMouseDownPnt:= Point(-1, -1);
  FMouseDown:= false;
  UpdateCursor;
end;

procedure TMyPanel.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseMove(Shift, X, Y);
  if FMouseDown then
  begin
    if Abs(X-FMouseDownPnt.X) + Abs(Y-FMouseDownPnt.Y)>=6 then
      if not Mouse.IsDragging then
        BeginDrag(true);
    UpdateCursor;
  end;
end;

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  FPanel:= TMyPanel.Create(Self);
  FPanel.Parent:= Self;
  FPanel.Color:= clMoneyGreen;
  FPanel.BorderSpacing.Around:= 12;
  FPanel.Align:= alClient;
  FPanel.Show;
end;

end.

