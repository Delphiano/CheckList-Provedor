unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.ScrollBox, FMX.Memo, FMX.Controls.Presentation, FMX.Edit, FMX.TabControl,
  FMX.ListBox, FMX.Objects, FMX.Layouts, FMX.Ani, FMX.Memo.Types;

type
  TForm1 = class(TForm)
    EditNome: TEdit;
    EditTelefone: TEdit;
    EditAtendimentos: TEdit;
    TabControl1: TTabControl;
    Radio: TTabItem;
    EditRadioSinal: TEdit;
    EditRadioCCQ: TEdit;
    EditRadioAirQuality: TEdit;
    CheckBoxRadioIP: TCheckBox;
    EditRadioAtualizacao: TEdit;
    EditRadioUptime: TEdit;
    EditRadioLan0: TEdit;
    CheckBoxRadioRoteador: TCheckBox;
    CheckBoxRadioOutrosAparelhos: TCheckBox;
    Fibra: TTabItem;
    EditFibraSinal: TEdit;
    CheckBoxFibraDHCP: TCheckBox;
    Button1: TButton;
    MemoFibraComentario: TMemo;
    EditFibraModelo: TEdit;
    EditFibraTemperatura: TEdit;
    CheckBoxFibraLAN: TCheckBox;
    CheckBoxFibraUPNP: TCheckBox;
    CheckBoxFibraDDOS: TCheckBox;
    CheckBoxFibraFirewall: TCheckBox;
    CheckBoxFibraNTP: TCheckBox;
    CheckBoxFibraIPv6: TCheckBox;
    Label8: TLabel;
    ComboBoxObservacoes: TComboBox;
    Label1: TLabel;
    Rectangle1: TRectangle;
    RadioButton4: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton1: TRadioButton;
    PanelRodape: TRectangle;
    Button3: TButton;
    Edit3: TEdit;
    Button2: TButton;
    VertScrollBox1: TVertScrollBox;
    Rectangle3: TRectangle;
    Button4: TButton;
    Edit1: TEdit;
    Rectangle2: TRectangle;
    Text2: TText;
    Text3: TText;
    Text4: TText;
    Text5: TText;
    Text6: TText;
    Text7: TText;
    Text8: TText;
    Text1: TText;
    Rectangle4: TRectangle;
    Text9: TText;
    Text10: TText;
    Text11: TText;
    Text12: TText;
    Text13: TText;
    Text14: TText;
    Text15: TText;
    Text16: TText;
    Copiar_Base: TButton;
    Excluir_Base: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    ColorAnimation1: TColorAnimation;
    Timer1: TTimer;
    Line1: TLine;
    Button5: TButton;
    Label2: TLabel;
    EditAtendente: TEdit;
    Genero: TButton;
    EditFibraAtualizacao: TEdit;
    LabelRoteador: TLabel;
    ComboBoxFibraRoteador: TComboBox;
    CheckBoxRadioNTP: TCheckBox;
    CheckBoxFibraDNSIPv6: TCheckBox;
    CheckBoxContato: TCheckBox;
    CheckBox1: TCheckBox;
    Subir_Base: TButton;
    procedure Ajuste(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditNomeChange(Sender: TObject);
    procedure Button200Click(Sender: TObject);
    procedure ButtonRadioRelatorioClick(Sender: TObject);
    procedure RadioButton1Change(Sender: TObject);
    procedure Recarregar;
    procedure Edit3Click(Sender: TObject);
    procedure Edit3KeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Excluir_BaseClick(Sender: TObject);
    procedure Copiar_BaseClick(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Text1Click(Sender: TObject);
    procedure Edit1KeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure GeneroClick(Sender: TObject);
    procedure EditAtendenteChange(Sender: TObject);
    procedure Subir_BaseClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Tamanho: TSize;
  Atual: String;
  MemoTudo: TMemo;
  Recarregou: Boolean;
  LabelReferencia: TLabel;

implementation

{$R *.fmx}

procedure TForm1.Recarregar;
var
  i: Integer;
  espaco: TRectangle;
  excluir, copiar, subir: TButton;
  frase: TLabel;
begin
  VertScrollBox1.DisposeOf;
  VertScrollBox1 := TVertScrollBox.Create(self);
  (Rectangle1).AddObject(VertScrollBox1);
  VertScrollBox1.Align := TAlignLayout.Client;
  VertScrollBox1.Margins.Top := 5;
  VertScrollBox1.Margins.Left := 5;
  VertScrollBox1.Margins.Right := 5;
  VertScrollBox1.Margins.Bottom := 5;

  MemoTudo.Lines.Clear;

  if fileExists(Atual) then
    MemoTudo.Lines.LoadFromFile(Atual)
  else
    MemoTudo.Lines.SaveToFile(Atual);
  i := 0;
  while i < MemoTudo.Lines.Count do
  begin
    frase := TLabel.Create(Self);
    frase.Text := MemoTudo.Lines[i].Replace(':p:', #13#10#13#10);
    frase.Align := TAlignLayout.Top;
    frase.StyleName := i.ToString;
    frase.AutoSize := True;
    frase.OnClick := Label2.OnClick;
    VertScrollBox1.AddObject(frase);
    frase.HitTest := True;

    espaco := TRectangle.Create(VertScrollBox1);
    espaco.Height := 22;
    espaco.Align := TAlignLayout.Top;
    espaco.Sides := [TSide.Bottom];
    espaco.Fill.Kind := TBrushKind.None;
    espaco.Margins.Bottom := 10;
    VertScrollBox1.AddObject(espaco);

    subir := TButton.Create(espaco);
    subir.Text := '⬆';
    subir.Width := 22;
    subir.Align := TAlignLayout.Right;
    espaco.AddObject(subir);
    subir.StyleName := i.ToString;
    subir.OnClick := subir_base.OnClick;

    excluir := TButton.Create(espaco);
    excluir.Text := '❌';
    excluir.Width := 22;
    excluir.Align := TAlignLayout.Right;
    espaco.AddObject(excluir);
    excluir.StyleName := i.ToString;
    excluir.OnClick := excluir_base.OnClick;

    copiar := TButton.Create(espaco);
    copiar.Text := 'copiar';
    copiar.StyleName := i.ToString;
    copiar.OnClick := copiar_base.OnClick;
    espaco.AddObject(copiar);
    copiar.Align := TAlignLayout.Right;
    copiar.Width := 50;

    i := i + 1
  end;
  Edit3.SetFocus
end;

procedure TForm1.Subir_BaseClick(Sender: TObject);
var
  Geral: TStringList;
  Linha: String;
begin
  Geral := TStringList.Create;
  Linha := MemoTudo.Lines[(StrToInt((Sender as TButton).StyleName))];
  MemoTudo.Lines.Delete(StrToInt((Sender as TButton).StyleName));
  Geral.AddStrings(MemoTudo.Lines);
  MemoTudo.Lines.Clear;
  MemoTudo.Lines.Add(Linha);
  MemoTudo.Lines.AddStrings(Geral);
  MemoTudo.Lines.SaveToFile(Atual);
  Recarregar;
  Geral.Free
end;

procedure TForm1.Text1Click(Sender: TObject);
var
  i: Integer;
begin
  i := 0;
  while (Sender as TText).Text <> Memo1.Lines[i] do
    i := i + 1;
  Edit3.Text := Edit3.Text + Memo2.Lines[i];
  Edit3.SetFocus;
  Edit3.SelStart := Edit3.Text.Length;
  Rectangle4.Visible := False;
  Rectangle2.Visible := False;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if Button5.Text = '>' then
  begin
    if Self.Width < 606 then
      Self.Width := Self.Width + 31
    else
    begin
      Button5.Text := '<';
      Timer1.Enabled := False
    end;
  end
  else
  if Button5.Text = '<' then
  begin
    if Self.Width > 327 then
      Self.Width := Self.Width - 31
    else
    begin
      Button5.Text := '>';
      Timer1.Enabled := False
    end;
  end
end;

procedure TForm1.Ajuste(Sender: TObject);
begin
  if Sender.ClassType = TTabControl then
  begin
    (Sender as TTabControl).Width := (Sender as TTabControl).Width * Form1.Width / Tamanho.Width;
    (Sender as TTabControl).Height := (Sender as TTabControl).Height * Form1.Height / Tamanho.Height;
    (Sender as TTabControl).Position.X := (Sender as TTabControl).Position.X * Form1.Width / Tamanho.Width;
    (Sender as TTabControl).Position.Y := (Sender as TTabControl).Position.Y * Form1.Height / Tamanho.Height;
  end
  else
  if Sender.ClassType = TLabel then
  begin
    (Sender as TLabel).Width := (Sender as TLabel).Width * Form1.Width / Tamanho.Width;
    (Sender as TLabel).Height := (Sender as TLabel).Height * Form1.Height / Tamanho.Height;
    (Sender as TLabel).Position.X := (Sender as TLabel).Position.X * Form1.Width / Tamanho.Width;
    (Sender as TLabel).Position.Y := (Sender as TLabel).Position.Y * Form1.Height / Tamanho.Height;
    (Sender as TLabel).TextSettings.VertAlign := TTextAlign.Center;
    (Sender as TLabel).TextSettings.HorzAlign := TTextAlign.Center;
  end
  else
  if Sender.ClassType = TEdit then
  begin
    (Sender as TEdit).Width := (Sender as TEdit).Width * Form1.Width / Tamanho.Width;
    (Sender as TEdit).Height := (Sender as TEdit).Height * Form1.Height / Tamanho.Height;
    (Sender as TEdit).Position.X := (Sender as TEdit).Position.X * Form1.Width / Tamanho.Width;
    (Sender as TEdit).Position.Y := (Sender as TEdit).Position.Y * Form1.Height / Tamanho.Height;
    (Sender as TEdit).TextSettings.VertAlign := TTextAlign.Center;
    (Sender as TEdit).TextSettings.HorzAlign := TTextAlign.Center;
  end
  else
  if Sender.ClassType = TSwitch then
  begin
    (Sender as TSwitch).Width := (Sender as TSwitch).Width * Form1.Width / Tamanho.Width;
    (Sender as TSwitch).Height := (Sender as TSwitch).Height * Form1.Height / Tamanho.Height;
    (Sender as TSwitch).Position.X := (Sender as TSwitch).Position.X * Form1.Width / Tamanho.Width;
    (Sender as TSwitch).Position.Y := (Sender as TSwitch).Position.Y * Form1.Height / Tamanho.Height;
  end
  else
  if Sender.ClassType = TCheckBox then
  begin
    (Sender as TCheckBox).Width := (Sender as TCheckBox).Width * Form1.Width / Tamanho.Width;
    (Sender as TCheckBox).Height := (Sender as TCheckBox).Height * Form1.Height / Tamanho.Height;
    (Sender as TCheckBox).Position.X := (Sender as TCheckBox).Position.X * Form1.Width / Tamanho.Width;
    (Sender as TCheckBox).Position.Y := (Sender as TCheckBox).Position.Y * Form1.Height / Tamanho.Height;
  end
  else
  if Sender.ClassType = TButton then
  begin
    (Sender as TButton).Width := (Sender as TButton).Width * Form1.Width / Tamanho.Width;
    (Sender as TButton).Height := (Sender as TButton).Height * Form1.Height / Tamanho.Height;
    (Sender as TButton).Position.X := (Sender as TButton).Position.X * Form1.Width / Tamanho.Width;
    (Sender as TButton).Position.Y := (Sender as TButton).Position.Y * Form1.Height / Tamanho.Height;
  end
end;

{'# CCQ: ' + EditRadioCCQ.Text
'# Air Quality: ' + EditRadioAirQuality.Text
'# Atualização: ' + EditRadioAtualização.Text
'# Uptime: ' + EditRadioUptime.Text
'# LAN0: ' + EditRadioLAN0.Text
Configuração de IP da LAN CheckBoxRadioIP
Roteador dentro dos padrões CheckBoxRadioRoteador
Aparelhos conectados CheckBoxRadioOutrosAparelhos}

procedure TForm1.ButtonRadioRelatorioClick(Sender: TObject);
var
  texto: TMemo;
begin
  texto := TMemo.Create(Self);
  texto.Lines.Clear;
  texto.Lines.Add('# Forma de contato: ' + EditTelefone.Text);
  Texto.Lines.Add('# Atendimentos nos últimos 30 dias exceto este: ' + EditAtendimentos.Text);
  if CheckboxContato.IsChecked then
    Texto.Lines.Add('# Contato atualizado: Sim')
  else
    Texto.Lines.Add('# Contato atualizado: Não');
  if ComboBoxObservacoes.ItemIndex = 0 then
    Texto.Lines.Add('# Contém observações importantes');
  if TabControl1.TabIndex = 0 then
  begin
    texto.Lines.Add('# Sinal: ' + EditRadioSinal.Text);
    texto.Lines.Add('# CCQ: ' + EditRadioCCQ.Text);
    texto.Lines.Add('# Air Quality: ' + EditRadioAirQuality.Text);
    texto.Lines.Add('# Atualização: ' + EditRadioAtualizacao.Text);
    texto.Lines.Add('# Uptime: ' + EditRadioUptime.Text);
    texto.Lines.Add('# LAN0: ' + EditRadioLAN0.Text);
    if CheckBoxRadioIP.IsChecked then
      texto.Lines.Add('# Configuração de IP da LAN: Dentro dos padrões')
    else
      texto.Lines.Add('# Configuração de IP da LAN: Fora dos padrões');
    if CheckBoxRadioNTP.IsChecked then
      texto.Lines.Add('# Configuração de NTP: Dentro dos padrões')
    else
      texto.Lines.Add('# Configuração de NTP: Fora dos padrões');
    if CheckBoxRadioRoteador.IsChecked then
      texto.Lines.Add('# Roteador: Dentro dos padrões')
    else
      texto.Lines.Add('# Roteador: Fora dos padrões');
    if CheckBoxRadioOutrosAparelhos.IsChecked then
      Texto.Lines.Add('# Outros aparelhos conectados: Sim')
    else
      Texto.Lines.Add('# Outros aparelhos conectados: Não');
    Texto.Lines.Add('');
    Texto.Lines.Add('# ' + MemoFibraComentario.Text)
  end
  else
  begin
    texto.Lines.Add('# Sinal: ' + EditFibraSinal.Text);
    texto.Lines.Add('# Modelo: ' + EditFibraModelo.Text);
    texto.Lines.Add('# Temperatura: ' + EditFibraTemperatura.Text);
    texto.Lines.Add('# Atualização: ' + EditFibraAtualizacao.Text);
    if CheckBoxFibraDHCP.IsChecked then
      texto.Lines.Add('# Configuração de DHCP: Dentro dos padrões')
    else
      texto.Lines.Add('# Configuração de DHCP: Fora dos padrões');
    if CheckBoxFibraLAN.IsChecked then
      texto.Lines.Add('# Configuração da LAN: Dentro dos padrões')
    else
      texto.Lines.Add('# Configuração da LAN: Fora dos padrões');
    if CheckBoxFibraUPNP.IsChecked then
      Texto.Lines.Add('# Configuração do UPNP: Dentro dos padrões')
    else
      Texto.Lines.Add('# Configuração do UPNP: Fora dos padrões');
    if CheckBoxFibraNTP.IsChecked then
      Texto.Lines.Add('# Configuração do NTP: Dentro dos padrões')
    else
      Texto.Lines.Add('# Configuração do NTP: Fora dos padrões');
    if CheckBoxFibraDDOS.IsChecked then
      Texto.Lines.Add('# Configuração de DDOS: Dentro dos padrões')
    else
      Texto.Lines.Add('# Configuração de DDOS: Fora dos padrões');
    if CheckBoxFibraFirewall.IsChecked then
      Texto.Lines.Add('# Configuração do Firewall: Dentro dos padrões')
    else
      Texto.Lines.Add('# Configuração do Firewall: Fora dos padrões');
    if CheckBoxFibraIPv6.IsChecked then
      Texto.Lines.Add('# Configuração de IPv6: Dentro dos padrões (SLAAC)')
    else
      Texto.Lines.Add('# Configuração de IPv6: Fora dos padrões');
    if CheckBoxFibraDNSIPv6.IsChecked then
      texto.Lines.Add('# DNS IPv6: Dentro dos padrões')
    else
      texto.Lines.Add('# DNS IPv6: Fora dos padrões');
    if ComboBoxFibraRoteador.ItemIndex = 1 then
      Texto.Lines.Add('# Configuração de IP do Roteador: Dentro dos padrões')
    else
    if ComboBoxFibraRoteador.ItemIndex = 2 then
      Texto.Lines.Add('# Configuração de IP do Roteador: Fora dos padrões');
    Texto.Lines.Add('');
    Texto.Lines.Add('# ' + MemoFibraComentario.Text)
  end;
  texto.SelectAll;
  texto.CopyToClipboard;
  ShowMessage('Relatório gerado. Cole-o no comentário do atendimento!');
  texto.Free
end;

procedure TForm1.Copiar_BaseClick(Sender: TObject);
var
  frases: TMemo;
begin
  frases := TMEmo.Create(Self);
  frases.Lines.Add(MemoTudo.Lines[StrToInt((Sender as TButton).StyleName)]);
  if Trunc(Time * 24) > 17 then
  begin
    if frases.Text.ToLower.Contains('um bom dia') then
      frases.Lines.Add(frases.Text.Replace('um bom dia', 'uma boa noite').Replace('Um bom dia', 'Uma boa noite'))
    else
      frases.Lines.Add(frases.Text.Replace('bom dia', 'boa noite').Replace('Bom dia', 'Boa noite'));
    frases.lines.Delete(0);
  end
  else
  if Trunc(Time * 24) > 11 then
  begin
    if frases.Text.ToLower.Contains('um bom dia') then
      frases.Lines.Add(frases.Text.Replace('Um bom dia', 'Uma boa tarde').Replace('um bom dia', 'uma boa tarde'))
    else
      frases.Lines.Add(frases.Text.Replace('bom dia', 'boa tarde').Replace('Bom dia', 'Boa tarde'));
    frases.lines.Delete(0);
  end;
  frases.Text := frases.Text.Replace(':p:', #13 + #13);
  if genero.Text = '👨' then
    frases.Text := frases.Text.Replace(':atendente:', EditAtendente.Text)
  else
  begin
    frases.Text := frases.Text.Replace('o :atendente:', 'a ' + EditAtendente.Text);
    frases.Text := frases.Text.Replace(':atendente:', EditAtendente.Text)
  end;
  frases.SelectAll;
  frases.CopyToClipboard;
  frases.Free;
end;

procedure TForm1.Button200Click(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to Form1.ComponentCount - 1 do
    Ajuste(Form1.Components[i]);
  Tamanho.Width := Form1.Width;
  Tamanho.Height := Form1.Height
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Rectangle4.Visible := True;
  Rectangle2.Visible := True;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  MemoTudo.Lines.Add(Edit3.Text);
  MemoTudo.Lines.SaveToFile(Atual);
  Edit3.Text := '';
  Recarregar
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  LabelReferencia.Text := Edit1.Text.Replace(':p:', #13#10#13#10);
  MemoTudo.lines[StrToInt(LabelReferencia.StyleName)] := LabelReferencia.Text.Replace(#13#10#13#10, ':p:');
  MemoTudo.Lines.SaveToFile(Atual);
  Rectangle3.Height := 24;
  Edit1.Text := ''
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Timer1.Enabled := True
end;

procedure TForm1.Edit1KeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  if Key = 13 then
    Button4Click(Button4);
end;

procedure TForm1.Edit3Click(Sender: TObject);
begin
  Rectangle2.Visible := False;
  Rectangle4.Visible := False;
end;

procedure TForm1.Edit3KeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  if Key = 13 then
    Button3Click(Button3);
end;

procedure TForm1.EditAtendenteChange(Sender: TObject);
var
  valor: TMemo;
begin
  valor := TMemo.Create(Self);
  valor.Lines.Add(EditAtendente.Text);
  if genero.Text = '👨' then
    valor.Lines.Add('m')
  else
    valor.Lines.Add('f');
  valor.Lines.SaveToFile('atendente');
  valor.DisposeOf
end;

procedure TForm1.EditNomeChange(Sender: TObject);
begin
  Self.Caption := EditNome.Text
end;

procedure TForm1.Excluir_BaseClick(Sender: TObject);
begin
  MemoTudo.Lines.Delete(StrToInt((Sender as TButton).StyleName));
  MemoTudo.Lines.SaveToFile(Atual);
  Recarregar;
end;

procedure TForm1.FormActivate(Sender: TObject);
var
  valor: TMemo;
begin
  if FileExists('atendente') then
  begin
    valor := TMemo.Create(self);
    valor.lines.LoadFromFile('atendente');
    if valor.Lines[1] = 'm' then
      genero.Text :=  '👨'
    else
      genero.Text :=  '👩';
    EditAtendente.Text := valor.Lines[0];
    valor.DisposeOf;
  end;
  if not Recarregou then
  begin
    Recarregar;
    Recarregou := True
  end;
  Edit1.TextSettings.Trimming := TTextTrimming.Character;
  Edit1.TextSettings.WordWrap := True;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Tamanho.Width := Form1.Width;
  Tamanho.Height := Form1.Height;
  MemoTudo := TMemo.Create(Self);
  Atual := 'inicialização';
end;

procedure TForm1.GeneroClick(Sender: TObject);
var
  valor: TMemo;
begin
  if genero.Text = '👨' then
    genero.Text := '👩'
  else
    genero.Text := '👨';
  valor := TMemo.Create(Self);
  valor.Lines.Add(EditAtendente.Text);
  if genero.Text = '👨' then
    valor.Lines.Add('m')
  else
    valor.Lines.Add('f');
  valor.Lines.SaveToFile('atendente');
  valor.DisposeOf
end;

procedure TForm1.Label2Click(Sender: TObject);
begin
  LabelReferencia := Sender as TLabel;
  Edit1.Text := (Sender as TLabel).Text.Replace(#13#10#13#10, ':p:');
end;

procedure TForm1.RadioButton1Change(Sender: TObject);
begin
  if (Sender as TRadioButton).IsChecked then
    Atual := (Sender as TRadioButton).Text;
  Recarregar;
end;

end.
