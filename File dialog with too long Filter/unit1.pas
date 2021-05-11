unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  s: string;
  i: integer;
begin
  s:= 'Long list (';
  for i:= 1 to 30 do
    s:= s+'extent_'+IntToStr(i)+' ';
  s+= ')|*.txt;*.pas|All files|*';
  OpenDialog1.Filter:= s;
  OpenDialog1.Execute;
end;

end.

