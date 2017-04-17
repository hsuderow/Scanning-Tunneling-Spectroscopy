object Graphcs: TGraphcs
  Left = 316
  Top = 217
  Width = 667
  Height = 500
  Caption = 'Graphcs'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox1: TPaintBox
    Left = 16
    Top = 184
    Width = 273
    Height = 265
  end
  object PaintBox2: TPaintBox
    Left = 320
    Top = 184
    Width = 273
    Height = 265
  end
  object Label1: TLabel
    Left = 24
    Top = 88
    Width = 32
    Height = 13
    Caption = 'Range'
  end
  object Label2: TLabel
    Left = 24
    Top = 48
    Width = 31
    Height = 13
    Caption = 'Center'
  end
  object Label3: TLabel
    Left = 456
    Top = 96
    Width = 57
    Height = 17
    Caption = 'Label3'
  end
  object DrawLine: TButton
    Left = 264
    Top = 56
    Width = 73
    Height = 25
    Caption = 'Draw Line'
    TabOrder = 0
    OnClick = DrawLineClick
  end
  object TrackBar1: TTrackBar
    Left = 64
    Top = 16
    Width = 161
    Height = 17
    Max = 255
    Orientation = trHorizontal
    Frequency = 1
    Position = 255
    SelEnd = 0
    SelStart = 0
    TabOrder = 2
    TickMarks = tmBottomRight
    TickStyle = tsAuto
    OnChange = TrackBar1Change
  end
  object BaseColor: TSpinEdit
    Left = 280
    Top = 16
    Width = 41
    Height = 22
    MaxValue = 256
    MinValue = 0
    TabOrder = 1
    Value = 0
  end
  object Trackcenter: TTrackBar
    Left = 64
    Top = 48
    Width = 153
    Height = 17
    Max = 256
    Min = 1
    Orientation = trHorizontal
    Frequency = 1
    Position = 1
    SelEnd = 0
    SelStart = 0
    TabOrder = 3
    TickMarks = tmBottomRight
    TickStyle = tsAuto
  end
  object Trackrange: TTrackBar
    Left = 64
    Top = 88
    Width = 153
    Height = 17
    Max = 256
    Min = 1
    Orientation = trHorizontal
    Frequency = 1
    Position = 1
    SelEnd = 0
    SelStart = 0
    TabOrder = 4
    TickMarks = tmBottomRight
    TickStyle = tsAuto
  end
  object LoadImgFile: TButton
    Left = 408
    Top = 48
    Width = 65
    Height = 25
    Caption = 'Load File'
    TabOrder = 5
    OnClick = LoadImgFileClick
  end
  object OpenDialog1: TOpenDialog
    Filter = 'img|*.img|All|*.*'
    Left = 576
    Top = 8
  end
end
