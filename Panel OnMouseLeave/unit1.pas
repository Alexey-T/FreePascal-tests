unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TMyPanel }

  TMyPanel = class(TCustomControl)
  public
    constructor Create(AOwner: TComponent); override;
  end;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
  private
    panelA, panelB: TMyPanel;
    procedure PanLeave(Sender: TObject);
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TMyPanel }

constructor TMyPanel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Caption:= 'dd';
  ControlStyle:= ControlStyle+[csOpaque, csDoubleClicks, csTripleClicks];
  TabStop:= true;

  Width:= 300;
  Height:= 250;
  Font.Name:= 'Courier New';
  Font.Size:= 9;

end;

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  panelA:= TMyPanel.Create(Self);
  panelA.Parent:= Self;
  panelA.Align:= alClient;
  panelA.OnClick:= @Panel1Click;
  panelA.Show;
end;

procedure TForm1.Panel1Click(Sender: TObject);
var
  p: TPoint;
begin
  if panelB=nil then
  begin
    panelB:= TMyPanel.create(Self);
    panelB.parent:= panelA;
    panelB.color:= clred;
    panelB.caption:= 'click';
    panelB.width:= 100;
    panelB.Height:= 30;
    panelB.OnMouseLeave:=@PanLeave;
    panelB.OnClick:= @PanLeave;
  end;

  p:= mouse.CursorPos;
  p:= panelA.ScreenToClient(p);
  panelB.left:= p.x-panelB.Width div 2;
  panelB.top:= p.y-panelB.Height div 2;
  panelB.show;
end;

procedure TForm1.PanLeave(Sender: TObject);
begin
  panelB.Hide;
end;

end.

