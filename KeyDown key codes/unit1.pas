unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    ListBox1: TListBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private

  public

  end;

var
  Form1: TForm1;

implementation

uses LCLType, LCLProc, Menus;

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  s: string;
begin
  s:= '';
  if ssAlt in shift then s+='alt+';
  if ssShift in shift then s+= 'shift+';
  if ssCtrl in shift then s+= 'ctrl+';
  listbox1.items.add('key: '+ShortCutToText(Key)+', shiftstate: '+s);
  listbox1.ItemIndex:= ListBox1.items.count-1;
  key:= 0;
end;

end.

