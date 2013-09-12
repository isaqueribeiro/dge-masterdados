execute block
as
  declare variable ano Smallint;
  declare variable cod Integer;
  declare variable Total_Bruto dmn_money;
  declare variable Total_Desconto dmn_money;
  declare variable Total_Liquido dmn_money;
begin
  for
    Select
        v.ano
      , v.codcontrol
      , coalesce(v.desconto, 0)
      , coalesce(v.totalvenda, 0)
    from TBVENDAS v
    into
        ano
      , cod
      , Total_Desconto
      , Total_Liquido
  do
  begin

    Total_Bruto = :Total_Desconto + :Total_Liquido;

    Update TBVENDAS x Set
      x.totalvenda_bruta = :Total_bruto
    where x.ano = :ano
      and x.codcontrol = :cod;

  end 
end 