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
    procedure btnGotoClick(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bTextChange(Sender: TObject);
    procedure bBinChange(Sender: TObject);
    procedure bHexChange(Sender: TObject);
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

procedure TfmMain.bTextChange(Sender: TObject);
begin
  V.Mode:= vbmodeText;
end;

procedure TfmMain.bBinChange(Sender: TObject);
begin
  V.Mode:= vbmodeBinary;
end;

procedure TfmMain.bHexChange(Sender: TObject);
begin
  V.Mode:= vbmodeHex;
end;

procedure TfmMain.btnOpenClick(Sender: TObject);
begin
  with OpenDialog1 do
    if Execute then
      OpenFile(Filename);
end;

procedure TfmMain.btnGotoClick(Sender: TObject);
var
  S: string;
  N: Int64;
begin
  S:= InputBox('Go to', 'Hex offset:', '0');
  if S='' then Exit;
  N:= StrToInt64Def('$'+S, -1);
  if N<0 then exit;
  if N>fs.Size-10 then
  begin
    ShowMessage('Too big pos, max is '+IntToStr(fs.Size));
    Exit
  end;
  V.PosAt(N);
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

