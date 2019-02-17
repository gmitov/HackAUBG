unit Pezi_Presets;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

type
  TFrame_Presets = class(TFrame)
    Button_Kids: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image1: TImage;
    procedure Button_KidsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure FrameShow;
  end;

var
  Frame_Presets : TFrame_Presets;

implementation

{$R *.dfm}

procedure TFrame_Presets.Button_KidsClick(Sender: TObject);
begin
 //
end;

procedure TFrame_Presets.FrameShow;
begin
  //
end;

end.
