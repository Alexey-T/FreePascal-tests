unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button3Click(Sender: TObject);
begin
  ShowMessage('dot press');
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  ShowMessage('semi press');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ShowMessage('a press');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ShowMessage('comma press');
end;

end.

