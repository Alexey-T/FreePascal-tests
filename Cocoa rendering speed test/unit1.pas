unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    LabelSpeed: TLabel;
    PanelCtl: TPanel;
    PanelMain: TPanel;
    procedure PanelMainPaint(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.PanelMainPaint(Sender: TObject);
var
  tick: QWord;
begin
  tick:= GetTickCount64;

  Sleep(10);

  tick:= GetTickCount64-tick;
  LabelSpeed.Caption:= Format('%d ms per paint', [tick]);
end;

end.

