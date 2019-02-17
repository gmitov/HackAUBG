object Form_Main: TForm_Main
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pezi'
  ClientHeight = 636
  ClientWidth = 1095
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel_Main: TPanel
    Left = 225
    Top = 0
    Width = 870
    Height = 636
    Align = alClient
    BevelKind = bkSoft
    TabOrder = 0
  end
  object Panel_Category: TPanel
    Left = 0
    Top = 0
    Width = 225
    Height = 636
    Align = alLeft
    Caption = 'Panel_Category'
    TabOrder = 1
    object CategoryPanelGroupMain: TCategoryPanelGroup
      Left = 1
      Top = 1
      Width = 224
      Height = 634
      VertScrollBar.Tracking = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -19
      HeaderFont.Name = 'Tahoma'
      HeaderFont.Style = []
      HeaderImage.Data = {
        055449636F6E0000010001001010000001002000280400001600000028000000
        1000000020000000010020000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000000D057004C
        D2580071D45800C2D45900BED256004A00000000000000000000000000000000
        000000000000000000000000000000000000000080000002D1580080D45900E7
        D25900EAD45900E7D45900D0D35800D6D259007E000000020000000000000000
        0000000000000000000000000000000000000000D35800C6D35900CBD45900E7
        D35900CBD35900CBD35900CBD45900E7D4580099D257007E0000000000000000
        00000000000000000000000000000000D357004CD35900CBD359008CD35900CB
        D35900CBD45900E7D35900CBD45900E7D35900CBD35900A4D25A004A00000000
        00000000000000000000000000000000D4580071D35900CBD359008CD35900CB
        D35900CBD35900CBD45900F4D359008CD359008CD3590098D459007000000000
        00000000000000000000000000000000D4570078D359008CD35900CBD359008C
        D35900CBD35900CBD45900E7D359008CD359008CD35900CBD457007800000000
        00000000000000000000000000000000D2590072D359008CD35900CBD35900CB
        D35900CBD45900E7D359008CD45900E7D359008CD2590098D258007100000000
        00000000000000000000000000000000D159004DD359008CD359008CD359008C
        D359008CD35900CBD45900E7D45900E7D35900CBD35900A4D358004B00000000
        0000000000000000000000000000000000000000D4580082D3580096D35900CB
        D35900CBD35900CBD45900E7D45900E7D3580097D558007F0000000000000000
        0000000000000000000000000000000000000000FF000002D4580082D35800A3
        D35A0097D359008CD35A0097D25900A4D4590081800000020000000000000000
        00000000000000000000000000000000000000000000000000000000D456004D
        D2590072D4570078D4580071D357004C00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000}
      HeaderStyle = hsImage
      ParentFont = False
      TabOrder = 0
      object CategoryPanel_Main: TCategoryPanel
        Top = 452
        Height = 171
        Caption = 'Settings'
        TabOrder = 0
        ExplicitTop = 458
        object RadioGroup1: TRadioGroup
          Left = 0
          Top = 0
          Width = 220
          Height = 145
          Align = alClient
          Caption = 'Notification position'
          Columns = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Items.Strings = (
            'Left Top '
            'Right Top'
            'Left Bottom'
            'Right Bottom')
          ParentFont = False
          TabOrder = 0
          OnClick = RadioGroup1Click
          ExplicitLeft = -4
        end
      end
      object CategoryPanel_data: TCategoryPanel
        Top = 121
        Height = 331
        Caption = 'Personal schedules'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Button_Workout: TButton
          Left = -1
          Top = 10
          Width = 222
          Height = 80
          Caption = 'Workout'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = Button_WorkoutClick
        end
        object Button_Eyes: TButton
          Left = -3
          Top = 108
          Width = 229
          Height = 80
          Caption = 'Eyes'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = Button_EyesClick
        end
        object Button_Food: TButton
          Left = -2
          Top = 210
          Width = 227
          Height = 80
          Caption = 'Food and Water'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = Button_FoodClick
        end
      end
      object CategoryPanel1: TCategoryPanel
        Top = 0
        Height = 121
        Caption = 'Templates'
        TabOrder = 2
        object Button1: TButton
          Left = -1
          Top = 7
          Width = 222
          Height = 80
          Caption = 'Presets'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Trebuchet MS'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = Button1Click
        end
      end
    end
  end
  object Timer_KeyPress: TTimer
    Interval = 100
    OnTimer = Timer_KeyPressTimer
    Left = 257
    Top = 16
  end
  object Timer_IsActive: TTimer
    Interval = 300000
    OnTimer = Timer_IsActiveTimer
    Left = 257
    Top = 72
  end
  object Timer_Notification: TTimer
    Interval = 1300
    OnTimer = Timer_NotificationTimer
    Left = 257
    Top = 128
  end
end
