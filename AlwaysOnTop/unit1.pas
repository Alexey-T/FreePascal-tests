unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Unit2, Unit3,
  Unit4;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
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
  with Form2 do Visible:= not Visible;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  with Form3 do Visible:= not Visible;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  with Form4 do Visible:= not Visible;
end;

end.

