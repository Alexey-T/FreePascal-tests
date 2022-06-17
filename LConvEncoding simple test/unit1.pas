unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

uses LConvEncoding;

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  sFrom, sTo: string;
begin
  sFrom:= #$F1#$F2;
  sTo:= ConvertEncoding(sFrom, EncodingCPIso10, EncodingUTF8);
  Caption:= sTo;
  if sFrom<>ConvertEncoding(sTo, EncodingUTF8, EncodingCPIso10) then
    Caption:= 'error converting back';
end;

end.

