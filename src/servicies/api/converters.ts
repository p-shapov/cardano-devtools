import * as M from 'model/types';
import * as S from './types';

export const convertInstances = (data: S.GetInstancesResponse): M.ContractInstance[] => {
  return data.map(i => ({
    id: i.cicContract.unContractInstanceId,
    tag: i.cicDefinition.tag,
    walletId: i.cicWallet.getWalletId,
  }));
};

export const convertDefinitions = (data: S.ContractDefinition[]): M.ContractDefinition[] => {
  return data.map(d => ({
    schema: d.csrDefinition,
  }));
};
