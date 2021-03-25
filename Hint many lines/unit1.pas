unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  i: integer;
  s: string;
begin
  s:= '';
  for i:= 1 to 50 do
  begin
    if s<>'' then
      s+=#10;
    s+= 'line'+inttostr(i);
  end;
  Button1.hint:= s;
end;

end.

