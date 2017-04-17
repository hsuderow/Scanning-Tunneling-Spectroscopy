object Form1: TForm1
  Left = 868
  Top = 121
  Width = 418
  Height = 575
  Caption = 'Calculo BCS'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 16
    Top = 32
    Width = 25
    Height = 13
    Caption = 'Delta'
  end
  object Parameters: TTabbedNotebook
    Left = 8
    Top = 16
    Width = 289
    Height = 329
    PageIndex = 4
    TabFont.Charset = DEFAULT_CHARSET
    TabFont.Color = clBtnText
    TabFont.Height = -11
    TabFont.Name = 'MS Sans Serif'
    TabFont.Style = []
    TabOrder = 0
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'BCS'
      object Delta: TLabel
        Left = 8
        Top = 24
        Width = 25
        Height = 13
        Caption = 'Delta'
      end
      object Accuracy: TLabel
        Left = 8
        Top = 96
        Width = 39
        Height = 13
        Caption = '10 times'
      end
      object Label1: TLabel
        Left = 112
        Top = 96
        Width = 25
        Height = 13
        Caption = 'steps'
      end
      object Label3: TLabel
        Left = 8
        Top = 72
        Width = 41
        Height = 13
        Caption = 'Max Volt'
      end
      object LabelN: TLabel
        Left = 16
        Top = 160
        Width = 34
        Height = 13
        Caption = 'Delta 2'
      end
      object Label9: TLabel
        Left = 16
        Top = 184
        Width = 33
        Height = 13
        Caption = 'RatioG'
      end
      object Label11: TLabel
        Left = 16
        Top = 240
        Width = 36
        Height = 13
        Caption = 'Delta H'
      end
      object Label12: TLabel
        Left = 16
        Top = 272
        Width = 33
        Height = 13
        Caption = 'RatioH'
      end
      object Label13: TLabel
        Left = 8
        Top = 48
        Width = 36
        Height = 13
        Caption = 'Gamma'
      end
      object ValDelta: TEdit
        Left = 64
        Top = 16
        Width = 41
        Height = 21
        TabOrder = 0
        Text = '1'
      end
      object Steps: TSpinEdit
        Left = 64
        Top = 88
        Width = 41
        Height = 22
        Increment = 10
        MaxLength = 1000
        MaxValue = 1000
        MinValue = 10
        TabOrder = 1
        Value = 10
      end
      object MaxVolt: TEdit
        Left = 64
        Top = 64
        Width = 41
        Height = 21
        TabOrder = 2
        Text = '5'
      end
      object Delta_2: TEdit
        Left = 64
        Top = 152
        Width = 49
        Height = 21
        TabOrder = 3
        Text = '2'
      end
      object SecondGap: TCheckBox
        Left = 8
        Top = 120
        Width = 97
        Height = 17
        Caption = 'SecondGap'
        TabOrder = 4
        OnClick = SecondGapClick
      end
      object GapRatio: TEdit
        Left = 64
        Top = 184
        Width = 49
        Height = 21
        TabOrder = 5
        Text = '1'
      end
      object SpinSplitting: TCheckBox
        Left = 8
        Top = 208
        Width = 97
        Height = 25
        Caption = 'SpinSplitting'
        TabOrder = 6
      end
      object Delta_H: TEdit
        Left = 64
        Top = 240
        Width = 49
        Height = 21
        TabOrder = 7
        Text = '0'
      end
      object SpinRatio: TEdit
        Left = 64
        Top = 264
        Width = 49
        Height = 21
        TabOrder = 8
        Text = '1'
      end
      object ValGamma: TEdit
        Left = 64
        Top = 40
        Width = 41
        Height = 21
        TabOrder = 9
        Text = '0'
      end
    end
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'Smearing'
      object Label4: TLabel
        Left = 88
        Top = 16
        Width = 41
        Height = 13
        Caption = 'Round 1'
      end
      object Label6: TLabel
        Left = 88
        Top = 96
        Width = 69
        Height = 13
        Caption = 'Sup Limit in Int'
      end
      object Label7: TLabel
        Left = 88
        Top = 136
        Width = 49
        Height = 13
        Caption = 'IterationNr'
      end
      object Label8: TLabel
        Left = 88
        Top = 56
        Width = 41
        Height = 13
        Caption = 'Round 2'
      end
      object Label10: TLabel
        Left = 152
        Top = 16
        Width = 63
        Height = 13
        Caption = 'Normalization'
      end
      object SmearType: TRadioGroup
        Left = 0
        Top = 16
        Width = 81
        Height = 121
        Caption = 'SmearType'
        ItemIndex = 0
        Items.Strings = (
          'None'
          'Gaussian'
          'Other')
        TabOrder = 0
      end
      object RoundGauss: TEdit
        Left = 96
        Top = 32
        Width = 41
        Height = 21
        TabOrder = 1
        Text = '0.1'
      end
      object SupLimit: TEdit
        Left = 96
        Top = 112
        Width = 41
        Height = 21
        TabOrder = 2
        Text = '20'
      end
      object D_steps: TSpinEdit
        Left = 96
        Top = 152
        Width = 49
        Height = 22
        Increment = 10
        MaxValue = 10000
        MinValue = 10
        TabOrder = 3
        Value = 10
      end
      object Round_2: TEdit
        Left = 96
        Top = 72
        Width = 41
        Height = 21
        TabOrder = 4
        Text = '0.1'
      end
    end
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'Temp'
      object Label5: TLabel
        Left = 64
        Top = 88
        Width = 29
        Height = 13
        Caption = 'Kelvin'
      end
      object TempChoice: TRadioGroup
        Left = 0
        Top = 16
        Width = 121
        Height = 49
        Caption = 'TempChoice'
        ItemIndex = 0
        Items.Strings = (
          'Zero temperature'
          'Finite temperature')
        TabOrder = 0
      end
      object Temp: TEdit
        Left = 8
        Top = 80
        Width = 49
        Height = 21
        TabOrder = 1
        Text = '1'
      end
    end
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'BCS Distribution'
      object Label14: TLabel
        Left = 176
        Top = 56
        Width = 25
        Height = 13
        Caption = 'File 1'
      end
      object Label15: TLabel
        Left = 176
        Top = 88
        Width = 25
        Height = 13
        Caption = 'File 2'
      end
      object DistrOpenFile: TButton
        Left = 8
        Top = 48
        Width = 161
        Height = 25
        Caption = 'Open File 1 for distribution'
        TabOrder = 0
        OnClick = DistrOpenFileClick
      end
      object ArbDistr: TCheckBox
        Left = 8
        Top = 24
        Width = 153
        Height = 17
        Caption = 'Enable arbitrary distribution'
        TabOrder = 1
      end
      object Edit1: TEdit
        Left = 48
        Top = 144
        Width = 65
        Height = 21
        TabOrder = 2
        Text = '1'
      end
      object Button2: TButton
        Left = 128
        Top = 144
        Width = 75
        Height = 25
        Caption = 'Interpola'
        TabOrder = 3
      end
      object Button6: TButton
        Left = 8
        Top = 80
        Width = 161
        Height = 25
        Caption = 'Open File 2 for distribution'
        TabOrder = 4
        OnClick = Button6Click
      end
    end
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'Correlation images'
      object Label23: TLabel
        Left = 96
        Top = 16
        Width = 64
        Height = 13
        Caption = 'Size of Image'
      end
      object Label24: TLabel
        Left = 216
        Top = 16
        Width = 15
        Height = 13
        Caption = 'Pts'
      end
      object Label25: TLabel
        Left = 152
        Top = 72
        Width = 12
        Height = 13
        Caption = 'd='
      end
      object Label26: TLabel
        Left = 216
        Top = 72
        Width = 15
        Height = 13
        Caption = 'Pts'
      end
      object Button10: TButton
        Left = 8
        Top = 16
        Width = 75
        Height = 17
        Caption = 'Load Matrix'
        TabOrder = 0
        OnClick = Button10Click
      end
      object Edit9: TEdit
        Left = 168
        Top = 8
        Width = 41
        Height = 21
        TabOrder = 1
        Text = '64'
      end
      object Button11: TButton
        Left = 0
        Top = 64
        Width = 137
        Height = 25
        Caption = 'Make Hexagonal lattice'
        TabOrder = 2
      end
      object Edit10: TEdit
        Left = 168
        Top = 64
        Width = 41
        Height = 21
        TabOrder = 3
        Text = '3'
      end
      object Button12: TButton
        Left = 0
        Top = 96
        Width = 241
        Height = 25
        Caption = 'Calculate G(r) and G(alpha) for perfect lattice'
        TabOrder = 4
      end
      object Button13: TButton
        Left = 0
        Top = 128
        Width = 241
        Height = 25
        Caption = 'Calculate G(r) and G(alpha) for loaded matrix'
        TabOrder = 5
        OnClick = Button13Click
      end
      object Button14: TButton
        Left = 8
        Top = 176
        Width = 185
        Height = 25
        Caption = 'Plot Distance histogram'
        TabOrder = 6
        OnClick = Button14Click
      end
      object Button15: TButton
        Left = 8
        Top = 240
        Width = 185
        Height = 25
        Caption = 'Plot Angle versus distance'
        TabOrder = 7
        OnClick = Button15Click
      end
      object Button16: TButton
        Left = 8
        Top = 208
        Width = 185
        Height = 25
        Caption = 'Plot G(r)'
        TabOrder = 8
      end
      object Button17: TButton
        Left = 8
        Top = 272
        Width = 185
        Height = 25
        Caption = 'Plot G(alpha)'
        TabOrder = 9
        OnClick = Button17Click
      end
      object Button18: TButton
        Left = 8
        Top = 40
        Width = 105
        Height = 17
        Caption = 'Load Triangulation'
        TabOrder = 10
        OnClick = Button18Click
      end
    end
  end
  object Calc: TButton
    Left = 304
    Top = 24
    Width = 73
    Height = 25
    Caption = 'Calculate'
    TabOrder = 1
    OnClick = CalcClick
  end
  object Panel1: TPanel
    Left = 8
    Top = 352
    Width = 257
    Height = 41
    TabOrder = 2
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 73
      Height = 25
      Caption = 'Eliashberg'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object PlotDist: TButton
    Left = 304
    Top = 56
    Width = 89
    Height = 17
    Caption = 'Plot distribution 1'
    TabOrder = 3
    OnClick = PlotDistClick
  end
  object CalISS: TButton
    Left = 304
    Top = 104
    Width = 81
    Height = 41
    Caption = 'Calculate I SIS'
    TabOrder = 4
    OnClick = CalISSClick
  end
  object Sprime: TCheckBox
    Left = 304
    Top = 160
    Width = 49
    Height = 25
    Caption = 'S '#39
    TabOrder = 5
  end
  object SPrimeVal: TEdit
    Left = 360
    Top = 160
    Width = 33
    Height = 21
    TabOrder = 6
    Text = '2'
  end
  object Button3: TButton
    Left = 304
    Top = 200
    Width = 89
    Height = 25
    Caption = 'Convolute N-1'
    TabOrder = 7
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 304
    Top = 264
    Width = 89
    Height = 25
    Caption = 'Convolute 1-1'
    TabOrder = 8
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 304
    Top = 296
    Width = 89
    Height = 25
    Caption = 'Convolute 1-2'
    TabOrder = 9
    OnClick = Button5Click
  end
  object Button7: TButton
    Left = 304
    Top = 80
    Width = 89
    Height = 17
    Caption = 'Plot distribution 2'
    TabOrder = 10
    OnClick = Button7Click
  end
  object CheckBox1: TCheckBox
    Left = 304
    Top = 328
    Width = 97
    Height = 17
    Caption = 'Plot Deriv'
    TabOrder = 11
  end
  object Button8: TButton
    Left = 304
    Top = 232
    Width = 89
    Height = 25
    Caption = 'Convolute S-1'
    TabOrder = 12
    OnClick = Button8Click
  end
  object Panel2: TPanel
    Left = 8
    Top = 408
    Width = 377
    Height = 121
    TabOrder = 13
    object Label16: TLabel
      Left = 8
      Top = 16
      Width = 14
      Height = 13
      Caption = 'D1'
    end
    object Label17: TLabel
      Left = 8
      Top = 40
      Width = 14
      Height = 13
      Caption = 'D0'
    end
    object Label18: TLabel
      Left = 256
      Top = 72
      Width = 34
      Height = 13
      Caption = 'Theta0'
    end
    object Label19: TLabel
      Left = 248
      Top = 48
      Width = 29
      Height = 13
      Caption = 'Pasos'
    end
    object Label20: TLabel
      Left = 8
      Top = 72
      Width = 76
      Height = 13
      Caption = 'Energía máxima'
    end
    object Label21: TLabel
      Left = 8
      Top = 96
      Width = 24
      Height = 13
      Caption = 'Paso'
    end
    object Label22: TLabel
      Left = 256
      Top = 96
      Width = 55
      Height = 13
      Caption = 'Paso Theta'
    end
    object Edit2: TEdit
      Left = 32
      Top = 8
      Width = 41
      Height = 21
      TabOrder = 0
      Text = '.3'
    end
    object Edit3: TEdit
      Left = 32
      Top = 32
      Width = 41
      Height = 21
      TabOrder = 1
      Text = '1'
    end
    object Edit4: TEdit
      Left = 320
      Top = 64
      Width = 33
      Height = 21
      TabOrder = 2
      Text = '0'
    end
    object Button9: TButton
      Left = 256
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Integrate'
      TabOrder = 3
      OnClick = Button9Click
    end
    object Edit5: TEdit
      Left = 288
      Top = 40
      Width = 73
      Height = 21
      TabOrder = 4
      Text = '1000'
    end
    object Edit6: TEdit
      Left = 96
      Top = 64
      Width = 41
      Height = 21
      TabOrder = 5
      Text = '3'
    end
    object Edit7: TEdit
      Left = 96
      Top = 88
      Width = 41
      Height = 21
      TabOrder = 6
      Text = '0.01'
    end
    object Edit8: TEdit
      Left = 320
      Top = 88
      Width = 33
      Height = 21
      TabOrder = 7
      Text = '360'
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 252
    Top = 240
  end
  object OpenDialog2: TOpenDialog
    Left = 252
    Top = 272
  end
end
