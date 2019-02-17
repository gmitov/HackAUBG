unit Pezi_Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus, DateUtils,
  Pezi_Workout, Pezi_Eyes, Pezi_Food, Pezi_Characteristics, Pezi_Presets, Pezi_Info,
  Arm32,
  Pezi_U_Common, DB, Vcl.Imaging.jpeg, Vcl.Imaging.pngimage;

type
  TForm_Main = class(TForm)
    Panel_Main: TPanel;
    Panel_Category: TPanel;
    CategoryPanelGroupMain: TCategoryPanelGroup;
    CategoryPanel_Main: TCategoryPanel;
    CategoryPanel_data: TCategoryPanel;
    Button_Workout: TButton;
    Button_Eyes: TButton;
    Button_Food: TButton;
    CategoryPanel1: TCategoryPanel;
    Button1: TButton;
    Timer_KeyPress: TTimer;
    Timer_IsActive: TTimer;
    Timer_Notification: TTimer;
    RadioGroup1: TRadioGroup;
    procedure Button_WorkoutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button_EyesClick(Sender: TObject);
    procedure Button_FoodClick(Sender: TObject);
    procedure Timer_KeyPressTimer(Sender: TObject);
    procedure Timer_IsActiveTimer(Sender: TObject);
    procedure Timer_NotificationTimer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure Close_Frame;

var
  Form_Main: TForm_Main;
  fl_exec : boolean;

implementation

{$R *.dfm}

procedure TForm_Main.Button_WorkoutClick(Sender: TObject);
begin
  if MenuItemIndex <> 2
    then begin
      Close_Frame;

      MenuItemIndex := 2;

      Frame_Workout := TFrame_Workout.Create(self);
      Frame_Workout.Parent := self.Panel_Main;
      Frame_Workout.FrameShow;
    end;
end;

procedure TForm_Main.Button1Click(Sender: TObject);
begin
  if MenuItemIndex <> 1
    then begin
      Close_Frame;

      MenuItemIndex := 1;

      Frame_Presets := TFrame_Presets.Create(self);
      Frame_Presets.Parent := self.Panel_Main;

      Frame_Presets.FrameShow;
    end;

end;

procedure TForm_Main.Button_EyesClick(Sender: TObject);
begin
  if MenuItemIndex <> 3
    then begin
      Close_Frame;

      MenuItemIndex := 3;

      Frame_Eyes := TFrame_Eyes.Create(self);
      Frame_Eyes.Parent := self.Panel_Main;

      Frame_Eyes.FrameShow;
    end;
end;

procedure TForm_Main.Button_FoodClick(Sender: TObject);
begin
  if MenuItemIndex <> 4
    then begin
      Close_Frame;

      MenuItemIndex := 4;

      Frame_Food := TFrame_Food.Create(self);
      Frame_Food.Parent := self.Panel_Main;

      Frame_Food.FrameShow;
    end;
end;

procedure Close_Frame;
begin
  case MenuItemIndex of
    1 : Frame_Presets.Free;
    2 : Frame_Workout.Free;
    3 : Frame_Eyes.Free;
    4 : Frame_Food.Free;
  end;
end;

procedure TForm_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DB.CloseAll;
end;

procedure TForm_Main.FormCreate(Sender: TObject);
var
  tmp_arr : array of integer;
  length : integer;
begin
  DB.OpenAll;

  fl_exec := false;

  RadioGroup1.ItemIndex := DB.Settings.ReadInt2(5, 1);

//--------------------------

  length := DB.Settings.Length2(4, 8);
  length := length div SizeOf(Integer);

  SetLength(tmp_arr, 0);
  SetLength(tmp_arr, length);

  DB.Settings.Read2(4, 8, tmp_arr[0], length * SizeOf(Integer), 0);

  if length <> 0
    then begin


      FoodInd := tmp_arr[0];
      FoodMod := length;

      FoodTime := DB.Settings.ReadInt3(4, tmp_arr[0], 2);
    end;

//--------------------------

  length := DB.Settings.Length2(3, 8);
  length := length div SizeOf(Integer);

  SetLength(tmp_arr, 0);
  SetLength(tmp_arr, length);

  DB.Settings.Read2(3, 8, tmp_arr[0], length * SizeOf(Integer), 0);

  if length <> 0
    then begin

      EyesInd := tmp_arr[0];
      EyesMod := length;

      EyesTime := DB.Settings.ReadInt3(3, tmp_arr[0], 2);

    end;
//--------------------------

  length := DB.Settings.Length2(2, 8);
  length := length div SizeOf(Integer);

  SetLength(tmp_arr, 0);
  SetLength(tmp_arr, length);

  DB.Settings.Read2(2, 8, tmp_arr[0], length * SizeOf(Integer), 0);

  if length <> 0
    then begin
      WorkInd := tmp_arr[0];
      WorkMod := length;

      WorkoutTime := DB.Settings.ReadInt3(2, 2, tmp_arr[0]);

    end;
//--------------------------

  WaterInd := DB.Settings.ReadInt2(1, 1);
  WaterTime := DB.Settings.ReadInt2(1, 2);

//--------------------------

  Timer_IsActive.Interval := IsActiveCountDown;
  CurrentDay := DayOfTheMonth(Now);

end;

procedure TForm_Main.RadioGroup1Click(Sender: TObject);
begin
  DB.Settings.WriteInt2(5, 1, RadioGroup1.ItemIndex);
end;

procedure TForm_Main.Timer_IsActiveTimer(Sender: TObject);
begin
  IsUserActive := False;
end;

procedure TForm_Main.Timer_KeyPressTimer(Sender: TObject);
begin
  if IsKeyPressed then
    begin
      IsUserActive := true;
      Timer_IsActive.Enabled := False;
      Timer_IsActive.Enabled := True;
    end;
end;

procedure TForm_Main.Timer_NotificationTimer(Sender: TObject);
var
  DaySwitched : boolean;
  TempArray : Array of Integer;
  Msg : String;
  hasNotifications : boolean;
begin
  hasNotifications := false;

  if true{IsUserActive} then
    begin
      WorkoutTime := WorkoutTime - 1;
      EyesTime := EyesTime - 1;
      FoodTime := FoodTime - 1;
      WaterTime := WaterTime - 1;

      if WorkoutTime < 0 then
        begin
          if WorkMod > 0
            then begin
              SetLength(TempArray, WorkMod);
              DB.Settings.Read2(2, 8, TempArray[0], WorkMod * SizeOf(Integer), 0);

              WorkoutTime := DB.Settings.ReadInt3(2, 2, TempArray[WorkInd - 1]);

              text_excercise := DB.Settings.ReadSstr3(2, 1, TempArray[WorkInd - 1]);
              ind_excercise := WorkInd;

              hasNotifications := true;

              WorkInd := (WorkInd mod WorkMod) + 1;
            end;
        end;

      if FoodTime < 0 then
        begin
          if FoodMod > 0
            then begin
              SetLength(TempArray, FoodMod);
              DB.Settings.Read2(4, 8, TempArray[0], FoodMod * SizeOf(Integer), 0);

              FoodTime := DB.Settings.ReadInt3(4, 2, TempArray[FoodInd - 1]);
              text_food := DB.Settings.ReadSstr3(4, 1, TempArray[FoodInd - 1]);

              ind_food := FoodInd;
              hasNotifications := true;

              FoodInd := (FoodInd mod FoodMod) + 1;
            end;
        end;


      if EyesTime < 0 then
        begin
          if EyesMod > 0
            then begin
              SetLength(TempArray, EyesMod);
              DB.Settings.Read2(3, 8, TempArray[0], EyesMod * SizeOf(Integer), 0);

              EyesTime := DB.Settings.ReadInt3(3, 2, TempArray[WorkInd - 1]);
              text_eyes := DB.Settings.ReadSstr3(3, 1, TempArray[WorkInd - 1]);
              ind_eyes := EyesInd;
              hasNotifications := true;

              EyesInd := (EyesInd mod EyesMod) + 1;
            end;
        end;

      if WaterTime < 0 then
        begin
          WaterTime := DB.Settings.ReadInt2(1, 2);
          text_water := DB.Settings.ReadSstr2(1, 4);

          if WaterTime > 0 then hasNotifications := true;


          //Form_info.ind_water := WaterInd;

        end;

      if hasNotifications then
        begin
          Form_Info := TForm_Info.Create(Self);
          //Form_Info.FormShow();
        end;


    end;
end;

end.
