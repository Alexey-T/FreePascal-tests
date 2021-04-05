unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls,
  ExtCtrls, Unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    mnuPlugs: TMenuItem;
    mnuTest: TMenuItem;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
  private
    f2: TForm;
  public

  end;

var
  Form1: TForm1;

implementation

uses
  LCLIntf, LCLProc, LCLType;

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  f2:= TForm2.Create(nil);
  f2.Hide;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var p: tpoint;
begin
  if key=vk_f2 then
  begin
    Timer1.Enabled:= false;
    Timer1.Enabled:= true;
    p:= memo1.clienttoscreen(point(0, 0));
    f2.Left:= p.x+20;
    f2.top:= p.y-10;
    f2.Show;
    LCLIntf.SetFocus(Self.Handle);
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  f2.Hide;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  mi: TMenuitem;
begin
  mnuPlugs.Clear;

  mi:= TMenuitem.create(Self);
  mi.caption:= 'pl';
  mnuPlugs.Add(mi);
end;

end.

