unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter1: TSplitter;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

uses Unit2;

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  f: TForm;
begin
  F:= TForm2.Create(Self);
  F.Parent:= Panel1;
  F.Align:= alClient;
  F.Show;

  F:= TForm2.Create(Self);
  F.Parent:= Panel2;
  F.Align:= alClient;
  F.Show;
end;

end.

