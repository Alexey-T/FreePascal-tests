unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Spin;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    SpinEdit1: TSpinEdit;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

uses unit2;

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  f: TForm2;
  t: qword;
begin
  f:= TForm2.Create(Self);
  f.CtlCount:= SpinEdit1.Value;
  t:= GetTickCount64;
  f.Show;
  t:= (GetTickCount64-t) div SpinEdit1.Value;
  caption:= 'time: '+inttostr(t)+' ms per control';
end;

end.

