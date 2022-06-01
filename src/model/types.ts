export type ContractInstance = {
  id: string;
  walletId: string;
  tag: string;
};

export type ContractDefinition = {
  schema: Definition;
};

export type Definition = string | number | DefinitionConstructor | DefinitionRecord;

type DefinitionRecord = {
  tag: string;
  [key: string]: Definition;
};

type DefinitionConstructor = {
  tag: string;
  contents?: Definition | Array<Definition>;
};
