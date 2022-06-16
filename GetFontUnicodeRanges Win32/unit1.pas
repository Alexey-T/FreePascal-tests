unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    FontDialog1: TFontDialog;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure Work;

  public

  end;

var
  Form1: TForm1;

implementation

uses Windows;

{$R *.lfm}

{ TForm1 }

type
  PWCRange = ^TWCRange;
  tagWCRANGE = packed record
    wcLow: WCHAR;
    cGlyphs: SHORT;
  end;
  TWCRange = tagWCRANGE;

  PGlyphSet = ^TGlyphSet;
  tagGLYPHSET = packed record
    cbThis: DWORD;
    flAccel: DWORD;
    cGlyphsSupported: DWORD;
    cRanges: DWORD;
    ranges: array[0..0] of TWCRange;
  end;
  TGlyphSet = tagGLYPHSET;

function GetFontUnicodeRanges(h: HDC; gs: PGlyphSet): DWORD; stdcall; external 'gdi32.dll';

procedure TForm1.FormCreate(Sender: TObject);
begin
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if FontDialog1.Execute then
  begin
    Canvas.Font.Assign(FontDialog1.Font);
    Work;
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  //Font.Name:= 'Codename Coder Free 4F';
  Canvas.Font.Name:= 'default';
  Canvas.Font.Size:= 12;
  Work;
end;

procedure TForm1.Work;
var
  GS: PGlyphSet;
  GSSize: LongWord;
  rng: TWCRange;
  i: integer;
begin
  ListBox1.Items.Clear;
  GSSize:= GetFontUnicodeRanges(Canvas.Handle, nil);

  GetMem(Pointer(GS), GSSize);
  FillChar(GS^, GSSize, 0);
  GS^.cbThis:= GSSize;

  if GetFontUnicodeRanges(Canvas.Handle, GS)<>0 then
  begin
    Listbox1.Items.Add('Ranges: '+IntToStr(GS^.cRanges));
    {$PUSH}
    {$R-}
    for i:=0 to GS^.cRanges-1 do
    begin
      rng:= GS^.ranges[i];
      Listbox1.Items.Add(Format('[range %d] from char 0x%s, count %d',
        [i, IntToHex(Ord(rng.wcLow), 4), rng.cGlyphs]
        ));
    end;
    {$POP}
  end;
end;

end.

