export type GetInstancesResponse = ContractInstance[];

export type ContractInstance = {
  cicWallet: {
    prettyWalletName: string | null;
    getWalletId: string;
  };
  cicCurrentState: {};
  cicContract: {
    unContractInstanceId: string;
  };
  cicStatus: string;
  cicDefinition: {
    tag: string;
  };
};

export type ContractDefinition = {
  csrSchemas: [];
  csrDefinition: Definition;
};

export type Definition = string | number | DefinitionConstructor | DefinitionRecord;

type DefinitionRecord = {
  tag: string;
  [key: string]: Definition;
};

type DefinitionConstructor = {
  tag: string;
  contents?: Definition | Definition[];
};
