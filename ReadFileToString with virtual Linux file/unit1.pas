unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

function ReadFileToString(const Filename: string; MaxLen: integer=100*1024*1024): string;
const
  BufSize = 4096;
var
  Buf: array[0..BufSize-1] of char;
  NSize, NPrevLen: integer;
  fs: TFileStream;
begin
  Result:= '';
  fs:= TFileStream.Create(Filename, fmOpenRead or fmShareDenyNone);
  try
    repeat
      NSize:= fs.Read(Buf, BufSize);
      if NSize>0 then
      begin
        NPrevLen:= Length(Result);
        SetLength(Result, NPrevLen+NSize);
        Move(Buf[0], Result[NPrevLen+1], NSize);
        if Length(Result)>=MaxLen then
          Break;
      end;
    until NSize<BufSize;
  finally
    FreeAndNil(fs);
  end;
end;

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  //Label1.caption:= ReadFileToString('/proc/version');
  Label1.caption:= ReadFileToString('/proc/meminfo');
  //Label1.caption:= ReadFileToString('/home/user/es6.js');
end;

end.

