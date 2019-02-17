unit Pezi_Workout;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.ComCtrls,
  Pezi_U_Common,
  DB;

type
  TFrame_Workout = class(TFrame)
    Panel_Top: TPanel;
    Button_DeleteChecked: TButton;
    PageControl_Week: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    CheckBox_IsWeekly: TCheckBox;
    Panel_Bottom: TPanel;
    StringGrid_Workout: TStringGrid;
    ListView_Days: TListView;
    Button_DeleteAll: TButton;
    procedure ListView_DaysDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListView_DaysDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure StringGrid_WorkoutSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid_WorkoutSetEditText(Sender: TObject; ACol,
      ARow: Integer; const Value: string);
    procedure PageControl_WeekChange(Sender: TObject);
    procedure CheckBox_IsWeeklyClick(Sender: TObject);
    procedure Button_DeleteAllClick(Sender: TObject);
    procedure Button_DeleteCheckedClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    procedure FrameShow;
    procedure TriggerActivePages(isWeekly : Boolean);
  end;

var
  Frame_Workout : TFrame_Workout;
  StartDrag : boolean;

  olx_x, old_y : integer;
implementation

{$R *.dfm}

procedure TFrame_Workout.Button_DeleteAllClick(Sender: TObject);
var
  cur_day, buttonResult : Integer;
begin
  buttonResult := messagedlg('Are you sure you want to delete all items?',
                                                  mtConfirmation, mbOKCancel, 0);

  if buttonResult = mrCancel
    then Exit;

  ListView_Days.Clear;

  cur_day := PageControl_Week.ActivePageIndex + 1;
  DB.Settings.Delete2(2, cur_day);

  WorkMod := 0;
  WorkInd := 0;
end;

procedure TFrame_Workout.Button_DeleteCheckedClick(Sender: TObject);
var
  cur_day, length, ii, jj : Integer;
  tmp_arr : Array of Integer;
begin
  cur_day := PageControl_Week.ActivePageIndex + 1;

  jj := 0;
  length := ListView_Days.Items.Count;
  SetLength(tmp_arr, length);

  for ii := (length - 1) downto 0 do
    if ListView_Days.Items[ii].Checked
        then ListView_Days.Items[ii].Delete
    else
      begin
        tmp_arr[jj] := TSettingsInfo(ListView_Days.Items[ii].Data).Ind;
        Inc(jj);
      end;

  length := jj;
  SetLength(tmp_arr, length);

  DB.Settings.Write2(2, cur_day, tmp_arr[0], length * SizeOf(Integer));

  if WorkInd > JJ
    then WorkInd := 0;

  WorkMod := jj;
end;

procedure TFrame_Workout.CheckBox_IsWeeklyClick(Sender: TObject);
begin
  if CheckBox_IsWeekly.Checked then
    begin
      DB.Settings.WriteInt2(2, 9, 1);
      TriggerActivePages(True);
    end
  else
    begin
      DB.Settings.WriteInt2(2, 9, 0);
      TriggerActivePages(False);
    end;
end;

procedure TFrame_Workout.FrameShow;
var
  xex : cardinal;
  I: Integer;
  ii, jj : Integer;
  CurrDayOfWeek : integer;
  Lv_name : string;
  Lv_item : TListItem;
  tmp_arr : array of integer;
  length : integer;
  SettingsInfo : TSettingsInfo;
begin
  if DB.Settings.ReadInt2(2, 9) = 0 then
    begin
      CheckBox_IsWeekly.Checked := False;
      TriggerActivePages(False);
    end
  else
    begin
      CheckBox_IsWeekly.Checked := True;
      TriggerActivePages(True);
    end;


  self.StringGrid_Workout.Cols[0].Text := 'N';
  self.StringGrid_Workout.Cols[1].Text := ' Muscle group';
  self.StringGrid_Workout.Cols[2].Text := ' Excercise';
  self.StringGrid_Workout.Cols[3].Text := 'Time interval (m)';
  self.StringGrid_Workout.Cols[4].Text := ' Add';

  xex := MaxXex;
  xex := DB.Settings.PrevPresent3(2, 1, xex, 3);

  self.StringGrid_Workout.RowCount := xex + 2;
//  self.StringGrid_Workout.Row := xex +1;

  for I := 1 to xex do
    begin
      self.StringGrid_Workout.Cells[0,I] := IntToStr(I);
      self.StringGrid_Workout.Cells[1,I] := DB.Settings.ReadSStr3(2, 3, I);
      self.StringGrid_Workout.Cells[2,I] := DB.Settings.ReadSStr3(2, 1, I);
      self.StringGrid_Workout.Cells[3,I] := IntToStr(Settings.ReadInt3(2, 2, I));
    end;

  self.StringGrid_Workout.Cells[0, xex + 1] := IntToStr(xex + 1);

  length := DB.Settings.Length2(2, 1);
  length := length div SizeOf(Integer);

  SetLength(tmp_arr, length);
  DB.Settings.Read2(2, 1, tmp_arr[0], length * SizeOf(Integer), 0);
end;



procedure TFrame_Workout.ListView_DaysDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  MyItem : TListItem;
  ii, length, curr_day, tmp_int : integer;
  ss : string;
  tmp_arr : array of integer;


begin
  if Source = ListView_Days then
    with Source as TListView do
      begin
        if (GetItemAt(X,Y)<>nil) and not(old_y < Y) then
          begin
            MyItem := Items.Insert(GetItemAt(X,Y).Index);
            MyItem.Assign(Selected);
            Selected.Delete;

            curr_day := self.PageControl_Week.ActivePageIndex;
            curr_day := curr_day +1;

//            length := DB.Settings.Length2(2, curr_day);
//            length := length div SizeOf(Integer);

            length := ListView_Days.Items.Count;
            SetLength(tmp_arr, length);

//            DB.Settings.Read2(2, curr_day, tmp_arr[0], length * SizeOf(Integer), 0);

            for ii := 0 to length - 1 do
              begin
                tmp_int := TSettingsInfo(items[ii].Data).Ind;
                tmp_arr[ii] := tmp_int;
              end;

            DB.Settings.Write2(2, curr_day, tmp_arr[0], length * SizeOf(Integer));
          end;
      end;
end;

procedure TFrame_Workout.ListView_DaysDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  If (Source = ListView_Days) OR (Source = StringGrid_Workout)
    then begin
      olx_x := X;
      old_y := Y;

      Accept := True;

    end;
  end;

procedure TFrame_Workout.PageControl_WeekChange(Sender: TObject);
var
  length, ii, cur_day : Integer;
  tmp_arr : Array of Integer;
  Lv_item : TListItem;
  SettingsInfo : TSettingsInfo;
begin
  cur_day := PageControl_Week.ActivePageIndex + 1;

  length := DB.Settings.Length2(2, cur_day);
  length := length div SizeOf(Integer);

  SetLength(tmp_arr, 0);
  SetLength(tmp_arr, length);
  DB.Settings.Read2(2, cur_day, tmp_arr[0], length * SizeOf(Integer), 0);

  ListView_Days.Clear;
  for ii := 0 to length - 1 do
    begin
      SettingsInfo := TSettingsInfo.Create;
      SettingsInfo.Ind := tmp_arr[ii];

      Lv_item := ListView_Days.Items.Add;
      Lv_item.Data := SettingsInfo;
      Lv_item.Caption := Settings.ReadSstr3(2, 3, SettingsInfo.Ind);
      Lv_item.SubItems.Add(Settings.ReadSstr3(2, 1, SettingsInfo.Ind));
      Lv_item.SubItems.Add(IntToStr(Settings.ReadInt3(2, 2, tmp_arr[ii])));
    end;
end;

procedure TFrame_Workout.StringGrid_WorkoutSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  CurrDayOfWeek : integer;
  Lv_name : string;
  Lv_item : TListItem;
  tmp_arr : array of integer;
  length : integer;
  SettingsInfo : TSettingsInfo;
begin
  if ACol = 4 then
    begin
      CanSelect := false;

      CurrDayOfWeek := self.PageControl_Week.ActivePageIndex + 1;
      SettingsInfo := TSettingsInfo.Create;
      SettingsInfo.Ind := ARow;

      SettingsInfo := TSettingsInfo.Create;
      SettingsInfo.Ind := ARow;

      Lv_item := ListView_Days.Items.Add;
      Lv_item.Data := SettingsInfo;
      Lv_item.Caption := Settings.ReadSstr3(2, 3, ARow);
      Lv_item.SubItems.Add(Settings.ReadSstr3(2, 1, ARow));
      Lv_item.SubItems.Add(IntToStr(Settings.ReadInt3(2, 2, ARow)));

      length := DB.Settings.Length2(2, CurrDayOfWeek);
      length := length div SizeOf(Integer);

      SetLength(tmp_arr, length);
      DB.Settings.Read2(2, CurrDayOfWeek, tmp_arr[0], length * SizeOf(Integer), 0);

      length := length + 1;
      SetLength(tmp_arr, length);
      tmp_arr[length - 1] := ARow;

      DB.Settings.Write2(2, CurrDayOfWeek, tmp_arr[0], length * SizeOf(Integer));
      WorkMod := length;
    end
end;

procedure TFrame_Workout.StringGrid_WorkoutSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: string);
var
  RowCount : Cardinal;
  CellText : String;
  Charact, Minutes : integer;
begin
  CellText := Value;

  case ACol of
    1: Charact := 3;
    2: Charact := 1;
    3: Charact := 2;
  end;

  if Charact =  2 then
    begin
      Minutes := 0;

      if Integer.TryParse(CellText, Minutes) then
        begin
          if Minutes < 0 then
            begin
              Minutes := 0;
              StringGrid_Workout.Cells[ACol, ARow] := '0';
            end;

          DB.Settings.WriteInt3(2, Charact, ARow, Minutes);
        end
      else StringGrid_Workout.Cells[ACol, ARow] := '0';
    end
  else DB.Settings.WriteSStr3(2, Charact, ARow, CellText);


  RowCount := StringGrid_Workout.RowCount;
  if (CellText <> '') and (ARow = RowCount - 1) then
    begin
      StringGrid_Workout.RowCount := RowCount + 1;
      StringGrid_Workout.Cells[0, RowCount] := IntToStr(RowCount);
    end;
end;

procedure TFrame_Workout.TriggerActivePages(isWeekly : Boolean);
var
  I : Integer;
begin
  if isWeekly then
    begin
      for I := 0 to 6
        do PageControl_Week.Pages[I].TabVisible := False;

      PageControl_Week.Pages[7].TabVisible := True;

      PageControl_Week.ActivePageIndex := 7;
      PageControl_WeekChange(Self);
    end
  else
    begin
      for I := 0 to 6
        do PageControl_Week.Pages[I].TabVisible := True;

      PageControl_Week.Pages[7].TabVisible := False;

      PageControl_Week.ActivePageIndex := 0;
      PageControl_WeekChange(Self);
    end;

end;

end.
