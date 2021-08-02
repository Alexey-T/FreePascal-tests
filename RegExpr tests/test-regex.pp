{$mode objfpc}
uses
  Classes, SysUtils, regexpr in './regexpr.pas';

type
  TRegexParts = array[0..8] of
    record
      Pos, Len: integer;
      Str: string;
    end;

function SRegexFindParts(const ARegex, AStr: string; out AParts: TRegexParts): string;
var
  Obj: TRegExpr;
  i: integer;
begin
  Result:= '';
  for i:= Low(AParts) to High(AParts) do
  begin
    AParts[i].Pos:= -1;
    AParts[i].Len:= 0;
    AParts[i].Str:= '';
  end;

  if ARegex='' then exit;
  if AStr='' then exit;

  Obj:= TRegExpr.Create;
  try
    Obj.ModifierS:= false; //don't catch all text by .*
    Obj.ModifierM:= true; //allow to work with ^$
    Obj.ModifierI:= false;

    try
      Obj.Expression:= ARegex;
      Obj.InputString:= AStr;
      //Result:=
      Obj.ExecPos(1);
      if Obj.MatchPos[0]<=0 then
        Result:= 'no match';
    except
      on e: Exception do
        Result:= e.Message;
    end;

    if Result='' then
    begin
      for i:= Low(AParts) to High(AParts) do
      begin
        AParts[i].Pos:= Obj.MatchPos[i];
        AParts[i].Len:= Obj.MatchLen[i];
        AParts[i].Str:= Obj.Match[i];
      end;
    end;
  finally
    FreeAndNil(Obj);
  end;
end;

const
  cRegex_SignFunc = 'module=(.+?);func=(.+?);(info=(.+?);)?$';
var
  Parts: TRegexParts;
  Regex, Res: string;
begin
  Regex:= 'module=ttttttttttt;func=_dlg_dddddddddddddddddddd;info="dddddddddddddddd:<function DlgAgent._ddddddd.<locals>.ddddddddddddd at 0x7ffffffffffffffffff>";';

  Res:= SRegexFindParts(cRegex_SignFunc, Regex, Parts);
  if Res='' then Res:= 'ok match';
  Res:= ': '+Res;
  writeln(Res);

end.
