unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Spin,
  ComCtrls, Types;

type

  { TForm1 }

  TForm1 = class(TForm)
    Label1: TLabel;
    ListBox1: TListBox;
    procedure ListBox1DrawItem(Control: TWinControl; Index: Integer;
      ARect: TRect; State: TOwnerDrawState);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.ListBox1DrawItem(Control: TWinControl; Index: Integer;
  ARect: TRect; State: TOwnerDrawState);
var
  c: tcanvas;
begin
  c:= Listbox1.Canvas;
  c.Font.Color:= clGreen;
  {
  bbb
  iii
  bbbiii
  uuu
  sss
  uuusss
  bbbiiiuuusss
  }
  case Index of
    0: c.Font.Style:= [fsBold];
    1: c.Font.Style:= [fsItalic];
    2: c.Font.Style:= [fsBold, fsItalic];
    3: c.Font.Style:= [fsUnderline];
    4: c.Font.Style:= [fsStrikeOut];
    5: c.Font.Style:= [fsUnderline, fsStrikeOut];
    6: c.Font.Style:= [fsBold, fsItalic, fsUnderline, fsStrikeOut];
  end;
  c.TextOut(ARect.left, ARect.top, '>> '+Listbox1.Items[Index]);
end;

end.

