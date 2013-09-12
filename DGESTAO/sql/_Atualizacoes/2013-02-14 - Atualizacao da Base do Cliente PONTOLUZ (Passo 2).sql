execute block
as
  declare variable ano Smallint;
  declare variable cod Integer;
  declare variable seq Smallint;
  declare variable total_bruto dmn_money;
  declare variable total_descontos dmn_money;
  declare variable total_liquido dmn_money;
begin
  for
    Select
        i.ano
      , i.codcontrol
      , i.seq
      , coalesce(i.qtde, 0) * coalesce(i.punit, 0)
      , coalesce(i.qtde, 0) * coalesce(i.desconto_valor, 0)
    from TVENDASITENS i
    into
        ano
      , cod
      , seq
      , total_bruto
      , total_descontos
  do
  begin

    total_liquido = :total_bruto - :total_descontos;

    Update TVENDASITENS x Set
        x.total_bruto    = :total_bruto
      , x.total_desconto = :total_descontos
      , x.total_liquido  = :total_liquido
    where x.ano = :ano
      and x.codcontrol = :cod
      and x.seq = :seq;

  end 
end 