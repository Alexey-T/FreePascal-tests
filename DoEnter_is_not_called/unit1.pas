unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  LCLIntf, LCLType;

type

  { TForm1 }

  TForm1 = class(TForm)
    ListBox1: TListBox;
    procedure FormCreate(Sender: TObject);
  private
    My1, My2: TPanel;
  public
    procedure Log(S: string);

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

type

  { TMy }

  TMy = class(TPanel)
  public
    constructor Create(AOwner: TComponent); override;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure Click; override;
  end;

{ TMy }

constructor TMy.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle:= ControlStyle+[csOpaque, csDoubleClicks, csTripleClicks];
  TabStop:= true;
  BorderSpacing.Around:= 6;
  Color:= clAqua;
end;

procedure TMy.DoEnter;
begin
  inherited DoEnter;
  Form1.Log(Name+': DoEnter');
end;

procedure TMy.DoExit;
begin
  inherited DoExit;
  Form1.Log(Name+': DoExit');
end;

procedure TMy.Click;
begin
  inherited Click;
  LCLIntf.SetFocus(Handle);
end;

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  My1:= TMy.Create(Self);
  My1.Name:= 'My1';
  My1.Parent:= Self;
  My1.Align:= alLeft;
  My1.Width:= Width div 2 - 10;

  My2:= TMy.Create(Self);
  My2.Name:= 'My2';
  My2.Parent:= Self;
  My2.Align:= alClient;
  My2.Color:= clPurple;
end;

procedure TForm1.Log(S: string);
begin
  Listbox1.Items.Add(TimeToStr(Now)+': '+S);
  Listbox1.ItemIndex:= Listbox1.Items.Count-1;
end;

end.

