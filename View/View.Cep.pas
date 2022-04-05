unit View.Cep;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  System.MaskUtils,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.Objects,
  FMX.Layouts,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Edit,
  FMX.Effects,
  FMX.Filter.Effects;

type
  TFrmCadEndereco = class(TForm)
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Label1: TLabel;
    Layout1: TLayout;
    layEdtCep: TRectangle;
    edtCep: TEdit;
    ImgClose: TImage;
    edtSearchCep: TEditButton;
    Layout2: TLayout;
    Rectangle4: TRectangle;
    edtCidade: TEdit;
    Layout3: TLayout;
    Rectangle5: TRectangle;
    edtEndereco: TEdit;
    Rectangle6: TRectangle;
    edtUf: TEdit;
    Layout4: TLayout;
    Rectangle7: TRectangle;
    edtBairro: TEdit;
    Image1: TImage;
    procedure ImgCloseClick(Sender: TObject);
    procedure edtCepKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edtEnderecoKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtBairroKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure edtCidadeKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edtSearchCepClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    procedure BuscarCep;
    procedure CleanFields;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadEndereco: TFrmCadEndereco;

implementation

uses
  Controller.Cep, Model.Cep;

{$R *.fmx}

procedure TFrmCadEndereco.edtBairroKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if (Key = vkReturn) or (Key = vkTab) then
    edtCidade.SetFocus;
end;

procedure TFrmCadEndereco.edtCepKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if (Key = vkReturn) or (Key = vkTab) then
    BuscarCep;
end;

procedure TFrmCadEndereco.edtCidadeKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if (Key = vkReturn) or (Key = vkTab) then
    edtUf.SetFocus;
end;

procedure TFrmCadEndereco.edtEnderecoKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if (Key = vkReturn) or (Key = vkTab) then
    edtBairro.SetFocus;
end;

procedure TFrmCadEndereco.edtSearchCepClick(Sender: TObject);
begin
  BuscarCep;
end;

procedure TFrmCadEndereco.BuscarCep;
var
  LCep : TCep;
begin
  try
    LCep := TControllerCep.GetCep(edtCep.Text);
    if Assigned(LCep) then
    begin
      edtEndereco.Text := LCep.endereco;
      edtBairro.Text   := LCep.bairro;
      edtCidade.Text   := LCep.cidade;
      edtUf.Text       := LCep.uf;
    end
    else
      edtEndereco.SetFocus;
  finally
    LCep.Free;
  end;
end;

procedure TFrmCadEndereco.FormShow(Sender: TObject);
begin
  edtCep.SetFocus;
end;

procedure TFrmCadEndereco.Image1Click(Sender: TObject);
begin
  CleanFields;
end;

procedure TFrmCadEndereco.CleanFields;
begin
  edtCep.Text      := '';
  edtEndereco.Text := '';
  edtBairro.Text   := '';
  edtCidade.Text   := '';
  edtUf.Text       := '';
  edtCep.SetFocus;
end;

procedure TFrmCadEndereco.ImgCloseClick(Sender: TObject);
begin
  Close;
end;

end.
