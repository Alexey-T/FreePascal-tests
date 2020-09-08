unit Unit1;

{$mode objfpc}{$H+}
{$codepage utf8}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
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
begin
  label1.Caption:= '択範囲をコピー/追加'+': t.log'#10'追加'#10'コピ'#10'z'#10'zz.'#10'コピ'#10'コピ'#10'コピ'#10'Tj';
  label2.Caption:= '択範囲をコピー/追加'+': t.log';
end;

end.

