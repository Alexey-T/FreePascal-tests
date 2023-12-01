unit formmain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Buttons, StdCtrls, ATBinHex;

type
  { TfmMain }

  TfmMain = class(TForm)
    btnOpen: TButton;
    OpenDialog1: TOpenDialog;
    PanelOpt: TPanel;
    procedure btnOpenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
    procedure OpenFile(const Filename: string);
  public
    { public declarations }
    V: TATBinHex;
    fs: TFileStream;
  end;

var
  fmMain: TfmMain;

implementation

{$R *.lfm}

{ TfmMain }

procedure TfmMain.FormCreate(Sender: TObject);
var
  fn: string;
begin
  fs:= nil;

  V:= TATBinHex.Create(Self);
  V.Parent:= Self;
  V.Align:= alClient;
  V.Font.Size:= 10;

  V.TextGutter:= true;
  V.TextGutterLinesStep:= 10;

  fn:= ExtractFilePath(Application.ExeName)+'formmain.pas';
  if FileExists(fn) then
    OpenFile(fn);

end;

procedure TfmMain.btnOpenClick(Sender: TObject);
begin
  with OpenDialog1 do
    if Execute then
      OpenFile(Filename);
end;

procedure TfmMain.OpenFile(const Filename: string);
begin
  if Assigned(fs) then
  begin
    V.OpenStream(nil);
    FreeAndNil(fs);
  end;

  fs:= TFileStream.Create(Filename, fmOpenRead or fmShareDenyNone);
  V.OpenStream(fs);
end;

end.

