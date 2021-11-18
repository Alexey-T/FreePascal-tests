unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Spin,
  StdCtrls, Types;

type

  { TForm1 }

  TForm1 = class(TForm)
    Label1: TLabel;
    ListBox1: TListBox;
    Panel1: TPanel;
    Panel2: TPanel;
    edSleep: TSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure Panel1MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
  private
    procedure Log(const s: string);
  public

  end;

var
  Form1: TForm1;

implementation

uses LCLIntf;

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  LCLIntf.SetFocus(Panel1.Handle);
end;

procedure TForm1.Panel1MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  Log('mouse wheel, delta '+IntToStr(WheelDelta)+'; '+TimeToStr(Now));
  Sleep(edSleep.Value);
  Handled:= true;
end;

procedure TForm1.Log(const s: string);
begin
  Listbox1.Items.Add(s);
  Listbox1.ItemIndex:= Listbox1.Items.Count-1;
end;

end.

