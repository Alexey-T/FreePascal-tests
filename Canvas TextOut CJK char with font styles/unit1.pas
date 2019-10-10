unit Unit1;

{$Codepage utf8}
{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs;

type

  { TForm1 }

  TForm1 = class(TForm)
    procedure FormPaint(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

const
  c0 = '𠏽𠏽test𠏽𠏽';

{ TForm1 }

procedure TForm1.FormPaint(Sender: TObject);
begin
  canvas.font.size:= 15;

  canvas.font.style:= [];
  canvas.textout(10, 10, c0);

  canvas.font.style:= [fsBold];
  canvas.textout(10, 40, c0);

  canvas.font.style:= [fsItalic];
  canvas.textout(10, 70, c0);

  canvas.font.style:= [fsStrikeOut, fsBold, fsItalic];
  canvas.textout(10, 100, c0);
end;

end.

