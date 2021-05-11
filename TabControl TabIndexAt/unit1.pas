unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  Spin;

type

  { TForm1 }

  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    PageControl1: TPageControl;
    edSide: TSpinEdit;
    TabControl1: TTabControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    procedure edSideChange(Sender: TObject);
    procedure PageControl1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TabControl1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

const
  cnt: integer=0;

procedure TForm1.TabControl1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  p:tpoint;
  n:integer;
begin
  p:=mouse.CursorPos;
  p:=TabControl1.ScreenToClient(p);
  p.y:= -10; //hack!
  n:=TabControl1.IndexOfTabAt(p);
  inc(cnt);
  caption:= format('call number %d, tab index %d', [cnt, n]);
end;

procedure TForm1.PageControl1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  p:tpoint;
  n:integer;
begin
  p:=mouse.CursorPos;
  p:=PageControl1.ScreenToClient(p);
  n:=PageControl1.IndexOfTabAt(p);
  inc(cnt);
  caption:= format('call number %d, page index %d', [cnt, n]);
end;

procedure TForm1.edSideChange(Sender: TObject);
begin
  PageControl1.TabPosition:= TTabPosition(edSide.value);
  TabControl1.TabPosition:= TTabPosition(edSide.value);
end;

end.

