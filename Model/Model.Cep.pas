unit Model.Cep;

interface

type
  TCep = class
  private
    Fcep      : string;
    Fendereco : string;
    Fbairro   : string;
    Fcidade   : string;
    Fuf       : string;

  public
    property cep       : string   read Fcep       write Fcep;
    property endereco  : string   read Fendereco  write Fendereco;
    property bairro    : string   read Fbairro    write Fbairro;
    property cidade    : string   read Fcidade    write Fcidade;
    property uf        : string   read Fuf        write Fuf;
  end;

implementation

end.
