unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Types;

type

  { TForm1 }

  TForm1 = class(TForm)
    ListBox1: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure ListBox1DrawItem(Control: TWinControl; Index: Integer;
      ARect: TRect; State: TOwnerDrawState);
  private
    cnt: integer;

  public

  end;

var
  Form1: TForm1;

implementation

uses lcltype;

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  i:integer;
begin
  for i:= 1 to 50 do
    Listbox1.Items.Add('item'+inttostr(i));
end;

procedure TForm1.ListBox1DrawItem(Control: TWinControl; Index: Integer;
  ARect: TRect; State: TOwnerDrawState);
var
  c: tcanvas;
begin
  c:= listbox1.canvas;
  if odSelected in State then
    c.brush.color:= clyellow
  else
    c.brush.color:= clMoneyGreen;
  c.FillRect(arect);
  c.font.color:= clblack;
  c.textout(arect.left, arect.top, 'item'+inttostr(index));

  inc(cnt);
  caption:= 'repaints: '+inttostr(cnt);
end;

end.

