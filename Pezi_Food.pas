unit Pezi_Food;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.ComCtrls,
  Pezi_U_Common,
  DB;

type
  TFrame_Food = class(TFrame)
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
    ListView_Days: TListView;
    Button_DeleteAll: TButton;
    Panel_Bottom: TPanel;
    StringGrid_Food: TStringGrid;
    RadioGroup_Water: TRadioGroup;
    Edit_Water: TEdit;
    Label1: TLabel;
    Label_Water: TLabel;
    procedure ListView_DaysDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ListView_DaysDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure StringGrid_FoodSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid_FoodSetEditText(Sender: TObject; ACol,
      ARow: Integer; const Value: string);
    procedure PageControl_WeekChange(Sender: TObject);
    procedure CheckBox_IsWeeklyClick(Sender: TObject);
    procedure Button_DeleteAllClick(Sender: TObject);
    procedure Button_DeleteCheckedClick(Sender: TObject);
    procedure RadioGroup_WaterClick(Sender: TObject);
    procedure Edit_WaterExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure FrameShow;
    procedure TriggerActivePages(isWeekly : Boolean);
  end;

var
  Frame_Food : TFrame_Food;
  StartDrag : boolean;

implementation

{$R *.dfm}

procedure TFrame_Food.Button_DeleteAllClick(Sender: TObject);
var
  cur_day, buttonResult : Integer;
begin
  buttonResult := messagedlg('Are you sure you want to delete all items?',
                                                  mtConfirmation, mbOKCancel, 0);

  if buttonResult = mrCancel
    then Exit;

  ListView_Days.Clear;

  cur_day := PageControl_Week.ActivePageIndex + 1;
  DB.Settings.Delete2(4, cur_day);

  FoodInd := 0;
  FoodMod := 0;
end;

procedure TFrame_Food.Button_DeleteCheckedClick(Sender: TObject);
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

  DB.Settings.Write2(4, cur_day, tmp_arr[0], length * SizeOf(Integer));

  if FoodInd > JJ
    then FoodInd := 0;

  FoodMod := JJ;
end;

procedure TFrame_Food.CheckBox_IsWeeklyClick(Sender: TObject);
begin
  if CheckBox_IsWeekly.Checked then
    begin
      DB.Settings.WriteInt2(4, 9, 1);
      TriggerActivePages(True);
    end
  else
    begin
      DB.Settings.WriteInt2(4, 9, 0);
      TriggerActivePages(False);
    end;
end;

procedure TFrame_Food.Edit_WaterExit(Sender: TObject);
var
  Water_Message : String;
begin
  DB.Settings.WriteInt2(1, 2, strtoint(self.Edit_Water.Text));
  DB.Settings.WriteInt2(1, 3, strtoint(self.Edit_Water.Text));
//
//  DB.Settings.WriteInt2(1, 2, strtoint(self.Edit_Water.Text));
  Water_Message := 'You should drink ' + IntToStr(Round(3.3 * strtoint(self.Edit_Water.Text))) + 'ml of water.';

  DB.Settings.WriteSstr2(1, 4, Water_Message);
end;

procedure TFrame_Food.FrameShow;
var
  xex : cardinal;
  I: Integer;
  ii, jj, curr_radio_index : Integer;
  CurrDayOfWeek : integer;
  Lv_name : string;
  Lv_item : TListItem;
  tmp_arr : array of integer;
  length : integer;
  SettingsInfo : TSettingsInfo;
begin
  self.Edit_Water.Text := inttostr(DB.Settings.ReadInt2(1,3));

  if DB.Settings.ReadInt2(4, 9) = 0 then
    begin
      CheckBox_IsWeekly.Checked := False;
      TriggerActivePages(False);
    end
   else
    begin
      CheckBox_IsWeekly.Checked := True;
      TriggerActivePages(True);
    end;

  self.StringGrid_Food.Cols[0].Text := 'N';
  self.StringGrid_Food.Cols[1].Text := ' Excercise';
  self.StringGrid_Food.Cols[2].Text := 'Time interval (m)';
  self.StringGrid_Food.Cols[3].Text := 'Add';

  xex := MaxXex;
  xex := DB.Settings.PrevPresent3(4, 1, xex, 3);

  self.StringGrid_Food.RowCount := xex + 2;
//  self.StringGrid_Food.Row := xex +1;

  for I := 1 to xex do
    begin
      self.StringGrid_Food.Cells[0,I] := IntToStr(I);
      self.StringGrid_Food.Cells[1,I] := DB.Settings.ReadSStr3(4, 1, I);
      self.StringGrid_Food.Cells[2,I] := IntToStr(Settings.ReadInt3(4, 2, I));
    end;

  self.StringGrid_Food.Cells[0, xex + 1] := IntToStr(xex + 1);

  length := DB.Settings.Length2(3, 1);
  length := length div SizeOf(Integer);

  SetLength(tmp_arr, length);
  DB.Settings.Read2(4, 1, tmp_arr[0], length * SizeOf(Integer), 0);

  curr_radio_index := DB.Settings.ReadInt2(1, 1);
  self.RadioGroup_Water.ItemIndex := curr_radio_index;


  self.Edit_Water.Text := inttostr(DB.Settings.ReadInt2(1, 3));
end;

procedure TFrame_Food.ListView_DaysDragDrop(Sender, Source: TObject; X,
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
        if (GetItemAt(X,Y)<>nil) then{and not(old_y < Y) then}
          begin
            MyItem := Items.Insert(GetItemAt(X,Y).Index);
            MyItem.Assign(Selected);
            Selected.Delete;

            curr_day := self.PageControl_Week.ActivePageIndex;
            curr_day := curr_day +1;

            length := ListView_Days.Items.Count;
            SetLength(tmp_arr, length);

            for ii := 0 to length - 1 do
              begin
                tmp_int := TSettingsInfo(items[ii].Data).Ind;
                tmp_arr[ii] := tmp_int;
              end;

            DB.Settings.Write2(4, curr_day, tmp_arr[0], length * SizeOf(Integer));
          end;
      end;
end;

procedure TFrame_Food.ListView_DaysDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  If (Source = ListView_Days) OR (Source = StringGrid_Food)
    then begin
      Accept := True;
    end;
end;

procedure TFrame_Food.PageControl_WeekChange(Sender: TObject);
var
  length, ii, cur_day : Integer;
  tmp_arr : Array of Integer;
  Lv_item : TListItem;
  SettingsInfo : TSettingsInfo;
begin
  cur_day := PageControl_Week.ActivePageIndex + 1;

  length := DB.Settings.Length2(4, cur_day);
  length := length div SizeOf(Integer);

  SetLength(tmp_arr, 0);
  SetLength(tmp_arr, length);
  DB.Settings.Read2(4, cur_day, tmp_arr[0], length * SizeOf(Integer), 0);

  ListView_Days.Clear;
  for ii := 0 to length - 1 do
    begin
      SettingsInfo := TSettingsInfo.Create;
      SettingsInfo.Ind := tmp_arr[ii];

      Lv_item := ListView_Days.Items.Add;
      Lv_item.Data := SettingsInfo;

      Lv_item.Caption := Settings.ReadSstr3(4, 1, SettingsInfo.Ind);
      Lv_item.SubItems.Add(IntToStr(Settings.ReadInt3(4, 2, tmp_arr[ii])));
    end;
end;

procedure TFrame_Food.RadioGroup_WaterClick(Sender: TObject);
var
  Curr_item : integer;
  Water_Message : String;
begin
  Curr_item := self.RadioGroup_Water.ItemIndex;

  if curr_item = 4
    then begin
      self.Edit_Water.Visible := true;
      self.Label_Water.Visible := true;
    end
    else begin
      self.Edit_Water.Visible := false;
      self.Label_Water.Visible := false;
    end;

  case curr_item of
    0 : begin
          DB.Settings.WriteInt2(1, 2, 60);
          DB.Settings.WriteSStr2(1, 4, 'You have to drink 200ml of water.');
        end;
    1 : begin
          DB.Settings.WriteInt2(1, 2, 120);
          DB.Settings.WriteSStr2(1, 4, 'You have to drink 400ml of water.');
        end;
    2 : begin
          DB.Settings.WriteInt2(1, 2, 180);
          DB.Settings.WriteSStr2(1, 4, 'You have to drink 600ml of water.');
        end;
    3 : begin
          DB.Settings.WriteInt2(1, 2, 240);
          DB.Settings.WriteSStr2(1, 4, 'You have to drink 800ml of water.');
        end;
    4 : begin
          DB.Settings.WriteInt2(1, 2, strtoint(self.Edit_Water.Text));
          DB.Settings.WriteInt2(1, 3, strtoint(self.Edit_Water.Text));

          Water_Message := 'You should drink ' + IntToStr(Round(3.3 * strtoint(self.Edit_Water.Text))) + 'ml of water.';

          DB.Settings.WriteSstr2(1, 4, Water_Message);
        end;
  end;

  DB.Settings.WriteInt2(1, 1, curr_item);
  WorkInd := curr_item;
end;

procedure TFrame_Food.StringGrid_FoodSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  CurrDayOfWeek : integer;
  Lv_name : string;
  Lv_item : TListItem;
  tmp_arr : array of integer;
  length : integer;
  SettingsInfo : TSettingsInfo;
begin
  if ACol = 3 then
    begin
      CanSelect := false;

      CurrDayOfWeek := self.PageControl_Week.ActivePageIndex + 1;
      SettingsInfo := TSettingsInfo.Create;
      SettingsInfo.Ind := ARow;

      SettingsInfo := TSettingsInfo.Create;
      SettingsInfo.Ind := ARow;

      Lv_item := ListView_Days.Items.Add;
      Lv_item.Data := SettingsInfo;

      Lv_item.Caption := Settings.ReadSstr3(4, 1, ARow);
      Lv_item.SubItems.Add(IntToStr(Settings.ReadInt3(4, 2, ARow)));

      length := DB.Settings.Length2(4, CurrDayOfWeek);
      length := length div SizeOf(Integer);

      SetLength(tmp_arr, length);
      DB.Settings.Read2(4, 8, tmp_arr[0], length * SizeOf(Integer), 0);

      length := length + 1;
      SetLength(tmp_arr, length);
      tmp_arr[length - 1] := ARow;

      DB.Settings.Write2(4, 8, tmp_arr[0], length * SizeOf(Integer));
      FoodMod := length;
    end
end;

procedure TFrame_Food.StringGrid_FoodSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: string);
var
  RowCount : Cardinal;
  CellText : String;
  Minutes : integer;
begin
  CellText := Value;

  if ACol = 2 then
    begin
      Minutes := 0;

      if Integer.TryParse(CellText, Minutes) then
        begin
          if Minutes < 0 then
            begin
              Minutes := 0;
              StringGrid_Food.Cells[ACol, ARow] := '0';
            end;

          DB.Settings.WriteInt3(4, ACol, ARow, Minutes);
        end
      else StringGrid_Food.Cells[ACol, ARow] := '0';
    end
  else DB.Settings.WriteSStr3(4, ACol, ARow, CellText);

  RowCount := StringGrid_Food.RowCount;
  if (CellText <> '') and (ARow = RowCount - 1) then
    begin
      StringGrid_Food.RowCount := RowCount + 1;
      StringGrid_Food.Cells[0, RowCount] := IntToStr(RowCount);
    end;
end;

procedure TFrame_Food.TriggerActivePages(isWeekly : Boolean);
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
