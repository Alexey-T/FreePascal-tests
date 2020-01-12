unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ATSynEdit, ATListbox;

type

  { TForm2 }

  TForm2 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public
    EdCount: integer;
    ListCount: integer;
  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.FormCreate(Sender: TObject);
begin

end;

procedure TForm2.FormShow(Sender: TObject);
var
  i: integer;
  ed: TATSynEdit;
  l: TATListbox;
begin
  for i:= 1 to EdCount do
  begin
    ed:= TATSynEdit.Create(Self);
    ed.OptRulerVisible:= false;
    ed.Parent:= Self;
    ed.Align:= alTop;
    ed.Height:= 90;
  end;
  for i:= 1 to ListCount do
  begin
    l:= TATListbox.Create(Self);
    l.Parent:= Self;
    l.Align:= alTop;
    l.Height:= 90;
  end;
end;

end.

