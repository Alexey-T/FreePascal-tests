unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

type

  { TMy }

  TMy = class(TCustomControl)
  private
  public
    constructor Create(AOwner: TComponent); override;
  protected
    procedure Paint; override;
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure Click; override;
  end;

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  Ctl: TMy;
begin
  Ctl:= TMy.Create(Self);
  Ctl.Parent:= Self;
  Ctl.Align:= alClient;
  Ctl.Show;
end;

procedure TForm1.FormShow(Sender: TObject);
begin

end;

{ TMy }

constructor TMy.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  TabStop:= true;
end;

procedure TMy.Paint;
var
  C: TCanvas;
begin
  C:= Canvas;
  C.Brush.Color:= clCream;
  C.FillRect(ClientRect);
  C.Pen.Color:= clGray;
  C.Rectangle(3, 3, ClientWidth-3, ClientHeight-3);
  C.Font.Name:= 'default';
  C.Font.Size:= 20;
  C.Font.Color:= clGreen;
  C.TextOut(10, 10, 'Some Text');
end;

procedure TMy.DoEnter;
begin
  inherited DoEnter;
  Invalidate;
end;

procedure TMy.DoExit;
begin
  inherited DoExit;
  Invalidate;
end;

procedure TMy.Click;
begin
  inherited Click;
end;


end.

