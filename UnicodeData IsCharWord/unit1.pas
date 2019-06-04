unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

uses unicodedata;

{$R *.lfm}

{ TForm1 }

function IsWordChar(C: widechar): Boolean;
begin
  Result := GetProps(Ord(C))^.Category <= UGC_OtherNumber;
end;

procedure TForm1.FormCreate(Sender: TObject);
  procedure t(c: widechar);
  var
    b: boolean;
  const
    s: array[boolean] of string = ('false', 'true');
  begin
    b:= IsWordChar(c);
    memo1.Lines.Add(s[b]);
  end;
begin
  memo1.lines.clear;
  t(#$0301);
  t(#$00B4); //AT
  t(#$02B9); //AT
  t(#$02CA); //AT
  t(#$0384);
end;

end.

