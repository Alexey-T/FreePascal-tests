unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  LMessages;

type

  { TMy }

  TMy = class(TCustomControl)
  private
    FBarInited: boolean;
  protected
    procedure WMVScroll(var Msg: TLMVScroll); message LM_VSCROLL;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Paint; override;
  end;


type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormShow(Sender: TObject);
  private
    my: TCustomControl;
  private
  end;

var
  Form1: TForm1;

implementation

uses LCLIntf, LCLType;

{$R *.lfm}

{ TMy }

constructor TMy.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  Name:= 'my_';
  Caption:= 'test...';
  Width:= 200;
  Height:= 100;

end;

procedure TMy.WMVScroll(var Msg: TLMVScroll);
begin
  case Msg.ScrollCode of
    SB_THUMBPOSITION:
      begin
        //if Message.Msg=0 then
          caption:= 'thumb pos '+inttostr(Msg.Pos);
      end;
    SB_THUMBTRACK:
      begin
        caption:= 'thumb track '+inttostr(Msg.Pos)
      end;
  end;
  Invalidate;
end;

procedure TMy.Paint;
var
  Info: TScrollInfo;
  c: TCanvas;
begin
  inherited Paint;

  if not FBarInited then
  begin
    FBarInited:= true;
    FillChar(Info, SizeOf(Info), 0);
    Info.cbSize:= SizeOf(Info);
    Info.nMax:= 1000;
    Info.nPage:= 100;
    Info.fMask:= SIF_ALL;

    ShowScrollBar(Handle, SB_Vert, true);
    SetScrollInfo(Handle, SB_Vert, Info, true);
  end;

  c:= Canvas;
  c.brush.color:= clYellow;
  c.FillRect(c.ClipRect);
  c.Pen.Color:= clred;
  c.Rectangle(10, 30, 200, 80);
  c.Font.Color:= clGreen;
  c.TextOut(5, 5, Caption);
end;

{ TForm1 }

procedure TForm1.FormShow(Sender: TObject);
begin
  my:= TMy.Create(Self);
  my.Parent:= Self;
  my.BorderSpacing.Around:= 6;
  my.Align:= alClient;
  my.Show;
end;

end.

