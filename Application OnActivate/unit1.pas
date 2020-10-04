unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    ApplicationProperties1: TApplicationProperties;
    ListBox1: TListBox;
    procedure ApplicationProperties1Activate(Sender: TObject);
    procedure ApplicationProperties1Deactivate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.ApplicationProperties1Activate(Sender: TObject);
var
  s: string;
begin
  s:= 'act '+TimeToStr(Now);
  caption:= s;
  listbox1.items.add(s);
end;

procedure TForm1.ApplicationProperties1Deactivate(Sender: TObject);
var
  s: string;
begin
  s:= 'deact '+TimeToStr(Now);
  caption:= s;
  listbox1.items.add(s);
end;

end.

