unit Pezi_Info;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.CheckLst, Winapi.ShellApi,
  Vcl.Buttons, Pezi_U_common, DB;

const
  WM_ICONTRAY = WM_USER + 1;

type
  TForm_Info = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Panel2: TPanel;
    CheckListBox1: TCheckListBox;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
      TrayIconData: TNotifyIconData;
  public
    { Public declarations }
  end;

var
  Form_Info: TForm_Info;

implementation

{$R *.dfm}


procedure TForm_Info.FormCreate(Sender: TObject);
begin
//  self.TransparentColor := true;
//  self.TransparentColorValue := self.Color;

  case DB.Settings.ReadInt2(5, 1) of
  0: begin
      Left := Screen.WorkAreaWidth - Width - 40;
      Top := Screen.WorkAreaHeight - Height - 40;

      self.Hide;
      AnimateWindow (self.Handle, 500, AW_HOR_NEGATIVE);
     end;
  1: begin
      Left := 40;
      Top := Screen.WorkAreaHeight - Height - 40;

      self.Hide;
      AnimateWindow (self.Handle, 500, AW_HOR_POSITIVE);
     end;
  2: begin
      Left := 40;
      Top := 40;

      self.Hide;
      AnimateWindow (self.Handle, 500, AW_HOR_POSITIVE);
     end;
  3: begin
      Left := Screen.WorkAreaWidth - Width - 40;
      Top :=  40;

      self.Hide;
      AnimateWindow (self.Handle, 500, AW_HOR_NEGATIVE);
     end;
  end;


  //(AW_HOR_POSITIVE, AW_HOR_NEGATIVE, AW_VER_POSITIVE, or AW_VER_NEGATIVE),
  self.Show;


  with TrayIconData do
  begin
    Wnd := Handle;
    uID := 0;
    uFlags := NIF_MESSAGE + NIF_ICON + NIF_TIP;
    uCallbackMessage := WM_ICONTRAY;
    hIcon := Application.Icon.Handle;
    StrPCopy(szTip, Application.Title);
  end;
  Shell_NotifyIcon(NIM_ADD, @TrayIconData);
end;

procedure TForm_Info.FormShow(Sender: TObject);
var
  ii : integer;
  settingsInfo : TSettingsInfo;
begin
  if text_water <> ''
    then begin
      settingsInfo := TSettingsInfo.Create;
      settingsInfo.Ind := ind_water;

      self.CheckListBox1.AddItem(DB.Settings.ReadSStr2(1, 4), settingsInfo);
    end;

  if text_excercise <> ''
    then begin
      settingsInfo := TSettingsInfo.Create;
      settingsInfo.Ind := ind_excercise;

      self.CheckListBox1.AddItem(text_excercise, settingsInfo);
    end;

  if text_eyes <> ''
    then begin
      settingsInfo := TSettingsInfo.Create;
      settingsInfo.Ind := ind_eyes;

      self.CheckListBox1.AddItem(text_eyes, settingsInfo);
    end;

  if text_food <> ''
    then begin
      settingsInfo := TSettingsInfo.Create;
      settingsInfo.Ind := ind_food;

      self.CheckListBox1.AddItem(text_food, settingsInfo);
    end;
end;

end.
