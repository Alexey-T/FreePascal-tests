program project1;

{$mode objfpc}{$H+}

uses
  SysUtils, UnicodeData;

function IsCharLetter(ch: widechar): boolean;
begin
  Result:=
    (Ord(ch) < LOW_SURROGATE_BEGIN) and
    (GetProps(word(ch))^.Category <= UGC_OtherLetter);
end;


procedure t(ch: widechar);
const
  bb: array[boolean] of string=('false', 'true');
begin
  writeln('IsCharLetter(0x', IntToHex(Ord(ch), 4), '): ', bb[IsCharLetter(ch)]);
end;

begin
  t(#$17e5); //wrong- khmer letter
  t(#$1784); //ok- khmer
  t(#$3377); //wrong- CJK
  t(#$06F7); //wrong- arabic letter

end.

