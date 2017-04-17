object Eliashberg: TEliashberg
  Left = 517
  Top = 104
  Width = 495
  Height = 419
  Caption = 'Calculo Eliashberg'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Busy: TLabel
    Left = 344
    Top = 184
    Width = 83
    Height = 24
    Caption = 'Not busy'
    Color = clRed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Count: TLabel
    Left = 408
    Top = 224
    Width = 6
    Height = 13
    Caption = '1'
  end
  object Label26: TLabel
    Left = 344
    Top = 224
    Width = 43
    Height = 13
    Caption = 'Iterations'
  end
  object EliashPara: TTabbedNotebook
    Left = 8
    Top = 24
    Width = 321
    Height = 353
    TabFont.Charset = DEFAULT_CHARSET
    TabFont.Color = clBtnText
    TabFont.Height = -11
    TabFont.Name = 'MS Sans Serif'
    TabFont.Style = []
    TabOrder = 0
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'Parameters'
      object Label1: TLabel
        Left = 16
        Top = 24
        Width = 34
        Height = 13
        Caption = 'Delta 0'
      end
      object Label2: TLabel
        Left = 16
        Top = 96
        Width = 53
        Height = 13
        Caption = 'Lorenciana'
      end
      object Label3: TLabel
        Left = 88
        Top = 64
        Width = 37
        Height = 13
        Caption = 'Centro1'
      end
      object Label4: TLabel
        Left = 88
        Top = 88
        Width = 37
        Height = 13
        Caption = 'Ancho1'
      end
      object Label5: TLabel
        Left = 16
        Top = 256
        Width = 41
        Height = 13
        Caption = 'Coulomb'
      end
      object Label6: TLabel
        Left = 224
        Top = 32
        Width = 15
        Height = 13
        Caption = 'mV'
      end
      object Label7: TLabel
        Left = 224
        Top = 64
        Width = 15
        Height = 13
        Caption = 'mV'
      end
      object Label8: TLabel
        Left = 224
        Top = 88
        Width = 15
        Height = 13
        Caption = 'mV'
      end
      object Label9: TLabel
        Left = 224
        Top = 264
        Width = 15
        Height = 13
        Caption = 'mV'
      end
      object Label13: TLabel
        Left = 16
        Top = 288
        Width = 73
        Height = 13
        Caption = 'delta imaginario'
      end
      object Label21: TLabel
        Left = 224
        Top = 296
        Width = 15
        Height = 13
        Caption = 'mV'
      end
      object Label22: TLabel
        Left = 88
        Top = 192
        Width = 37
        Height = 13
        Caption = 'Ancho2'
      end
      object Label23: TLabel
        Left = 88
        Top = 168
        Width = 37
        Height = 13
        Caption = 'Centro2'
      end
      object Label24: TLabel
        Left = 224
        Top = 168
        Width = 15
        Height = 13
        Caption = 'mV'
      end
      object Label25: TLabel
        Left = 224
        Top = 192
        Width = 15
        Height = 13
        Caption = 'mV'
      end
      object Label28: TLabel
        Left = 96
        Top = 112
        Width = 27
        Height = 13
        Caption = 'Alto 1'
      end
      object Alto2l: TLabel
        Left = 104
        Top = 224
        Width = 26
        Height = 13
        Caption = 'Alto2l'
      end
      object Label30: TLabel
        Left = 104
        Top = 136
        Width = 38
        Height = 13
        Caption = 'Alphasq'
      end
      object EDelta0: TEdit
        Left = 160
        Top = 24
        Width = 49
        Height = 21
        TabOrder = 0
        Text = '1.34'
      end
      object ECentro: TEdit
        Left = 160
        Top = 56
        Width = 49
        Height = 21
        TabOrder = 1
        Text = '4.4'
      end
      object EAncho: TEdit
        Left = 160
        Top = 80
        Width = 49
        Height = 21
        TabOrder = 2
        Text = '0.75'
      end
      object ECoulomb: TEdit
        Left = 160
        Top = 256
        Width = 49
        Height = 21
        TabOrder = 3
        Text = '0.11'
      end
      object EDeltaImag: TEdit
        Left = 160
        Top = 288
        Width = 49
        Height = 21
        TabOrder = 4
        Text = '1'
      end
      object ECalcLor: TButton
        Left = 248
        Top = 136
        Width = 57
        Height = 25
        Caption = 'Calcula'
        TabOrder = 5
        OnClick = ECalcLorClick
      end
      object ECalcN: TButton
        Left = 248
        Top = 24
        Width = 49
        Height = 25
        Caption = 'Calcula'
        TabOrder = 6
        OnClick = ECalcNClick
      end
      object ECentro2: TEdit
        Left = 160
        Top = 160
        Width = 49
        Height = 21
        TabOrder = 7
        Text = '8.5'
      end
      object EAncho2: TEdit
        Left = 160
        Top = 184
        Width = 49
        Height = 21
        TabOrder = 8
        Text = '0.5'
      end
      object Alto_1: TEdit
        Left = 160
        Top = 104
        Width = 49
        Height = 21
        TabOrder = 9
        Text = '1.1'
      end
      object Alto_2: TEdit
        Left = 160
        Top = 216
        Width = 49
        Height = 21
        TabOrder = 10
        Text = '1.3'
      end
      object Alphasqa: TEdit
        Left = 160
        Top = 128
        Width = 49
        Height = 21
        TabOrder = 11
        Text = '1'
      end
    end
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'Integration'
      object Label14: TLabel
        Left = 8
        Top = 24
        Width = 81
        Height = 13
        Caption = 'Integral sobre wq'
      end
      object Label15: TLabel
        Left = 120
        Top = 16
        Width = 20
        Height = 13
        Caption = 'Max'
      end
      object Label16: TLabel
        Left = 120
        Top = 48
        Width = 46
        Height = 13
        Caption = 'NroPasos'
      end
      object Label17: TLabel
        Left = 8
        Top = 96
        Width = 81
        Height = 13
        Caption = 'Integral sobre wp'
      end
      object Label18: TLabel
        Left = 120
        Top = 80
        Width = 20
        Height = 13
        Caption = 'Max'
      end
      object Label19: TLabel
        Left = 120
        Top = 104
        Width = 46
        Height = 13
        Caption = 'NroPasos'
      end
      object Label20: TLabel
        Left = 16
        Top = 144
        Width = 150
        Height = 13
        Caption = 'frecuencia de corte de foinones'
      end
      object Label27: TLabel
        Left = 16
        Top = 176
        Width = 109
        Height = 13
        Caption = 'frecuencia de corte w0'
      end
      object EwqMax: TEdit
        Left = 192
        Top = 16
        Width = 41
        Height = 21
        TabOrder = 0
        Text = '20'
      end
      object EwqPasos: TEdit
        Left = 192
        Top = 40
        Width = 41
        Height = 21
        TabOrder = 1
        Text = '300'
      end
      object EwpMax: TEdit
        Left = 192
        Top = 72
        Width = 41
        Height = 21
        TabOrder = 2
        Text = '20'
      end
      object EwpPasos: TEdit
        Left = 192
        Top = 96
        Width = 41
        Height = 21
        TabOrder = 3
        Text = '300'
      end
      object Ewcorte: TEdit
        Left = 192
        Top = 136
        Width = 41
        Height = 21
        TabOrder = 4
        Text = '20'
      end
      object fcortew0: TEdit
        Left = 192
        Top = 168
        Width = 41
        Height = 21
        TabOrder = 5
        Text = '60'
      end
    end
    object TTabPage
      Left = 4
      Top = 24
      Caption = 'Rango'
      object Label10: TLabel
        Left = 16
        Top = 24
        Width = 30
        Height = 13
        Caption = 'V  Min'
      end
      object Label11: TLabel
        Left = 16
        Top = 48
        Width = 33
        Height = 13
        Caption = 'V  Max'
      end
      object Label12: TLabel
        Left = 16
        Top = 72
        Width = 24
        Height = 13
        Caption = 'Paso'
      end
      object Label29: TLabel
        Left = 8
        Top = 112
        Width = 67
        Height = 13
        Caption = 'minimo de sqrt'
      end
      object EVmin: TEdit
        Left = 80
        Top = 16
        Width = 41
        Height = 21
        TabOrder = 0
        Text = '0.01'
      end
      object EVMax: TEdit
        Left = 80
        Top = 40
        Width = 41
        Height = 21
        TabOrder = 1
        Text = '50'
      end
      object EVPaso: TEdit
        Left = 80
        Top = 64
        Width = 41
        Height = 21
        TabOrder = 2
        Text = '0.5'
      end
      object MinSqr: TEdit
        Left = 80
        Top = 104
        Width = 49
        Height = 21
        TabOrder = 3
        Text = '1'
      end
    end
  end
  object ECalc: TButton
    Left = 360
    Top = 48
    Width = 65
    Height = 41
    Caption = 'Calcula'
    TabOrder = 1
    OnClick = ECalcClick
  end
  object Iter: TSpinEdit
    Left = 440
    Top = 216
    Width = 33
    Height = 22
    MaxValue = 10
    MinValue = 1
    TabOrder = 2
    Value = 2
  end
  object CalN_E: TCheckBox
    Left = 360
    Top = 112
    Width = 81
    Height = 25
    Caption = 'Calcula N(E)'
    TabOrder = 3
  end
end
