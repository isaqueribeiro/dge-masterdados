unit UGrPadraoCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, UGrPadrao, IBCustomDataSet, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGrids, ComCtrls, ToolWin, Mask, DBCtrls, IBUpdateSQL, ImgList, TypInfo,
  DBClient, EUserAcs;

type
  TfrmGrPadraoCadastro = class(TfrmGrPadrao)
    Bevel1: TBevel;
    tlbBotoes: TToolBar;
    Bevel2: TBevel;
    Bevel3: TBevel;
    btbtnIncluir: TBitBtn;
    btbtnAlterar: TBitBtn;
    btbtnExcluir: TBitBtn;
    bvlTool3: TBevel;
    btbtnLista: TBitBtn;
    bvlTool2: TBevel;
    btbtnFechar: TBitBtn;
    pgcGuias: TPageControl;
    tbsTabela: TTabSheet;
    Bevel4: TBevel;
    dbgDados: TDBGrid;
    pnlFiltros: TPanel;
    grpBxFiltro: TGroupBox;
    lbltFiltrar: TLabel;
    btnFiltrar: TSpeedButton;
    edtFiltrar: TEdit;
    tbsCadastro: TTabSheet;
    IbDtstTabela: TIBDataSet;
    DtSrcTabela: TDataSource;
    btbtnCancelar: TBitBtn;
    btbtnSalvar: TBitBtn;
    bvlTool1: TBevel;
    GrpBxDadosNominais: TGroupBox;
    Bevel8: TBevel;
    lblCodigo: TLabel;
    dbCodigo: TDBEdit;
    IbUpdTabela: TIBUpdateSQL;
    ImgList: TImageList;
    bvlToolExpandir: TBevel;
    btbtnSelecionar: TBitBtn;
    bvlTool4: TBevel;
    procedure btbtnFecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgDadosKeyPress(Sender: TObject; var Key: Char);
    procedure dbgDadosDblClick(Sender: TObject);
    procedure DtSrcTabelaStateChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btbtnIncluirClick(Sender: TObject);
    procedure btbtnAlterarClick(Sender: TObject);
    procedure btbtnExcluirClick(Sender: TObject);
    procedure btbtnCancelarClick(Sender: TObject);
    procedure btbtnSalvarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFiltrarClick(Sender: TObject);
    procedure edtFiltrarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btbtnSelecionarClick(Sender: TObject);
    procedure dbgDadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure IbDtstTabelaUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TIBUpdateAction);
  private
    { Private declarations }
    fDisplayFormat  ,
    fNomeTabela     ,
    fCampoCodigo    ,
    fCampoDescricao ,
    fCampoOrdenacao ,
    fWhereAdditional: String;
    fOcorreuErro    ,
    fAbrirTabelaAuto: Boolean;
    sSQL : TStringList;
    fControlFirst : TWinControl;
    procedure CentralizarCodigo;
    procedure SetWhereAdditional(Value : String);
    procedure ClearFieldEmptyStr;
    procedure CarregarControleAcesso;
  public
    { Public declarations }
    property DisplayFormatCodigo : String read fDisplayFormat write fDisplayFormat;
    property NomeTabela : String read fNomeTabela write fNomeTabela;
    property CampoCodigo : String read fCampoCodigo write fCampoCodigo;
    property CampoDescricao : String read fCampoDescricao write fCampoDescricao;
    property CampoOrdenacao : String read fCampoOrdenacao write fCampoOrdenacao;
    property WhereAdditional : String read fWhereAdditional write SetWhereAdditional;
    property OcorreuErro : Boolean read fOcorreuErro;
    property AbrirTabelaAuto : Boolean read fAbrirTabelaAuto write fAbrirTabelaAuto;
    property SQLTabela : TStringList read sSQL;
    property ControlFirstEdit : TWinControl read fControlFirst write fControlFirst;
    procedure UpdateGenerator(const sWhr : String = '');
    procedure RedimencionarBevel(const ToolBar : TToolBar; const bvl : TBevel);
  protected
    procedure FiltarDados; overload;
    procedure FecharAbrirTabela(const Tabela : TIBDataSet; const Vazia : Boolean = FALSE); overload;
    function SelecionarRegistro(var Codigo : Integer; var Descricao : String; const FiltroAdicional : String = '') : Boolean; overload;
  end;

var
  frmGrPadraoCadastro: TfrmGrPadraoCadastro;

implementation

uses UDMBusiness, UGrCampoRequisitado;

{$R *.dfm}

procedure TfrmGrPadraoCadastro.btbtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmGrPadraoCadastro.FormCreate(Sender: TObject);
begin
  inherited;
  DisplayFormatCodigo := '00000';
  NomeTabela      := EmptyStr;
  CampoCodigo     := EmptyStr;
  CampoDescricao  := EmptyStr;
  CampoOrdenacao  := EmptyStr;
  fOcorreuErro    := False;
  AbrirTabelaAuto := False;    //True; alterado em 11-01-2013 Dorivaldo

  if ( IbDtstTabela.Database = nil ) then
    IbDtstTabela.Database := DMBusiness.ibdtbsBusiness;

  sSQL := TStringList.Create;
  sSQL.AddStrings( IbDtstTabela.SelectSQL );

  dbCodigo.TabStop    := not dbCodigo.ReadOnly;
  pgcGuias.ActivePage := tbsTabela;

  ControlFirstEdit := nil;

  CarregarControleAcesso;
end;

procedure TfrmGrPadraoCadastro.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color := clBlack;

  if odd(TDbGrid(Sender).DataSource.DataSet.RecNo) then
    TDBGrid(Sender).Canvas.Brush.Color:= clMenuBar
  else
    TDBGrid(Sender).Canvas.Brush.Color:= clCream;

  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color :=  clMoneyGreen;
      FillRect(Rect);
      Font.Style  := [fsbold]
    end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
end;

procedure TfrmGrPadraoCadastro.dbgDadosKeyPress(Sender: TObject; var Key: Char);
begin
  if ( Key = #13 ) then
  begin
    Key := #0;
    pgcGuias.SelectNextPage(False);
  end
  else
  if ( Key in ['0'..'9', ' ', 'a'..'z', 'A'..'Z'] ) then
  begin
    edtFiltrar.Text := Trim(Key);
    edtFiltrar.SetFocus;
    edtFiltrar.SelStart := Length(edtFiltrar.Text);
  end;
end;

procedure TfrmGrPadraoCadastro.dbgDadosDblClick(Sender: TObject);
begin
  pgcGuias.SelectNextPage(False);
end;

procedure TfrmGrPadraoCadastro.DtSrcTabelaStateChange(Sender: TObject);
begin
  dbgDados.Enabled    := not (IbDtstTabela.State in [dsEdit, dsInsert]);
  grpBxFiltro.Enabled := not (IbDtstTabela.State in [dsEdit, dsInsert]);

  btbtnIncluir.Enabled    := (IbDtstTabela.State in [dsBrowse]);
  btbtnAlterar.Enabled    := (IbDtstTabela.State in [dsBrowse]) and (not IbDtstTabela.IsEmpty);
  btbtnExcluir.Enabled    := (IbDtstTabela.State in [dsBrowse]) and (not IbDtstTabela.IsEmpty);
  btbtnCancelar.Enabled   := (IbDtstTabela.State in [dsEdit, dsInsert]);
  btbtnSalvar.Enabled     := (IbDtstTabela.State in [dsEdit, dsInsert]);
  btbtnLista.Enabled      := (IbDtstTabela.State in [dsBrowse]);
  btbtnFechar.Enabled     := (IbDtstTabela.State in [dsBrowse]) or (not IbDtstTabela.Active);
  btbtnSelecionar.Enabled := (IbDtstTabela.State in [dsBrowse]) and (not IbDtstTabela.IsEmpty);

  DtSrcTabela.AutoEdit   := (IbDtstTabela.State in [dsEdit, dsInsert]);
  if ( DtSrcTabela.AutoEdit ) then
  begin
    fOcorreuErro        := False;
    pgcGuias.ActivePage := tbsCadastro;
    if ( Assigned(ControlFirstEdit) ) then
      ControlFirstEdit.SetFocus;
  end;
end;

procedure TfrmGrPadraoCadastro.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ( IbDtstTabela.Active ) then
    if ( not btbtnFechar.Enabled ) then
    begin
      CanClose := False;
      ShowWarning('Existe registro em edição');
    end;
end;

procedure TfrmGrPadraoCadastro.btbtnIncluirClick(Sender: TObject);
begin
  if not TBitBtn(Sender).Visible then
    Exit;

  if ( not IbDtstTabela.Active ) then
    FecharAbrirTabela(IbDtstTabela, True);

  IbDtstTabela.Append;
end;

procedure TfrmGrPadraoCadastro.btbtnAlterarClick(Sender: TObject);
begin
  if not TBitBtn(Sender).Visible then
    Exit;

  if ( not IbDtstTabela.Active ) then
    Exit;
    
  IbDtstTabela.Edit;
end;

procedure TfrmGrPadraoCadastro.btbtnExcluirClick(Sender: TObject);
begin
  if not TBitBtn(Sender).Visible then
    Exit;

  if ( not IbDtstTabela.Active ) then
    Exit;
  try
    fOcorreuErro := False;
    if ( Application.MessageBox('Deseja excluir o registro selecionado?', 'Excluir', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES ) then
    begin
      IbDtstTabela.Delete;
      IbDtstTabela.ApplyUpdates;
      CommitTransaction;
    end;
  except
    On E : Exception do
    begin
      fOcorreuErro := True;
      ShowError('Erro ao tentar excluir o registro selecionado.' + #13#13 + E.Message);
    end;
  end;
end;

procedure TfrmGrPadraoCadastro.btbtnCancelarClick(Sender: TObject);
begin
  if not TBitBtn(Sender).Visible then
    Exit;

  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    if ( Application.MessageBox('Deseja cancelar a inserção/edição do registro?', 'Cancelar', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES ) then
      IbDtstTabela.Cancel;
end;

procedure TfrmGrPadraoCadastro.btbtnSalvarClick(Sender: TObject);
begin
  if not TBitBtn(Sender).Visible then
    Exit;

  if ( IbDtstTabela.State in [dsEdit, dsInsert] ) then
    try
      ClearFieldEmptyStr;
      if ( CamposRequiridos(Self, TClientDataSet(IbDtstTabela), Self.Caption) ) then
        Exit;

      fOcorreuErro := False;
      if ( Application.MessageBox('Deseja salvar a inserção/edição do registro?', 'Salvar', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES ) then
      begin
        IbDtstTabela.Post;
        IbDtstTabela.ApplyUpdates;
        CommitTransaction;
      end;
    except
      On E : Exception do
      begin
        fOcorreuErro := True;
        ShowWarning('Erro ao tentar salvar registro.' + #13#13 + E.Message);
      end;
    end;
end;

procedure TfrmGrPadraoCadastro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_F2 : if ( btbtnSelecionar.Visible and btbtnSelecionar.Enabled ) then
              btbtnSelecionar.Click;

    VK_ESCAPE : if (IbDtstTabela.State in [dsEdit, dsInsert]) then
                  btbtnCancelar.Click
                else
                if ( pgcGuias.ActivePageIndex <> 0 ) then
                begin
                  pgcGuias.SelectNextPage(True);
                  if ( pgcGuias.ActivePageIndex = 0 ) then
                    dbgDados.SetFocus;
                end
                else
                if ( pgcGuias.ActivePageIndex = 0 ) then
                  if ( btbtnFechar.Enabled ) then
                    btbtnFechar.Click;
    VK_UP : if ( (IbDtstTabela.Active) and (ActiveControl = edtFiltrar) ) then
              IbDtstTabela.Prior;

    VK_DOWN : if ( (IbDtstTabela.Active) and (ActiveControl = edtFiltrar) ) then
                IbDtstTabela.Next;
    else
      CustomKeyDown(Self, Key, Shift);            
  end;
end;

procedure TfrmGrPadraoCadastro.btnFiltrarClick(Sender: TObject);
begin
  FiltarDados;
end;

procedure TfrmGrPadraoCadastro.edtFiltrarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( Key = 13 ) then
    btnFiltrar.Click;
end;

procedure TfrmGrPadraoCadastro.FiltarDados;
begin
  try

    fOcorreuErro := False;
    if (Trim(CampoCodigo) = EmptyStr) or ((Trim(CampoDescricao) = EmptyStr)) then
    begin
      ShowWarning('O nome do campo chave e/ou de descrição não foram informados');
      Abort;
    end;

    with IbDtstTabela, SelectSQL do
    begin
      if ( Trim(CampoOrdenacao) = EmptyStr ) then
        CampoOrdenacao := CampoDescricao;

      Close;
      Clear;
      AddStrings( sSQL );

      if ( Trim(edtFiltrar.Text) <> EmptyStr ) then
        if ( StrToIntDef(Trim(edtFiltrar.Text), 0) > 0 ) then
          Add( 'where ' + CampoCodigo +  ' = ' + Trim(edtFiltrar.Text) )
        else
          Add( 'where (upper(' + CampoDescricao +  ') like ' + QuotedStr('%' + UpperCase(Trim(edtFiltrar.Text)) + '%') +
               '    or upper(' + CampoDescricao +  ') like ' + QuotedStr('%' + UpperCase(FuncoesString.StrRemoveAllAccents(Trim(edtFiltrar.Text))) + '%') + ')');

      if ( fWhereAdditional <> EmptyStr ) then
        if ( Pos('where', SelectSQL.Text) > 0 ) then
          Add( '  and (' + WhereAdditional + ')' )
        else
          Add( 'where (' + WhereAdditional + ')' );

      Add( 'order by ' + CampoOrdenacao );

      Open;

      try
      
        if ( not IsEmpty ) then
          dbgDados.SetFocus
        else
        begin
          ShowWarning('Não existe registros na tabela para este tipo de pesquisa');

          edtFiltrar.SetFocus;
          edtFiltrar.SelectAll;
        end;

      except
      end;

    end;
  except
    On E : Exception do
    begin
      fOcorreuErro := True;
      ShowWarning('Erro ao tentar filtrar registros na tabela.' + #13#13 + E.Message);
    end;
  end;
end;

procedure TfrmGrPadraoCadastro.FecharAbrirTabela(const Tabela : TIBDataSet; const Vazia : Boolean = FALSE);
begin
  with Tabela do
  begin
    Close;
    if ( Vazia ) then
      if ( Pos('where', LowerCase(SelectSQL.Text)) = 0 ) then
        SelectSQL.Add('where 1=0');
    Open;
  end;
end;

function TfrmGrPadraoCadastro.SelecionarRegistro(var Codigo : Integer; var Descricao : String; const FiltroAdicional : String = '') : Boolean;
var
 sCampoCodigo    ,
 sCampoDescricao : String;
begin
  try
    fOcorreuErro     := False;
    fWhereAdditional := Trim(FiltroAdicional);

    if (Trim(CampoCodigo) = EmptyStr) or ((Trim(CampoDescricao) = EmptyStr)) then
    begin
      ShowWarning('O nome do campo chave e/ou de descrição não foram informados');
      Abort;
    end;

    if ( pos('.', CampoCodigo) > 0 ) then
      sCampoCodigo := Copy(CampoCodigo, pos('.', CampoCodigo) + 1, Length(CampoCodigo))
    else
      sCampoCodigo := Trim(CampoCodigo);

    if ( pos('.', CampoDescricao) > 0 ) then
      sCampoDescricao := Copy(CampoDescricao, pos('.', CampoDescricao) + 1, Length(CampoDescricao))
    else
      sCampoDescricao := Trim(CampoDescricao);

    Self.btbtnSelecionar.Visible := True;

    Result := (ShowModal = mrOk) and (not IbDtstTabela.IsEmpty);

    if ( Result ) then
    begin
      Codigo    := IbDtstTabela.FieldByName(sCampoCodigo).AsInteger;
      Descricao := IbDtstTabela.FieldByName(sCampoDescricao).AsString;
    end
    else
    begin
      Codigo    := 0;
      Descricao := EmptyStr;
    end;
  except
    On E : Exception do
    begin
      fOcorreuErro := True;
      ShowWarning('Erro ao tentar selecionar o registros da tabela.' + #13#13 + E.Message);
    end;
  end;
end;

procedure TfrmGrPadraoCadastro.FormShow(Sender: TObject);
begin
  inherited;
  RedimencionarBevel(tlbBotoes, bvlToolExpandir);
  CentralizarCodigo;

  if ( not IbDtstTabela.Active ) then
  begin
    if ( AbrirTabelaAuto ) then
    begin
      IbDtstTabela.Close;
      if ( WhereAdditional <> EmptyStr ) then

      if ( Pos('where', IbDtstTabela.SelectSQL.Text) > 0 ) then
        IbDtstTabela.SelectSQL.Add( '  and (' + WhereAdditional + ')' )
      else
        IbDtstTabela.SelectSQL.Add( 'where (' + WhereAdditional + ')' );

      if ( (Pos('order by', IbDtstTabela.SelectSQL.Text) = 0) and (CampoOrdenacao <> EmptyStr) ) then
        IbDtstTabela.SelectSQL.Add( 'order by ' + CampoOrdenacao );

      IbDtstTabela.Open;
    end;

    DtSrcTabelaStateChange( DtSrcTabela );
  end
  else
  if ( not AbrirTabelaAuto ) then
    IbDtstTabela.Close;

  if ( (pgcGuias.ActivePage = tbsTabela) and (edtFiltrar.Visible) and (edtFiltrar.Enabled) ) then
    edtFiltrar.SetFocus;
end;

procedure TfrmGrPadraoCadastro.RedimencionarBevel(const ToolBar : TToolBar; const bvl: TBevel);
var
  I ,
  T : Integer;
begin
  T := 0;
  if  Assigned(ToolBar) and Assigned(bvl) then
  begin
    for I := 0 to ComponentCount - 1 do
    begin
      if ( TControl(Components[I]).Parent = ToolBar ) then
      begin
        if ( Components[I] is TBitBtn ) then
          if ( TBitBtn(Components[I]).Visible ) then
            T := T + TBitBtn(Components[I]).Width;

        if ( Components[I] is TBevel ) then
          if ( TBevel(Components[I]).Visible ) then
            T := T + TBevel(Components[I]).Width;
      end;
    end;

    T := ToolBar.Width - (T - bvl.Width);
    bvl.Width := T;
  end;
end;

procedure TfrmGrPadraoCadastro.CentralizarCodigo;
var
  sCampoCodigo : String;
begin
  if ( Trim(CampoCodigo) = EmptyStr ) then
    Exit;
    
  if ( dbgDados.Columns.Count > 0 ) then
  begin
    if ( pos('.', CampoCodigo) > 0 ) then
      sCampoCodigo := Copy(CampoCodigo, pos('.', CampoCodigo) + 1, Length(CampoCodigo))
    else
      sCampoCodigo := Trim(CampoCodigo);

    if ( StrToCurrDef(IbDtstTabela.FieldByName(sCampoCodigo).AsString, 0) = 0 ) then
      Exit;

    dbgDados.Columns[0].Alignment       := taCenter;
    dbgDados.Columns[0].Title.Alignment := taCenter;

    IbDtstTabela.FieldByName(sCampoCodigo).Alignment := taCenter;
    IbDtstTabela.FieldByName(sCampoCodigo).Required  := False;
    TIntegerField(IbDtstTabela.FieldByName(sCampoCodigo)).DisplayFormat := DisplayFormatCodigo;
  end;
end;

procedure TfrmGrPadraoCadastro.SetWhereAdditional(Value : String);
begin
  fWhereAdditional := Trim(Value);
end;

procedure TfrmGrPadraoCadastro.btbtnSelecionarClick(Sender: TObject);
begin
  if not TBitBtn(Sender).Visible then
    Exit;

  if ( not IbDtstTabela.Active ) then
    Exit;
  ModalResult := mrOk;
end;

procedure TfrmGrPadraoCadastro.UpdateGenerator(const sWhr : String = '');
var
  sGenerator ,
  sTabela    ,
  sCampoCodigo : String;
begin
  sGenerator   := EmptyStr;
  sTabela      := EmptyStr;
  sCampoCodigo := EmptyStr;

  if ( (CampoCodigo = EmptyStr) and (Trim(IbDtstTabela.GeneratorField.Field) <> EmptyStr) ) then
    CampoCodigo := IbDtstTabela.GeneratorField.Field;

  sGenerator   := IbDtstTabela.GeneratorField.Generator;
  sTabela      := NomeTabela;
  if ( pos('.', CampoCodigo) > 0 ) then
    sCampoCodigo := Copy(CampoCodigo, pos('.', CampoCodigo) + 1, Length(CampoCodigo))
  else
    sCampoCodigo := Trim(CampoCodigo);


  if ( (sGenerator <> EmptyStr) and (sTabela <> EmptyStr) and (sCampoCodigo <> EmptyStr) ) then
    UpdateSequence(sGenerator, sTabela, sCampoCodigo, sWhr);
end;

procedure TfrmGrPadraoCadastro.dbgDadosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  // Impede a exclusão de um registro em um DBGRID através das teclas CTRL+DEL
  if (Shift = [ssCtrl]) and (Key = 46) Then
    Key := 0;
end;

procedure TfrmGrPadraoCadastro.ClearFieldEmptyStr;
var
  I : Integer;
begin

  for I := 0 to IbDtstTabela.Fields.Count - 1 do
    if ( IbDtstTabela.Fields[I].Required ) then
      if ( Trim(IbDtstTabela.Fields[I].AsString) = EmptyStr ) then
        IbDtstTabela.Fields[I].Clear;
        
end;

procedure TfrmGrPadraoCadastro.IbDtstTabelaUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TIBUpdateAction);
begin
  Case UpdateKind of
    ukModify:
      ShowError('Erro ao tentar gravar atualização do registro.' + #13#13 + E.Message);

    ukInsert:
      ShowError('Erro ao tentar gravar novo registro.' + #13#13 + E.Message);
      
    ukDelete:
      ShowError('Erro ao tentar gravar excluir registro.' + #13#13 + E.Message);
  end;
end;

procedure TfrmGrPadraoCadastro.CarregarControleAcesso;
var
  I : Integer;
begin
  for I := 0 to ComponentCount - 1 do
    if Components[I] is TEvUserAccess then
    begin
      RegistrarControleAcesso(Self, TEvUserAccess(Components[I]));
      GetControleAcesso(Self, TEvUserAccess(Components[I]));
    end;
end;

end.
