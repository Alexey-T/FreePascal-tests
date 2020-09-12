unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
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
const
  c: array[boolean] of string = ('MISSED', 'found');
var
  L: TStringList;
  dir, S: string;
  b: boolean;
  fnd: integer;
begin
  dir:= ExtractFileDir(ExtractFileDir(Application.ExeName));
  Listbox1.Items.Clear;
  Listbox1.Items.Add('Find all files/dirs in '+dir);

  L:= TStringList.Create;
  try
    FindAllFiles(L, dir, '', True);

    fnd:= 0;
    for S in L do
    begin
      b:= FileExists(S);
      if b then
        Inc(fnd)
      else
        Listbox1.Items.Add(S+': '+c[b]);
    end;
    Listbox1.Items.Add('FileExists ok: '+Inttostr(fnd));

    L.Clear;
    FindAllDirectories(L, dir);

    fnd:= 0;
    for S in L do
    begin
      b:= DirectoryExists(S);
      if b then
        Inc(fnd)
      else
        Listbox1.Items.Add(S+': '+c[b]);
    end;
    Listbox1.Items.Add('DirExists ok: '+Inttostr(fnd));

  finally
    L.Free;
  end;
end;

end.

