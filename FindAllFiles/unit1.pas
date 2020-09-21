unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    ButtonFind: TButton;
    ButtonDir: TButton;
    EditDirs: TEdit;
    EditMasks: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ListBox1: TListBox;
    Panel1: TPanel;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    procedure ButtonFindClick(Sender: TObject);
    procedure ButtonDirClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

uses FileUtil;

{$R *.lfm}

{ TForm1 }

procedure TForm1.ButtonFindClick(Sender: TObject);
var
  L: TStringList;
begin
  ListBox1.Items.Clear;
  L:= TStringList.Create;
  try
    FindAllFiles(L, EditDirs.text, EditMasks.Text);
    ListBox1.Items.Assign(L);
  finally
    L.Free;
  end;
end;

procedure TForm1.ButtonDirClick(Sender: TObject);
begin
  with SelectDirectoryDialog1 do
    if Execute then
      EditDirs.Text:= FileName;
end;

end.

