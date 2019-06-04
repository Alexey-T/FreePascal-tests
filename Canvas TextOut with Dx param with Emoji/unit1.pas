unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Panel1: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    procedure DoOut(c: TCanvas; const s: string; x, y: integer);
  public

  end;

var
  Form1: TForm1;

implementation

uses LCLIntf, LCLProc, LCLType;

{$R *.lfm}

var
  Emoji: string = 'emoji<😀😃+😄😁>end';

{ TForm1 }

function IsCharSurrogate(ch: widechar): boolean;
begin
  Result:= (ch>=#$D800) and (ch<=#$DFFF);
end;

type
  TATIntArray = array of integer;

procedure _CalcCharSizesUtf8FromWidestring(const S: UnicodeString;
  const DxIn: TATIntArray;
  var DxOut: TATIntArray);
var
  NSize, i: integer;
begin
  SetLength(DxOut, 0);

  i:= 0;
  repeat
    Inc(i);
    if i>Length(S) then Break;
    if i>=Length(DxIn) then Break;

    if IsCharSurrogate(S[i]) then
    begin
      NSize:= DxIn[i-1]+DxIn[i];
      Inc(i);
    end
    else
      NSize:= DxIn[i-1];

    SetLength(DxOut, Length(DxOut)+1);
    DxOut[Length(DxOut)-1]:= NSize;
  until false;
end;


procedure TForm1.DoOut(c: TCanvas; const s: string; x,y: integer);
var
  sw: UnicodeString;
  dx, dx2: TATIntArray;
  i, NSize: integer;
  r: TRect;
  cell: integer;
begin
  c.Brush.Color:= clMoneyGreen;

  sw:= UTF8Decode(s);
  cell:= c.TextWidth('2');

  setlength(dx, 0);
  for i:= 1 to length(sw) do
  begin
    setlength(dx, length(dx)+1);
    if IsCharSurrogate(sw[i]) then
      dx[length(dx)-1]:= cell*3 div 2
    else
      dx[length(dx)-1]:= cell;
  end;

  _CalcCharSizesUtf8FromWidestring(sw, dx, dx2);

  r:= rect(0, 0, 500, 60);
  ExtTextOut(c.Handle, x, y, ETO_OPAQUE,
    nil,
    PChar(s),
    Length(s),
    @dx2[0]
    );
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  caption:= Emoji;
  panel1.caption:= 'caption: '+Emoji;
  font.name:= 'Courier New';
  panel1.font.name:= 'Courier New';
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
  DoOut(Canvas, 'norm', 10, 10);
  DoOut(Canvas, Emoji, 70, 10);
end;

end.

