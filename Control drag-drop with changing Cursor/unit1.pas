unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  LMessages;

type
  { TMyPanel }

  TMyPanel = class(TPanel)
  private
    FMouseDown: boolean;
    FMouseDownPnt: TPoint;
    procedure UpdateCursor(AShift: TShiftState);
  public
    constructor Create(TheOwner: TComponent); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyUp(var Key: Word; Shift: TShiftState); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure DragOver(Source: TObject; X, Y: Integer; State: TDragState;
      var Accept: Boolean); override;
    procedure MouseEnter; override;
    procedure MouseLeave; override;
  end;

type
  { TForm1 }

  TForm1 = class(TForm)
    PanelMain1: TPanel;
    PanelMain2: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure PanelMain1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
  private
    FPanel, FPanel2: TMyPanel;

  public

  end;

var
  Form1: TForm1;

implementation

uses LCLIntf, LCLProc, LCLType;

{$R *.lfm}

{ TMyPanel }

procedure TMyPanel.UpdateCursor(AShift: TShiftState);
//var
  //P: TPoint;
begin
  //P:= ScreenToClient(Mouse.CursorPos);
  //if not PtInRect(ClientRect, P) then exit;

  if Mouse.IsDragging then
  begin
    if ssCtrl in AShift then
      DragCursor:= crMultiDrag
    else
      DragCursor:= crDrag;
    Cursor:= DragCursor;
  end
  else
    Cursor:= crIBeam;
end;

constructor TMyPanel.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);
  FMouseDownPnt:= Point(-1, -1);
  Cursor:= crIBeam;
  DragMode:= dmManual; //to emulate code in ATSynEdit
end;

procedure TMyPanel.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key=VK_CONTROL) then
  begin
    UpdateCursor(Shift);
    Key:= 0;
  end;
end;

procedure TMyPanel.KeyUp(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Mouse.IsDragging then
    EndDrag(true);
  if (Key=VK_CONTROL) then
  begin
    UpdateCursor(Shift);
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
  UpdateCursor(Shift);
end;

procedure TMyPanel.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseMove(Shift, X, Y);
  if FMouseDown then
  begin
    if Abs(X-FMouseDownPnt.X) + Abs(Y-FMouseDownPnt.Y)>=6 then
      if not Mouse.IsDragging then
        BeginDrag(true);
    UpdateCursor(Shift);
  end;
end;

procedure TMyPanel.DragOver(Source: TObject; X, Y: Integer; State: TDragState;
  var Accept: Boolean);
begin
  if Source is TMyPanel then
    Accept:= true
  else
    inherited DragOver(Source, X, Y, State, Accept);
end;

procedure TMyPanel.MouseEnter;
begin
  inherited;
  Caption:= 'Mouse entered';
end;

procedure TMyPanel.MouseLeave;
begin
  inherited MouseLeave;
  Caption:= '';
end;

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  FPanel:= TMyPanel.Create(Self);
  FPanel.Parent:= PanelMain1;
  FPanel.Color:= clMoneyGreen;
  FPanel.BorderSpacing.Around:= 12;
  FPanel.Align:= alClient;
  FPanel.Width:= 200;
  FPanel.Show;

  FPanel2:= TMyPanel.Create(Self);
  FPanel2.Parent:= PanelMain2;
  FPanel2.Color:= clSkyBlue;
  FPanel2.BorderSpacing.Around:= 12;
  FPanel2.Align:= alClient;
  FPanel2.Show;
end;

procedure TForm1.PanelMain1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept:= false;
end;


end.

