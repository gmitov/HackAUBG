unit Pezi_Water;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Forms, Vcl.Controls, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrame_Water = class(TFrame)
  private
    { Private declarations }

  public
    { Public declarations }
    procedure FrameShow;
  end;

var
  Frame_water : TFrame_Water;

implementation

{$R *.dfm}

procedure TFrame_Water.FrameShow;
begin
  //
end;

end.
