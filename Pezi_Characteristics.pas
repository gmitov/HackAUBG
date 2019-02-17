unit Pezi_Characteristics;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrame_Characteristics = class(TFrame)
    Edit1: TEdit;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }

    procedure FrameShow;
  end;

var
  Frame_Characteristics : TFrame_Characteristics;

implementation

{$R *.dfm}

procedure TFrame_Characteristics.FrameShow;
begin
  //
end;

end.
