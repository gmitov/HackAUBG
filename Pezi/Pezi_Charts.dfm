object Frame1: TFrame1
  Left = 0
  Top = 0
  Width = 870
  Height = 636
  TabOrder = 0
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 95
    Height = 13
    Caption = 'Most done activities'
  end
  object Label2: TLabel
    Left = 457
    Top = 24
    Width = 98
    Height = 13
    Caption = 'Least done activities'
  end
  object Chart1: TChart
    Left = 16
    Top = 72
    Width = 400
    Height = 250
    Title.Text.Strings = (
      'TChart')
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    TabOrder = 0
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series1: TPieSeries
      XValues.Order = loAscending
      YValues.Name = 'Pie'
      YValues.Order = loNone
      Frame.InnerBrush.BackColor = clRed
      Frame.InnerBrush.Gradient.EndColor = clGray
      Frame.InnerBrush.Gradient.MidColor = clWhite
      Frame.InnerBrush.Gradient.StartColor = 4210752
      Frame.InnerBrush.Gradient.Visible = True
      Frame.MiddleBrush.BackColor = clYellow
      Frame.MiddleBrush.Gradient.EndColor = 8553090
      Frame.MiddleBrush.Gradient.MidColor = clWhite
      Frame.MiddleBrush.Gradient.StartColor = clGray
      Frame.MiddleBrush.Gradient.Visible = True
      Frame.OuterBrush.BackColor = clGreen
      Frame.OuterBrush.Gradient.EndColor = 4210752
      Frame.OuterBrush.Gradient.MidColor = clWhite
      Frame.OuterBrush.Gradient.StartColor = clSilver
      Frame.OuterBrush.Gradient.Visible = True
      Frame.Width = 4
      OtherSlice.Legend.Visible = False
    end
  end
  object Chart2: TChart
    Left = 457
    Top = 72
    Width = 400
    Height = 250
    Title.Text.Strings = (
      'TChart')
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    TabOrder = 1
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series2: TPieSeries
      XValues.Order = loAscending
      YValues.Name = 'Pie'
      YValues.Order = loNone
      Frame.InnerBrush.BackColor = clRed
      Frame.InnerBrush.Gradient.EndColor = clGray
      Frame.InnerBrush.Gradient.MidColor = clWhite
      Frame.InnerBrush.Gradient.StartColor = 4210752
      Frame.InnerBrush.Gradient.Visible = True
      Frame.MiddleBrush.BackColor = clYellow
      Frame.MiddleBrush.Gradient.EndColor = 8553090
      Frame.MiddleBrush.Gradient.MidColor = clWhite
      Frame.MiddleBrush.Gradient.StartColor = clGray
      Frame.MiddleBrush.Gradient.Visible = True
      Frame.OuterBrush.BackColor = clGreen
      Frame.OuterBrush.Gradient.EndColor = 4210752
      Frame.OuterBrush.Gradient.MidColor = clWhite
      Frame.OuterBrush.Gradient.StartColor = clSilver
      Frame.OuterBrush.Gradient.Visible = True
      Frame.Width = 4
      OtherSlice.Legend.Visible = False
    end
  end
  object Chart3: TChart
    Left = 16
    Top = 360
    Width = 400
    Height = 250
    Title.Text.Strings = (
      'TChart')
    TabOrder = 2
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series3: TBarSeries
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
    end
  end
  object Chart4: TChart
    Left = 457
    Top = 360
    Width = 400
    Height = 250
    Title.Text.Strings = (
      'TChart')
    TabOrder = 3
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series4: TBarSeries
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
    end
  end
end
