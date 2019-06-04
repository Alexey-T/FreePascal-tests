unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  TreeFilterEdit, ListFilterEdit, ListViewFilterEdit;

type

  { TForm1 }

  TForm1 = class(TForm)
    ListBox1: TListBox;
    ListFilterEdit1: TListFilterEdit;
    ListView1: TListView;
    ListViewFilterEdit1: TListViewFilterEdit;
    TreeFilterEdit1: TTreeFilterEdit;
    TreeView1: TTreeView;
    procedure ListBox1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.ListBox1Click(Sender: TObject);
begin

end;

end.

