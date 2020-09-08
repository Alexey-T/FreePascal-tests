unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ColorBox, Spin;

type

  { TForm1 }

  TForm1 = class(TForm)
    CheckBox1: TCheckBox;
    ColorListBox1: TColorListBox;
    ColorListBox2: TColorListBox;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    SpinBevelWidth: TSpinEdit;
    SpinBorderWidth: TSpinEdit;
    procedure CheckBox1Change(Sender: TObject);
    procedure ColorListBox1Click(Sender: TObject);
    procedure ColorListBox2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure SpinBevelWidthChange(Sender: TObject);
    procedure SpinBorderWidthChange(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.CheckBox1Change(Sender: TObject);
begin
  if CheckBox1.Checked then
    Panel1.BorderStyle:= bsSingle
  else
    Panel1.BorderStyle:= bsNone;
end;

procedure TForm1.ColorListBox1Click(Sender: TObject);
begin
  Panel1.Color:= ColorListBox1.Selected;
end;

procedure TForm1.ColorListBox2Click(Sender: TObject);
begin
  Panel1.Font.Color:= ColorListBox2.Selected;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
  Panel1.BevelInner:= TPanelBevel(RadioGroup1.ItemIndex);
end;

procedure TForm1.RadioGroup2Click(Sender: TObject);
begin
  Panel1.BevelOuter:= TPanelBevel(RadioGroup2.ItemIndex);
end;

procedure TForm1.SpinBevelWidthChange(Sender: TObject);
begin
  Panel1.BevelWidth:= SpinBevelWidth.Value;
end;

procedure TForm1.SpinBorderWidthChange(Sender: TObject);
begin
  Panel1.BorderWidth:= SpinBorderWidth.Value;
end;

end.

