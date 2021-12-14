unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  with TForm2.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Label1.Caption:= Format('monitors: %d', [Screen.MonitorCount]);
end;

end.

