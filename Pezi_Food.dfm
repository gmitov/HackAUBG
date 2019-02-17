object Frame_Food: TFrame_Food
  Left = 0
  Top = 0
  Width = 870
  Height = 636
  TabOrder = 0
  object Label1: TLabel
    Left = 391
    Top = 509
    Width = 30
    Height = 13
    Caption = 'Water'
  end
  object Label_Water: TLabel
    Left = 624
    Top = 594
    Width = 54
    Height = 13
    Caption = 'In minutes:'
  end
  object Panel_Top: TPanel
    Left = 28
    Top = 19
    Width = 809
    Height = 302
    TabOrder = 0
    object Button_DeleteChecked: TButton
      Left = 664
      Top = 249
      Width = 140
      Height = 41
      Caption = 'Delete Selected'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button_DeleteCheckedClick
    end
    object PageControl_Week: TPageControl
      Left = 1
      Top = 7
      Width = 809
      Height = 30
      ActivePage = TabSheet1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnChange = PageControl_WeekChange
      object TabSheet1: TTabSheet
        Caption = 'Monday'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object TabSheet2: TTabSheet
        Caption = 'Tuesday'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 1
        ParentFont = False
      end
      object TabSheet3: TTabSheet
        Caption = 'Wednesday'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 2
        ParentFont = False
      end
      object TabSheet4: TTabSheet
        Caption = 'Thursday'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 3
        ParentFont = False
      end
      object TabSheet5: TTabSheet
        Caption = 'Friday'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 4
        ParentFont = False
      end
      object TabSheet6: TTabSheet
        Caption = 'Saturday'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 5
        ParentFont = False
      end
      object TabSheet7: TTabSheet
        Caption = 'Sunday'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 6
        ParentFont = False
      end
      object TabSheet8: TTabSheet
        Caption = 'Weekly'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ImageIndex = 7
        ParentFont = False
      end
    end
    object CheckBox_IsWeekly: TCheckBox
      Left = 656
      Top = 7
      Width = 148
      Height = 24
      Caption = 'Single day program'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = CheckBox_IsWeeklyClick
    end
    object ListView_Days: TListView
      Left = 1
      Top = 37
      Width = 807
      Height = 206
      Checkboxes = True
      Columns = <
        item
          Caption = 'Exercise'
          Width = 640
        end
        item
          Caption = 'Time interval (min)'
          Width = 140
        end>
      DragMode = dmAutomatic
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      GridLines = True
      RowSelect = True
      ParentFont = False
      TabOrder = 3
      ViewStyle = vsReport
      OnDragDrop = ListView_DaysDragDrop
      OnDragOver = ListView_DaysDragOver
    end
    object Button_DeleteAll: TButton
      Left = 509
      Top = 249
      Width = 140
      Height = 41
      Caption = 'Delete All'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = Button_DeleteAllClick
    end
  end
  object Panel_Bottom: TPanel
    Left = 28
    Top = 338
    Width = 809
    Height = 155
    TabOrder = 1
    object StringGrid_Food: TStringGrid
      Left = 1
      Top = 1
      Width = 807
      Height = 153
      Align = alClient
      ColCount = 4
      DefaultColWidth = 26
      RowCount = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      ParentFont = False
      TabOrder = 0
      OnSelectCell = StringGrid_FoodSelectCell
      OnSetEditText = StringGrid_FoodSetEditText
      ColWidths = (
        26
        532
        139
        73)
    end
  end
  object RadioGroup_Water: TRadioGroup
    Left = 33
    Top = 528
    Width = 804
    Height = 52
    Columns = 5
    Items.Strings = (
      '1 h'
      '2 h'
      '3 h'
      '4 h'
      'Custom')
    TabOrder = 2
    OnClick = RadioGroup_WaterClick
  end
  object Edit_Water: TEdit
    Left = 684
    Top = 586
    Width = 65
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 3
    Visible = False
    OnExit = Edit_WaterExit
  end
end
