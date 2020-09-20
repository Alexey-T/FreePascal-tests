unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

uses FileUtil;

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  L: TStringList;
begin
  ListBox1.Items.Clear;
  L:= TStringList.Create;
  try
    FindAllFiles(L, edit1.text, '*');
    ListBox1.Items.Assign(L);
  finally
    L.Free;
  end;
end;

end.

